<%-- 
    Document   : staffmember
    Created on : Jan 12, 2021, 7:45:13 AM
    Author     : lenovo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body 
            {
                 background-image: url("login-background.png");
                background-repeat: no-repeat;
                background-size: 100%;
                opacity: 0.9;
                filter: alpha(opacity=40);
                font-family: Arial, Helvetica, sans-serif;
           
            }
            table
            {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                color: white;
            }
            #header
            {
                background-color: #4CAF50;
            }
            h2
            {
                color: white;
            }
            p{
                color: white;
            }
            a{
                color: white;
            }
        </style>
    </head>
    <body>
          <%
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps = null;
            Connection Con = null;
            int staff = Integer.parseInt(request.getParameter("id")); 
            
           
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                     String url = "jdbc:mysql://localhost:3306/staff";
                    String user = "root";
                    String password = "";
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = Con.createStatement();
                    
               
                     String query = "select * from officeHours where StaffID = " + staff;
                    //ps.setInt(1,staff);
                    ps = Con.prepareStatement(query);
                    RS = ps.executeQuery();
        
                } catch (Exception e) {
                    System.out.println(e);
                }
                
        %>
        <br><br>
        <table border="1">
            <tr>
                <th>The schedule ID is :</th>
                <th>The staff member ID is : </th>
                <th>The available day is : </th>
                <th>The available time is : </th>
                <th>The status is : </th>
                <th>The available location is : </th>  
            </tr>
            <% while (RS.next()) { %>
            <tr>
                <th>
                    <%=RS.getInt("ID")%>
                </th>
                <th>
                    <%=RS.getInt("StaffID")%>
                </th>
                <th>
                    <%=RS.getString("day")%>
                </th>
                <th>
                    <%=RS.getString("time")%>
                </th>
                <th>
                    <%=RS.getString("status")%>
                </th>
                <th>
                    <%=RS.getString("location")%>
                </th>
            </tr>
            <% }
            %>
        </table>
        <br>
        <a href="findOfficeHours.jsp">Back</a>
    </body>
</html>
