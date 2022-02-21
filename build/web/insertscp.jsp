<%-- 
    Document   : insertscp
    Created on : 20 feb 2022, 18:57:02
    Author     : antun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecting...</title>
    </head>
    <body style="background-color: #1f2029;">
        <%
            String codAut = "" + session.getAttribute("CodAut");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/scp_foundation_crud",
                    "root", "");
            Statement s = conexion.createStatement();
            s.executeUpdate("INSERT INTO scp VALUES (NULL, '"
                    + request.getParameter("cname") + "', '"
                    + request.getParameter("calias") + "', '"
                    + request.getParameter("cstatus") + "', '"
                    + request.getParameter("cdescription") + "', '"
                    + request.getParameter("clocation") + "', '"
                    + codAut + "', '"
                    + request.getParameter("cclass") + "');");
        %>
        <script> document.location = "./editor.jsp";</script>
    </body>
</html>
