/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.catalina.startup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.annotation.security.DeclareRoles;
import javax.annotation.security.RunAs;
import javax.servlet.ServletSecurityElement;
import javax.servlet.annotation.ServletSecurity;

import org.apache.catalina.Container;
import org.apache.catalina.Context;
import org.apache.catalina.Wrapper;
import org.apache.catalina.core.ApplicationServletRegistration;
import org.apache.catalina.deploy.ContextEnvironment;
import org.apache.catalina.deploy.ContextResource;
import org.apache.catalina.deploy.ContextResourceEnvRef;
import org.apache.catalina.deploy.ContextService;
import org.apache.catalina.deploy.FilterDef;
import org.apache.catalina.deploy.MessageDestinationRef;
import org.apache.catalina.util.Introspection;
import org.apache.tomcat.util.res.StringManager;

/**
 * <strong>AnnotationSet</strong> for processing the annotations of the web
 * application classes (<code>/WEB-INF/classes</code> and
 * <code>/WEB-INF/lib</code>).
 */
public class WebAnnotationSet {

    private static final String SEPARATOR = "/";

    /**
     * The string resources for this package.
     */
    protected static final StringManager sm = StringManager.getManager(Constants.Package);


    // ---------------------------------------------------------- Public Methods

    /**
     * Process the annotations on a context.
     *
     * @param context The context which will have its annotations processed
     */
    public static void loadApplicationAnnotations(Context context) {
        loadApplicationListenerAnnotations(context);
        loadApplicationFilterAnnotations(context);
        loadApplicationServletAnnotations(context);
    }


    // ------------------------------------------------------- Protected Methods

    /**
     * Process the annotations for the listeners.
     *
     * @param context The context which will have its annotations processed
     */
    protected static void loadApplicationListenerAnnotations(Context context) {
        String[] applicationListeners = context.findApplicationListeners();
        for (String className : applicationListeners) {
            Class<?> clazz = Introspection.loadClass(context, className);
            if (clazz == null) {
                continue;
            }

            loadClassAnnotation(context, clazz);
            loadFieldsAnnotation(context, clazz);
            loadMethodsAnnotation(context, clazz);
        }
    }


    /**
     * Process the annotations for the filters.
     *
     * @param context The context which will have its annotations processed
     */
    protected static void loadApplicationFilterAnnotations(Context context) {
        FilterDef[] filterDefs = context.findFilterDefs();
        for (FilterDef filterDef : filterDefs) {
            Class<?> clazz = Introspection.loadClass(context, filterDef.getFilterClass());
            if (clazz == null) {
                continue;
            }

            loadClassAnnotation(context, clazz);
            loadFieldsAnnotation(context, clazz);
            loadMethodsAnnotation(context, clazz);
        }
    }


    /**
     * Process the annotations for the servlets.
     *
     * @param context The context which will have its annotations processed
     */
    protected static void loadApplicationServletAnnotations(Context context) {

        Container[] children = context.findChildren();
        for (Container child : children) {
            if (child instanceof Wrapper) {

                Wrapper wrapper = (Wrapper) child;
                if (wrapper.getServletClass() == null) {
                    continue;
                }

                Class<?> clazz = Introspection.loadClass(context, wrapper.getServletClass());
                if (clazz == null) {
                    continue;
                }

                loadClassAnnotation(context, clazz);
                loadFieldsAnnotation(context, clazz);
                loadMethodsAnnotation(context, clazz);

                /* Process RunAs annotation which can be only on servlets.
                 * Ref JSR 250, equivalent to the run-as element in
                 * the deployment descriptor
                 */
                RunAs runAs = clazz.getAnnotation(RunAs.class);
                if (runAs != null) {
                    wrapper.setRunAs(runAs.value());
                }

                // Process ServletSecurity annotation
                ServletSecurity servletSecurity = clazz.getAnnotation(ServletSecurity.class);
                if (servletSecurity != null) {
                    context.addServletSecurity(
                            new ApplicationServletRegistration(wrapper, context),
                            new ServletSecurityElement(servletSecurity));
                }
            }
        }
    }


    /**
     * Process the annotations on a context for a given className.
     *
     * @param context The context which will have its annotations processed
     * @param clazz The class to examine for Servlet annotations
     */
    protected static void loadClassAnnotation(Context context,
            Class<?> clazz) {
        /* Process Resource annotation.
         * Ref JSR 250
         */
        Resource resourceAnnotation = clazz.getAnnotation(Resource.class);
        if (resourceAnnotation != null) {
            addResource(context, resourceAnnotation);
        }
        /* Process Resources annotation.
         * Ref JSR 250
         */
        Resources resourcesAnnotation = clazz.getAnnotation(Resources.class);
        if (resourcesAnnotation != null && resourcesAnnotation.value() != null) {
            for (Resource resource : resourcesAnnotation.value()) {
                addResource(context, resource);
            }
        }
        /* Process EJB annotation.
         * Ref JSR 224, equivalent to the ejb-ref or ejb-local-ref
         * element in the deployment descriptor.
        {
            EJB annotation = clazz.getAnnotation(EJB.class);
            if (annotation != null) {

                if ((annotation.mappedName().length() == 0)
                        || annotation.mappedName().equals("Local")) {

                    ContextLocalEjb ejb = new ContextLocalEjb();

                    ejb.setName(annotation.name());
                    ejb.setType(annotation.beanInterface().getCanonicalName());
                    ejb.setDescription(annotation.description());

                    ejb.setHome(annotation.beanName());

                    context.getNamingResources().addLocalEjb(ejb);

                } else if (annotation.mappedName().equals("Remote")) {

                    ContextEjb ejb = new ContextEjb();

                    ejb.setName(annotation.name());
                    ejb.setType(annotation.beanInterface().getCanonicalName());
                    ejb.setDescription(annotation.description());

                    ejb.setHome(annotation.beanName());

                    context.getNamingResources().addEjb(ejb);

                }
            }
        }
        */
        /* Process WebServiceRef annotation.
         * Ref JSR 224, equivalent to the service-ref element in
         * the deployment descriptor.
         * The service-ref registration is not implemented
        {
            WebServiceRef annotation = clazz
                    .getAnnotation(WebServiceRef.class);
            if (annotation != null) {
                ContextService service = new ContextService();

                service.setName(annotation.name());
                service.setWsdlfile(annotation.wsdlLocation());

                service.setType(annotation.type().getCanonicalName());

                if (annotation.value() == null)
                    service.setServiceinterface(annotation.type()
                            .getCanonicalName());

                if (annotation.type().getCanonicalName().equals("Service"))
                    service.setServiceinterface(annotation.type()
                            .getCanonicalName());

                if (annotation.value().getCanonicalName().equals("Endpoint"))
                    service.setServiceendpoint(annotation.type()
                            .getCanonicalName());

                service.setPortlink(annotation.type().getCanonicalName());

                context.getNamingResources().addService(service);
            }
        }
        */
        /* Process DeclareRoles annotation.
         * Ref JSR 250, equivalent to the security-role element in
         * the deployment descriptor
         */
        DeclareRoles declareRolesAnnotation = clazz.getAnnotation(DeclareRoles.class);
        if (declareRolesAnnotation != null && declareRolesAnnotation.value() != null) {
            for (String role : declareRolesAnnotation.value()) {
                context.addSecurityRole(role);
            }
        }
    }


    protected static void loadFieldsAnnotation(Context context, Class<?> clazz) {
        // Initialize the annotations
        Field[] fields = Introspection.getDeclaredFields(clazz);
        if (fields != null && fields.length > 0) {
            for (Field field : fields) {
                Resource annotation = field.getAnnotation(Resource.class);
                if (annotation != null) {
                    String defaultName = clazz.getName() + SEPARATOR + field.getName();
                    Class<?> defaultType = field.getType();
                    addResource(context, annotation, defaultName, defaultType);
                }
            }
        }
    }


    protected static void loadMethodsAnnotation(Context context, Class<?> clazz) {
        // Initialize the annotations
        Method[] methods = Introspection.getDeclaredMethods(clazz);
        if (methods != null && methods.length > 0) {
            for (Method method : methods) {
                Resource annotation = method.getAnnotation(Resource.class);
                if (annotation != null) {
                    if (!Introspection.isValidSetter(method)) {
                        throw new IllegalArgumentException(sm.getString(
                                "webAnnotationSet.invalidInjection"));
                    }

                    String defaultName = clazz.getName() + SEPARATOR +
                            Introspection.getPropertyName(method);

                    Class<?> defaultType = (method.getParameterTypes()[0]);
                    addResource(context, annotation, defaultName, defaultType);
                }
            }
        }
    }


    /**
     * Process a Resource annotation to set up a Resource.
     * Ref JSR 250, equivalent to the resource-ref,
     * message-destination-ref, env-ref, resource-env-ref
     * or service-ref element in the deployment descriptor.
     * @param context The context which will have its annotations processed
     * @param annotation The annotation that was found
     */
    protected static void addResource(Context context, Resource annotation) {
        addResource(context, annotation, null, null);
    }


    protected static void addResource(Context context, Resource annotation, String defaultName,
            Class<?> defaultType) {
        String name = getName(annotation, defaultName);
        String type = getType(annotation, defaultType);

        if (type.equals("java.lang.String") ||
                type.equals("java.lang.Character") ||
                type.equals("java.lang.Integer") ||
                type.equals("java.lang.Boolean") ||
                type.equals("java.lang.Double") ||
                type.equals("java.lang.Byte") ||
                type.equals("java.lang.Short") ||
                type.equals("java.lang.Long") ||
                type.equals("java.lang.Float")) {

            // env-ref element
            ContextEnvironment resource = new ContextEnvironment();

            resource.setName(name);
            resource.setType(type);

            resource.setDescription(annotation.description());

            resource.setValue(annotation.mappedName());

            context.getNamingResources().addEnvironment(resource);

        } else if (type.equals("javax.xml.rpc.Service")) {

            // service-ref element
            ContextService service = new ContextService();

            service.setName(name);
            service.setWsdlfile(annotation.mappedName());

            service.setType(type);
            service.setDescription(annotation.description());

            context.getNamingResources().addService(service);

        } else if (type.equals("javax.sql.DataSource") ||
                type.equals("javax.jms.ConnectionFactory") ||
                type.equals("javax.jms.QueueConnectionFactory") ||
                type.equals("javax.jms.TopicConnectionFactory") ||
                type.equals("javax.mail.Session") ||
                type.equals("java.net.URL") ||
                type.equals("javax.resource.cci.ConnectionFactory") ||
                type.equals("org.omg.CORBA_2_3.ORB") ||
                type.endsWith("ConnectionFactory")) {

            // resource-ref element
            ContextResource resource = new ContextResource();

            resource.setName(name);
            resource.setType(type);

            if (annotation.authenticationType() == Resource.AuthenticationType.CONTAINER) {
                resource.setAuth("Container");
            } else if (annotation.authenticationType() == Resource.AuthenticationType.APPLICATION) {
                resource.setAuth("Application");
            }

            resource.setScope(annotation.shareable() ? "Shareable" : "Unshareable");
            resource.setProperty("mappedName", annotation.mappedName());
            resource.setDescription(annotation.description());

            context.getNamingResources().addResource(resource);

        } else if (type.equals("javax.jms.Queue") ||
                type.equals("javax.jms.Topic")) {

            // message-destination-ref
            MessageDestinationRef resource = new MessageDestinationRef();

            resource.setName(name);
            resource.setType(type);

            resource.setUsage(annotation.mappedName());
            resource.setDescription(annotation.description());

            context.getNamingResources().addMessageDestinationRef(resource);

        } else {
            /*
             * General case. Also used for:
             * - javax.resource.cci.InteractionSpec
             * - javax.transaction.UserTransaction
             */

            // resource-env-ref
            ContextResourceEnvRef resource = new ContextResourceEnvRef();

            resource.setName(name);
            resource.setType(type);

            resource.setProperty("mappedName", annotation.mappedName());
            resource.setDescription(annotation.description());

            context.getNamingResources().addResourceEnvRef(resource);
        }
    }


    private static String getType(Resource annotation, Class<?> defaultType) {
        Class<?> type = annotation.type();
        if (type == null || type.equals(Object.class)) {
            if (defaultType != null) {
                type = defaultType;
            }
        }
        return Introspection.convertPrimitiveType(type).getCanonicalName();
    }


    private static String getName(Resource annotation, String defaultName) {
        String name = annotation.name();
        if (name == null || name.equals("")) {
            if (defaultName != null) {
                name = defaultName;
            }
        }
        return name;
    }
}