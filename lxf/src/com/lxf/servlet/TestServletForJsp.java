package com.lxf.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServletForJsp extends HttpServlet
{
  public void destroy()
  {
    super.destroy();
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String name = request.getParameter("name");
    if ("张三".equals(name)) {
      request.setAttribute("company", "山东浪潮股份有限公司");
      request.setAttribute("home", "济南很大名都");
    } else if ("李四".equals(name)) {
      request.setAttribute("company", "山东地纬股份邮箱公司");
      request.setAttribute("home", "山东凤凰城 ");
    } else {
      request.setAttribute("company", "请输入正确人员例如'张三''李四'");
      request.setAttribute("home", "请输入正确人员");
    }

    request.getRequestDispatcher("/lxfjsp/ajax/detailInfo.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    doGet(request, response);
  }

  public void init()
    throws ServletException
  {
  }
}