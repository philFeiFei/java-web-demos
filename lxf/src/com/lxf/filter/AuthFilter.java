package com.lxf.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthFilter
  implements Filter
{
  public void destroy()
  {
  }

  public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
    throws IOException, ServletException
  {
    String str1 = "这是AuthFilter";

    System.out.println(str1);
    arg1.setContentType("text/html");
    arg1.setCharacterEncoding("GBK");
    PrintWriter pw = arg1.getWriter();
    String str = "这是AuthFilter";
    pw.print("<h1>" + str + "</h1>");

    arg2.doFilter(arg0, arg1);
  }

  public void init(FilterConfig arg0) throws ServletException
  {
    String name = arg0.getInitParameter("userName");
    System.out.println("用户名是：" + name);
  }
}