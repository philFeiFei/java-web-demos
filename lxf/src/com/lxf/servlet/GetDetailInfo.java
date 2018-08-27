package com.lxf.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetDetailInfo extends HttpServlet {
	  private String message;

	  public void init() throws ServletException
	  {
	      // æ‰§è¡Œå¿…éœ€çš„åˆ�å§‹åŒ–
	      message = "Hello JSP";
	      System.out.println("init");
	      
	  }

	  public void doGet(HttpServletRequest request,
	                    HttpServletResponse response)
	            throws ServletException, IOException
	  {
	      // è®¾ç½®å“�åº”å†…å®¹ç±»åž‹
	      response.setContentType("text/html");

	      // å®žé™…çš„é€»è¾‘æ˜¯åœ¨è¿™é‡Œ
	      PrintWriter out = response.getWriter();
	      out.println("<h1>" + message + "</h1>");
	      System.out.println("doget");
	      //ä¸ºå��å­—å’Œå§“æ°�åˆ›å»º Cookie      
	        /*Cookie name = new Cookie("name",
	                URLEncoder.encode(request.getParameter("name"), "UTF-8")); // ä¸­æ–‡è½¬ç �
	        Cookie url = new Cookie("url",
	                      request.getParameter("url"));
	        
	        // ä¸ºä¸¤ä¸ª Cookie è®¾ç½®è¿‡æœŸæ—¥æœŸä¸º 24 å°�æ—¶å�Ž
	        name.setMaxAge(60*60*24); 
	        url.setMaxAge(60*60*24); 
	        
	        // åœ¨å“�åº”å¤´ä¸­æ·»åŠ ä¸¤ä¸ª Cookie
	        response.addCookie( name );
	        response.addCookie( url );*/
	        
	        // è®¾ç½®å“�åº”å†…å®¹ç±»åž‹
	        response.setContentType("text/html;charset=UTF-8");
	        String docType = "<!DOCTYPE html>\n";
	        PrintWriter out1 = response.getWriter();
	        Cookie[] c =  request.getCookies();
	        for(int i = 0; i < c.length; i ++){
	        	String name = c[i].getName();
	        	String value = c[i].getValue();
	        	System.out.println("name="+name+";value="+value);
	        	 out1.println(docType +
	 	                "<html>\n" +
	 	                "<body bgcolor=\"#f0f0f0\">\n" +
	 	                "<ul>\n" +
	 	                "  <li><b>cookie Nameï¼š</b>ï¼š"
	 	                + name + "</li>" +
	 	                "  <li><b>cookie Valueï¼š</b>ï¼š"
	 	                + value + "</li>" +
	 	                "</ul>\n" +
	 	                "</body></html>");
	        }
	        
	       
	        String title = "è®¾ç½® Cookie å®žä¾‹";
	       
	        out1.println(docType +
	                "<html>\n" +
	                "<head><title>" + title + "</title></head>\n" +
	                "<body bgcolor=\"#f0f0f0\">\n" +
	                "<h1 align=\"center\">" + title + "</h1>\n" +
	                "<ul>\n" +
	                "  <li><b>ç«™ç‚¹å��ï¼š</b>ï¼š"
	                + request.getParameter("name") + "\n</li>" +
	                "  <li><b>ç«™ç‚¹ URLï¼š</b>ï¼š"
	                + request.getParameter("url") + "\n</li>" +
	                "</ul>\n" +
	                "</body></html>");
	  }
	  
	  public void destroy()
	  {
	      // ä»€ä¹ˆä¹Ÿä¸�å�š
		  message = "destroy";
		  System.out.println("destroy");
	  }
}
