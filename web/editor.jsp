<%-- 
    Document   : editor
    Created on : 19 feb 2022, 18:22:33
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
        <title>Edit as an author</title>
        <!-- LINK ICON -->
        <link rel="shortcut icon" href="./images/scplogo.svg" type="image/x-icon">
        <!-- BS5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- BS5 ICONS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <!-- BS5 JAVASCRIPT MODAL -->
        <script src="./javascripts/script.js"></script>
        <!-- REL: CUSTOM STYLESHEET -->
        <link rel="stylesheet" href="./styles/table.css"/>
    </head>
    <body class="bg-dark">
        <%
            // Delete session email and date if you come from signup
            session.removeAttribute("email");
            session.removeAttribute("date");

            // If the user or password are null, return to log in page (To prevent bugs)
            if ((session.getAttribute("usuario") == null) || (session.getAttribute("password") == null)) {
        %>
        <h1 class="text-center py-3 text-uppercase text-danger">ERROR, USERNAME OR PASSWORD MISSMATCH</h1>
        <meta http-equiv = "refresh" content = "2; url = ./login.jsp" /> <!-- REDIRECT TO LOGIN AGAIN AFTER 3 SECONDS -->
        <%
        } else { // Else, Show tables
        %>
        <div id="wrapper" class="container">
            <a href="./logout.jsp" class="login link">
                <h4 class="mt-2">Log Out</h4>
            </a>
            <!-- SEARCH -->
            <form method="get" action="./searchscpedit.jsp">
                <input type="text" name="search" class="mt-3" placeholder="Search...">
            </form>
            <form class="form-inline mt-1 d-flex" action="./editor.jsp" method="get">
                <select name="order">
                    <option selected>Select Order...</option>
                    <option value="NomScp">SCP</option>
                    <option value="AliasScp">Alias</option>
                    <option value="LocScp">Localization</option>
                    <option value="EstadoScp">Status</option>
                    <option value="NomClas">Class</option>
                    <option value="AliasAut">Author</option>
                </select> 
                <input class="btn btn-outline-success mx-1" type="submit" value="Apply">
            </form>
            <!-- WELCOME TEXT -->
            <h6 class="text-light text-center mt-3">Welcome <b class="primary-color mx-auto"> <%=session.getAttribute("usuario")%> </b>!</h6>
            <h1 class="text-center text-uppercase text-light">EDIT AS AN AUTHOR</h1>
            <%
                String search = "";
                // If is ordered by one of the form values this will be inside the main SQL query
                if (request.getParameter("order") != null) {
                    search += "ORDER BY "+request.getParameter("order").toString();
                }

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/scp_foundation_crud",
                        "root", "");
                Statement s = conexion.createStatement();
                ResultSet listado;
                boolean root; // to get sure we are logged into root
                if ((session.getAttribute("usuario").equals("root")) && (session.getAttribute("password").equals("root"))) {
                    listado = s.executeQuery("SELECT * FROM scp"
                            + " JOIN author ON author.CodAut = scp.CodAut JOIN clase_scp ON clase_scp.CodClas = scp.CodClas " + search + " ;");
                    root = true; // to get sure we are logged into root
                    session.setAttribute("CodAut", "18"); // In this case, we are using JUST the root code from our database, if you have imported the repository database it should be 18, else, change it to the right number

                } else {
                    listado = s.executeQuery("SELECT * FROM scp"
                            + " JOIN author ON author.CodAut = scp.CodAut JOIN clase_scp ON clase_scp.CodClas = scp.CodClas"
                            + " WHERE AliasAut='" + session.getAttribute("usuario")
                            + "' AND ContrAut='" + session.getAttribute("password") + "' " + search + " ;");
                    root = false; // not logged into root
                }
                int numeroFilas = 1; // to show the number of rows
                String contDel = "d"; // for controling Delete ID
                String contView = "v"; // for controling View ID
                String contEdit = "e"; // for controling Edit ID

            %> 
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
                                // Declarate variables so the code is cleaner
                                String nomScp = listado.getString("NomScp");
                                String aliasScp = listado.getString("AliasScp");
                                String locScp = listado.getString("LocScp");
                                String estadoScp = listado.getString("EstadoScp");
                                String nomClas = listado.getString("NomClas");
                                String aliasAut = listado.getString("AliasAut");
                                String descrScp = listado.getString("DescrScp");
                                String codScp = listado.getString("CodScp");
                                contDel += "d";
                                contView += "v";
                                contEdit += "e";
                                if (!root) { // if we are not into root, take the database correspondent number
                                    session.setAttribute("CodAut", listado.getString("CodAut")); // Saved Author ID from session
                                }
                        %>
                        <tr>
                            <th scope="row"><%=numeroFilas++%></th>
                            <td> <%=nomScp%></td>
                            <td><%=aliasScp%></td>
                            <td><%=locScp%></td>
                            <td><%=estadoScp%></td>
                            <td><%=nomClas%></td>
                            <td><%=aliasAut%></td>

                            <%
                                if (numeroFilas > 1) {%>  
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
                                                    <div class="card-header">Class: <b> <%=nomClas%></b></div>
                                                    <div class="card-header">Localization: <b> <%=locScp%></b></div>
                                                    <div class="card-body">
                                                        <h5 class="card-title">Alias: <%=aliasScp%></h5>
                                                        <p class="card-text"><%=descrScp%></div>
                                                </div>
                                                <div class="card-header">Made by: <b> <%=aliasAut%></b></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                            </td>
                            <td>
                                <div class="modal fade" id="<%=contEdit%>" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content bg-dark text-light">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="<%=contEdit%>">Edit SCP</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- BS5 FORMS -->
                                                <form method="get" action="./editscp.jsp">
                                                    <input type="hidden" name="CodScp" value="<%=codScp%>">
                                                    <label class="text-center">Name:</label><br>
                                                    <input type="text" name="ename" class="form-control" value="<%=nomScp%>" required><br>
                                                    <label>Alias:</label><br>
                                                    <input type="text" name="ealias" class="form-control" value="<%=aliasScp%>" required><br>
                                                    <label>Status:</label><br>
                                                    <input type="text" name="estatus" class="form-control" value="<%=estadoScp%>" required><br>
                                                    <label>Location:</label><br>
                                                    <input type="text" name="elocation" class="form-control" value="<%=locScp%>" required><br>
                                                    <label>Class:</label><br>
                                                    <!--SEND THE AUTHOR INTO A HIDDEN INPUT-->
                                                    <select class="form-select mb-4" aria-label="Default select example" name="eclass" required>
                                                        <!-- INCLUDE IN DATABASE THIS OPTIONS IN EXACTLY THIS ORDER -->
                                                        <option value="1">Keter</option>
                                                        <option value="2">Safe</option>
                                                        <option value="3">Euclid</option>
                                                        <option value="4">Thaumiel</option>
                                                        <option value="5">Neutralized</option>
                                                        <option value="6">Apollyon</option>
                                                        <option value="7">Archon</option>
                                                    </select>
                                                    <label>Description:</label><br>
                                                    <textarea class="form-control" name="edescription" rows="3" required><%=descrScp%>
                                                    </textarea>
                                                    <input class="btn btn-success mt-3 mx-auto" type="submit" value="Edit SCP">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#<%=contEdit%>">
                                    <i class="bi bi-pencil-square"></i>
                                </button>
                            </td>
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#<%=contDel%>">
                                    <i class="bi bi-x-lg"></i>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="<%=contDel%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content bg-dark">
                                            <div class="modal-header">
                                                <h5 class="modal-title">WARNING!</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Do you really want to delete this SCP?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <form method="get" action="deletescp.jsp">
                                                    <input type="hidden" name="CodScp" value="<%=codScp%>">
                                                    <input class="btn btn-danger" type="submit" value="Delete️">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </td>
                            <% }
                                }%>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content bg-dark text-light">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalToggleLabel">Create a new SCP</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- BS5 FORMS -->
                            <form method="get" action="./insertscp.jsp">
                                <label class="text-center">Name:</label><br>
                                <input type="text" name="cname" class="form-control" required><br>
                                <label>Alias:</label><br>
                                <input type="text" name="calias" class="form-control" required><br>
                                <label>Status:</label><br>
                                <input type="text" name="cstatus" class="form-control" required><br>
                                <label>Location:</label><br>
                                <input type="text" name="clocation" class="form-control" required><br>
                                <label>Class:</label><br>
                                <!--SEND THE AUTHOR INTO A HIDDEN INPUT-->
                                <select class="form-select mb-4" aria-label="Default select example" name="cclass" required>
                                    <!-- INCLUDE IN DATABASE THIS OPTIONS IN EXACTLY THIS ORDER -->
                                    <option value="1">Keter</option>
                                    <option value="2">Safe</option>
                                    <option value="3">Euclid</option>
                                    <option value="4">Thaumiel</option>
                                    <option value="5">Neutralized</option>
                                    <option value="6">Apollyon</option>
                                    <option value="7">Archon</option>
                                </select>
                                <label>Description:</label><br>
                                <textarea class="form-control" name="cdescription" rows="3" required></textarea>
                                <input class="btn btn-success mt-3 mx-auto" type="submit" value="Create SCP">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">

            </div>
            <a class="btn btn-success mt-3 btncustom" data-bs-toggle="modal" href="#exampleModalToggle" role="button">New SCP</a>

        </div>
        <% }%>
        <!-- BS5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </body>
</html>
