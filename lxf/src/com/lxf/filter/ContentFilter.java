package com.lxf.filter;

import java.io.IOException;
import java.io.PrintStream;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ContentFilter
  implements Filter
{
  public void destroy()
  {
  }

  public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain fchain)
    throws IOException, ServletException
  {
    System.out.println("This is the second filter doFilter() ");
    fchain.doFilter(arg0, arg1);
  }

  public void init(FilterConfig arg0) throws ServletException
  {
    System.out.println("This is the second filter ContentFilter init()");
  }
}