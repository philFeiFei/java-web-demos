package com.lxf.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 1、测试serverlet返回jsp页面，及后台控制参数传递等。
 * 2、测试生命周期，通过后台打印输出的信息观察。
 * 
 * @author lixianfu
 *
 */
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//req.setCharacterEncoding("UTF-8");//提前设置编码格式，这样就不会乱码了。
		System.out.println("servlet doGet()方法");
		int aaa = 111111;
		//测试session
		HttpSession s = req.getSession();
		s.setAttribute("bbb", "session设置的值");
		
		//方式一，往前台跳转页面
		RequestDispatcher rd = req.getRequestDispatcher("myLogin/main.jsp");//后面加入参数，可以传入到前台。但是req.setAttribute为啥没用呢。
		req.setAttribute("aaa", aaa);
		req.setAttribute("bbb", "request设置的值");
		rd.forward(req, resp);
		//方式二，往前台跳转页面
		//resp.sendRedirect("myLogin/main.jsp?text="+text+"&aaa="+aaa);//后面加入参数，可以传入到前台
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("servlet doPost()方法");
		this.doGet(req, resp);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("servletinit()进行了初始化");
		super.init();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("servletinit(config)进行了初始化");
		super.init(config);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("servlet【loginServlet】 destroy()方法");
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("servlet service()方法");
		this.doGet(arg0, arg1);
	}
	
	public void myMthod(){
		System.out.println("进入我的方法！！！！");
	}

     
	
	
}
