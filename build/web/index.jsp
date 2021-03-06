<%-- 
    Document   : index
    Author     : antun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>The SCP Foundation</title>
        <!-- BS5 LINK -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- LINK UNICONS -->
        <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
        <!-- BS5 ICONS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <!-- LINK CSS -->
        <link rel="stylesheet" href="./styles/index.css">
        <!-- LINK ICON -->
        <link rel="shortcut icon" href="./images/scplogo.svg" type="image/x-icon">
    </head>
    <body>
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
        %>
        <!-- THIS IS THE LANDING PAGE OF THE CRUD -->
        <!-- LOG IN -->
        <a href="./login.jsp" class="login link">
            <h4>Log In</h4>
        </a>
        <!-- LOGO -->
        <div id="wrapper">
            <div class="logo">
                <img src="./images/scplogo.svg" alt="SCP Logo" class="m-auto">
            </div>
            <div class="section text-center mb-4">
                <!-- CATCH-UP TEXT -->
                <h4>Read, Create, Edit and Delete your own Articles </h4>
            </div>
            <div class="section text-center">
                <!-- DOUBLE CHOICE BUTTONS -->
                <a href="./reader.jsp" class="btn mb-3">
                    Join as a Reader <i class="uil uil-eye"></i>
                </a>
                <h4 class="mb-3">OR</h4>
                <a href="./login.jsp" class="btn">
                    Become an Author <i class="input-icon uil uil-user"></i>
                </a>
            </div>
            <!-- FOOTER SECTION -->
            <div class="container">
                <footer class="d-flex flex-wrap justify-content-between align-items-center pt-3 mt-5">

                    <!-- LEFT -->
                    <ul class="nav col-md-6 d-flex justify-content-center list-unstyled">
                        <li class="ms-3"><a class="link" href="https://twitter.com/"><i
                                    class="bi bi-twitter fs-5"></i></a></li>
                        <li class="ms-3"><a class="link" href="https://www.twitch.tv/"><i
                                    class="bi bi-twitch fs-5"></i></a></li>
                        <li class="ms-3"><a class="link" href="https://www.instagram.com/"><i
                                    class="bi bi-instagram fs-5"></i></a></li>
                        <li class="ms-3"><a class="link" href="https://www.tiktok.com/"><i
                                    class="bi bi-tiktok fs-5"></i></a></li>
                        <li class="ms-3"><a class="link" href="https://discord.com/"><i
                                    class="bi bi-discord fs-5"></i></a></li>
                        <li class="ms-3"><a class="link" href="mailto:antunezdavid2003@gmail.com"><i
                                    class="bi bi-envelope fs-5"></i></a></li>
                    </ul>
                    <!-- RIGHT -->
                    <div class="col-md-6 d-flex align-items-center justify-content-center">
                        <span class="text-center">Made by <a href="https:/github.com/DavidAntunezPerez" class="link">David
                                Ant??nez P??rez</a> </span>
                    </div>
                </footer>
            </div>

            <!-- BS5 JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>
</html>
