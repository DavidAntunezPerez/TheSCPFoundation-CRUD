<%-- 
    Document   : editscp
    Created on : 21 feb 2022, 19:46:14
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
            s.executeUpdate("UPDATE scp SET NomScp = '"
                    + request.getParameter("ename") + "', AliasScp = '"
                    + request.getParameter("ealias") + "', EstadoScp = '"
                    + request.getParameter("estatus") + "', DescrScp = '"
                    + request.getParameter("edescription") + "', LocScp = '"
                    + request.getParameter("elocation") + "', CodClas = '"
                    + request.getParameter("eclass") + "' WHERE CodScp = '"+ request.getParameter("CodScp")+ "' ;");
        %>
        <script> document.location = "./editor.jsp";</script>
    </body>
</html>