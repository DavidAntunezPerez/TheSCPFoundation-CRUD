<%-- 
    Document   : login-check
    Created on : 21 feb 2022, 18:14:06
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
        <!-- LINK ICON -->
        <link rel="shortcut icon" href="./images/scplogo.svg" type="image/x-icon">
        <!-- BS5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Loading...</title>
    </head>
    <body class="bg-dark">
        <%
            session.setAttribute("usuario", request.getParameter("logname")); // Saved user from session
            session.setAttribute("password", request.getParameter("logpass")); // Saved password from session
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/scp_foundation_crud",
                    "root", "");
            Statement s = conexion.createStatement();
            ResultSet comprobar = s.executeQuery("SELECT COUNT(AliasAut) AS NumAut FROM author "
                    + "WHERE AliasAut = '" + session.getAttribute("usuario") + "';");
            while (comprobar.next()) {
                if (comprobar.getString("NumAut").equals("0")) {
        %> <h1 class="text-center py-3 text-danger">ERROR,<b class="text-light"> Username doesnt exists!</b></h1>
        <meta http-equiv = "refresh" content = "2; url = ./login.jsp" /> <!-- REDIRECT TO LOGIN AGAIN AFTER 3 SECONDS --> <%
        } else {
        %> <script> document.location = "./login-redirect.jsp";</script> <%
                        }
                    }

        %>
    </body>
</html>
