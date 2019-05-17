package com.lxf.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lxf.bean.Employee;

public class UploadInVue extends HttpServlet {
	  private String message;

	  public void init() throws ServletException
	  {
	      // æ‰§è¡Œå¿…éœ€çš„åˆ�å§‹åŒ–
	      message = "Hello JSP";
	      System.out.println("init");
	      
	  }
	  @SuppressWarnings({ "rawtypes", "unchecked" })
	  public void doGet(HttpServletRequest request,
	                    HttpServletResponse response)
	            throws ServletException, IOException{
		  
		  response.setHeader("Access-Control-Allow-Origin", "*");
		  response.setContentType("text/html;charset=UTF-8");
		  HashMap result = new HashMap();
		  result.put("tdurl", "http://47.104.29.255/hms/td.jpg");
		  HashMap resp = new HashMap();
		  resp.put("result",result);
		  String jsonStr = new Gson().toJson(resp);
		    response.getWriter().write(jsonStr);
		 
	  }
	  public void doPost(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException
			  {
			    doGet(request, response);
			  }
	  
	  public void destroy()
	  {
	      // ä»€ä¹ˆä¹Ÿä¸�å�š
		  message = "destroy";
		  System.out.println("destroy");
	  }
}
