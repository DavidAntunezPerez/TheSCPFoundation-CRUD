<%-- 
    Document   : reader
    Created on : 19 feb 2022, 18:22:58
    Author     : antun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SCP Database Files</title>
        <!-- BS5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- BS5 ICONS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <!-- LINK ICON -->
        <link rel="shortcut icon" href="./images/scplogo.svg" type="image/x-icon">
        <!-- BS5 JAVASCRIPT MODAL -->
        <script src="./javascripts/script.js"></script>
        <!-- CUSTOM CSS -->
        <link rel="stylesheet" href="./styles/table.css"/>
    </head>
    <body class="bg-dark">
        <!-- LOGO -->
        <a href="./index.jsp" class="logo">
            <img src="./images/scplogo.svg" alt="SCP Foundation Logo">
        </a>
        <div id="wrapper" class="container">
            <form method="get" action="./searchscpreader.jsp">
                <input type="text" name="search" class="mt-3" placeholder="Search...">
            </form>
            <!-- TOP-INFORMATION -->
            <h6 class="text-light text-center mt-3">WARNING: THE FOUNDATION DATABASE IS</h6>
            <h1 class="text-center text-uppercase text-danger">CLASSIFIED</h1>
            <h6 class="text-light text-center">ACCESS BY UNAUTHORIZED PERSONNEL IS STRICTLY PROHIBITED
                PERPETRATORS <br> WILL BE TRACKED, LOCATED, AND DETAINED</h6>
            <!-- DATABASE -->
            <%
                // To close if session is up
                session.removeAttribute("usuario");
                session.removeAttribute("password");
                session.removeAttribute("CodAut");
                // Delete session email and date if you come from signup
                session.removeAttribute("email");
                session.removeAttribute("date");
                // Close session
                session.invalidate();
                //
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/scp_foundation_crud",
                        "root", "");
                Statement s = conexion.createStatement();
                ResultSet listado = s.executeQuery("SELECT * FROM scp"
                        + " JOIN author ON author.CodAut = scp.CodAut JOIN clase_scp ON clase_scp.CodClas = scp.CodClas");
                int numeroFilas = 1; // Number of rows
                String contView = "v"; // To use it as ID for View Modal
            %> 
            <!-- MAIN TABLE -->
            <div class="table-responsive">
                <table class="table table-dark table-striped table-hover align-middle">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">SCP</th>
                            <th scope="col">Alias</th>
                            <th scope="col">Localization</th>
                            <th scope="col">Status</th>
                            <th scope="col">Class</th>
                            <th scope="col">Author</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%while (listado.next()) {
                                String nomScp = listado.getString("NomScp");
                                contView += "v"; // To change each ID, add v to contView
                        %>
                        <tr>
                            <th scope="row"><%=numeroFilas++%></th>
                            <td> <%=nomScp%></td>
                            <td><%=listado.getString("AliasScp")%></td>
                            <td><%=listado.getString("LocScp")%></td>
                            <td><%=listado.getString("EstadoScp")%></td>
                            <td><%=listado.getString("NomClas")%></td>
                            <td><%=listado.getString("AliasAut")%></td>
                            <%

                                if (numeroFilas > 1) { // So it doesnt show just the button when its empty
                            %>    
                            <!-- VIEW BUTTON MODAL -->
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#<%=contView%>">
                                    <i class="bi bi-eye"></i>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="<%=contView%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-xl">
                                        <div class="modal-content bg-dark">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="<%=contView%>"><%=nomScp%></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="card text-white bg-dark mb-3">
                                                    <div class="card-header">Class: <b> <%=listado.getString("NomClas")%></b></div>
                                                    <div class="card-header">Localization: <b> <%=listado.getString("LocScp")%></b></div>
                                                    <div class="card-body">
                                                        <h5 class="card-title">Alias: <%=listado.getString("AliasScp")%></h5>
                                                        <p class="card-text"><%=listado.getString("DescrScp")%></div>
                                                </div>
                                                <div class="card-header">Made by: <b> <%=listado.getString("AliasAut")%></b></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   
                                </div>
                            </td>
                            <% } %>
                        </tr>
                        <%  } // while
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- BS5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </body>
</html>
