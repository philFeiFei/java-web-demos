package com.lxf.servlet;

import com.google.gson.Gson;
import com.lxf.bean.Employee;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetEmployeeInfo extends HttpServlet
{
  public void destroy()
  {
    super.destroy();
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setCharacterEncoding("UTF-8");

    String operate = request.getParameter("operate");
    String displayName = request.getParameter("displayName");

    if ("query".equals(operate)) {
      try {
        String json = query(displayName);
        response.getWriter().write(json);
      }
      catch (Exception e) {
        e.printStackTrace();
      }
    } else if ("delete".equals(operate)) {
      String associateId = request.getParameter("associateId");
      int i = 0;
      try {
        i = delete(associateId);
      }
      catch (Exception e) {
        e.printStackTrace();
      }
      response.getWriter().write(i);
    } else if ("update".equals(operate)) {
      String associateId = request.getParameter("associateId");
      String name = request.getParameter("name");
      String birthDate = request.getParameter("birthDate");
      String employmentDate = request.getParameter("employmentDate");
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
      int i = 0;
      try {
        i = update(name, birthDate, employmentDate, firstName, lastName, associateId);
      }
      catch (Exception e) {
        e.printStackTrace();
      }
      response.getWriter().write(i);
    } else if ("add".equals(operate))
    {
      String name = request.getParameter("name");
      String birthDate = request.getParameter("birthDate");
      String employmentDate = request.getParameter("employmentDate");
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
      int i = 0;
      try {
        i = add(name, birthDate, employmentDate, firstName, lastName);
      }
      catch (Exception e) {
        e.printStackTrace();
      }
      response.getWriter().write(i);
    } else {
      request.setAttribute("message", "请进行正确的操作");
    }
  }

  private int add(String name, String birthDate, String employmentDate, String firstName, String lastName) throws Exception, SQLException {
    Connection dbConn = getConnection();
    StringBuffer sb = new StringBuffer();
    sb.append("insert into  elm.eas_hr_personal (display_Name,birthDate,employmentdate,firstName,lastName)");
    sb.append(" values(?,?,?,?,?)");

    PreparedStatement ps = dbConn.prepareStatement(sb.toString());
    ps.setString(1, name);
    ps.setString(2, birthDate);
    ps.setString(3, employmentDate);
    ps.setString(4, firstName);
    ps.setString(5, lastName);
    int i = ps.executeUpdate();
    return i;
  }

  private int update(String name, String birthDate, String employmentDate, String firstName, String lastName, String associateId) throws Exception, SQLException
  {
    Connection dbConn = getConnection();
    StringBuffer sb = new StringBuffer();
    sb.append("update elm.eas_hr_personal set display_Name = ? ,");
    sb.append(" birthDate = ? ,employmentdate = ? ,firstName = ? ,lastName = ?  ");
    sb.append(" where associate_Id = ?  ");

    PreparedStatement ps = dbConn.prepareStatement(sb.toString());
    ps.setString(1, name);
    ps.setString(2, birthDate);
    ps.setString(3, employmentDate);
    ps.setString(4, firstName);
    ps.setString(5, lastName);
    ps.setString(6, associateId);
    int i = ps.executeUpdate();
    return i;
  }

  private int delete(String associateId) throws Exception, SQLException {
    Connection dbConn = getConnection();
    StringBuffer sb = new StringBuffer();
    sb.append("delete from  elm.eas_hr_personal");
    sb.append(" where associate_Id = ?  ");

    PreparedStatement ps = dbConn.prepareStatement(sb.toString());
    ps.setString(1, associateId);
    int i = ps.executeUpdate();
    return i;
  }

  private String query(String displayName) throws Exception
  {
    Connection dbConn = getConnection();

    StringBuffer sb = new StringBuffer();
    sb.append("select * ");
    sb.append(" from elm.eas_hr_personal");
    sb.append(" where 1=1");
    if ((displayName != null) && (displayName.trim().length() > 0)) {
      sb.append("  and display_name like ? ");
    }

    PreparedStatement ps = dbConn.prepareStatement(sb.toString());
    if ((displayName != null) && (displayName.trim().length() > 0)) {
      ps.setString(1, displayName + "%");
    }
    ResultSet rs = ps.executeQuery();

    List employeeList = new ArrayList();
    while (rs.next()) {
      Employee e = new Employee();
      e.setAssociateId(Long.valueOf(rs.getLong("associate_id")));
      e.setDisplayName(rs.getString("display_name"));
      if (rs.getDate("birthdate") == null)
        e.setBirthDate("");
      else {
        e.setBirthDate(rs.getDate("birthdate").toString());
      }

      if (rs.getDate("employmentdate") == null) {
        e.setEmploymentDate("");
      } else {
        java.util.Date d = rs.getDate("employmentdate");
        e.setEmploymentDate(d.toString());
      }

      e.setPersonalStatus(Integer.valueOf(rs.getInt("personal_status")));
      if (rs.getString("firstName") == null)
        e.setFirstName("");
      else {
        e.setFirstName(rs.getString("firstName"));
      }
      if (rs.getString("lastName") == null)
        e.setLastName("");
      else {
        e.setLastName(rs.getString("lastName"));
      }

      employeeList.add(e);
    }

    Map info = new HashMap();
    info.put("data", employeeList);
    info.put("recordsTotal", Integer.valueOf(employeeList.size()));
    info.put("recordsFiltered", Integer.valueOf(employeeList.size()));
    String json = new Gson().toJson(info);
    rs.close();
    dbConn.close();
    return json;
  }

  private Connection getConnection()
    throws ClassNotFoundException, SQLException
  {
    String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=lxfdb";
    String userName = "elm_user";
    String userPwd = "lixianfu";
    Class.forName(driverName);
    Connection dbConn = DriverManager.getConnection(dbURL, userName, userPwd);
    System.out.println("Connection Successful! ");
    return dbConn;
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