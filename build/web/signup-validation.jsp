<%-- 
    Document   : signup-validation
    Created on : 22 feb 2022, 12:50:09
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
    <body style="background-color: #1f2029;">
        <%
            boolean valid = true;
            session.setAttribute("usuario", request.getParameter("signname")); // Saved user from session
            session.setAttribute("password", request.getParameter("signpass")); // Saved password from session
            session.setAttribute("date", request.getParameter("signdate")); // Set date in session for the redirect
            session.setAttribute("email", request.getParameter("signemail")); // Set email in session for the redirect
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/scp_foundation_crud",
                    "root", "");
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery("SELECT AliasAut FROM author ;");
            while (listado.next()) {
                if ((listado.getString("AliasAut").equals(session.getAttribute("usuario")))) {
        %>
        <h1 class="text-center py-3 text-danger">ERROR,<b class="text-light"> Username already taken!</b></h1>
        <meta http-equiv = "refresh" content = "2; url = ./login.jsp" /> <!-- REDIRECT TO LOGIN AGAIN AFTER 3 SECONDS -->
        <%  valid = false;
                }
            }
            if (valid) {
        %> <script> document.location = "./signup-redirect.jsp";</script> <%
               }
        %>  
    </body>
</html>
