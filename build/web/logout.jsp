<%-- 
    Document   : logout
    Created on : 21 feb 2022, 18:59:52
    Author     : antun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loading...</title>
    </head>
    <body>
        <% 
        session.removeAttribute("usuario");
        session.removeAttribute("password");
        session.removeAttribute("CodAut");
        session.invalidate();
        %>
        <script> document.location = "./index.html";</script>
    </body>
</html>
