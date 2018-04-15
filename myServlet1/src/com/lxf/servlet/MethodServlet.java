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
 * 1、测试前台调用serlet，并调用某个方法。前台请求中'method'只是一个参数命而已。。
 * 
 * 
 * @author lixianfu
 *
 */
@SuppressWarnings("serial")
public class MethodServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("req.getMethod()="+req.getMethod());
		String thod = req.getParameter("method");
		if("myMethod".equals(thod)){
			this.myMethod();
		}else{
			System.out.println("没有匹配的方法");
		}
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("servlet doPost()方法");
		this.doGet(req, resp);
	}

	
	public void myMethod(){
		System.out.println("进入我的方法！！！！");
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("servlet【method】 destroy()方法");
		super.destroy();
	}

     
	
	
}
