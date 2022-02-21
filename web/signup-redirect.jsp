<%-- 
    Document   : signup-redirect
    Created on : 20 feb 2022, 0:21:24
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
        <!-- BS5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Loading...</title>
        <meta http-equiv = "refresh" content = "2; url = ./login.html" />
    </head>
    <body class="bg-dark">
        <%
            session.setAttribute("usuario", request.getParameter("signname")); // Saved user from session
            session.setAttribute("password", request.getParameter("signpass")); // Saved password from session
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/scp_foundation_crud",
                    "root", "");
            Statement s = conexion.createStatement();
            s.executeUpdate("INSERT INTO author VALUES (NULL,'"
                    + request.getParameter("signname") + "','"
                    + session.getAttribute("usuario") + "','" 
                    + request.getParameter("signdate") + "','"
                    + session.getAttribute("password") + "');");
        %>  
        <script> document.location = "./editor.jsp";</script>
    </body>
</html>
