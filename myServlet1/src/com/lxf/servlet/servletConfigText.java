package com.lxf.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class servletConfigText extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * The doGet method of the servlet. <br>
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//获取servletconfig参数
		
	}

	/**
	 */
	public void init() throws ServletException {
		// Put your code here
		System.out.println("设置的启动时就加载的servlet【servletConfigText】,初始化各种参数等或者全局变量数据库配置等。");
		String codeF =this.getServletConfig().getInitParameter("encoding");
		System.out.println("encoding="+codeF);
		String myname = this.getInitParameter("myname");;
		System.out.println("myname="+myname);
	}

}
