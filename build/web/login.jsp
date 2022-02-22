<%-- 
    Document   : login
    Author     : antun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Log In / Sign Up</title>
        <!-- BS5 LINK -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- LINK UNICONS -->
        <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
        <!-- LINK CSS -->
        <link rel="stylesheet" href="./styles/login.css">
        <!-- LINK ICON -->
        <link rel="shortcut icon" href="./images/scplogo.svg" type="image/x-icon">
    </head>
    <body>
        <%
            // To close if session is up
            session.removeAttribute("usuario");
            session.removeAttribute("password");
            session.removeAttribute("CodAut");
            session.invalidate();
            //
        %>
        <!-- LOGO -->
        <a href="./index.jsp" class="logo" target="_blank">
            <img src="./images/scplogo.svg" alt="">
        </a>

        <div class="section">
            <div class="container">
                <div class="row full-height justify-content-center">
                    <div class="col-12 text-center align-self-center py-5">
                        <!-- SELECT BETWEEN LOGIN AND SIGNUP  -->
                        <div class="section pb-5 pt-5 pt-sm-2 text-center">
                            <h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
                            <input class="checkbox" type="checkbox" id="reg-log" name="reg-log" />
                            <label for="reg-log"></label>
                            <div class="card-3d-wrap mx-auto">
                                <div class="card-3d-wrapper">
                                    <!-- LOG IN -->
                                    <form action="./login-check.jsp" method="post">
                                        <div class="card-front">
                                            <div class="center-wrap">
                                                <div class="section text-center">
                                                    <h4 class="mb-4 pb-3">Log In</h4>
                                                    <div class="form-group">
                                                        <input type="text" name="logname" class="form-style" placeholder="Your Username" id="logname"
                                                               autocomplete="off" required>
                                                        <i class="input-icon uil uil-user"></i>
                                                    </div>
                                                    <div class="form-group mt-2 needs-validation mb-3">
                                                        <input type="password" name="logpass" class="form-style" placeholder="Your Password"
                                                               id="logpass" autocomplete="off" required>
                                                        <i class="input-icon uil uil-lock-alt"></i>
                                                    </div>
                                                    <input type="submit" class="btn" value="Submit">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- SIGN UP -->
                                    <div class="card-back">
                                        <div class="center-wrap">
                                            <div class="section text-center">
                                                <h4 class="mb-0 pb-3">Sign Up</h4>
                                                <form action="./signup-redirect.jsp">
                                                    <div class="form-group">
                                                        <input type="text" name="signname" class="form-style" placeholder="Your Full Name" id="logname"
                                                               autocomplete="off" required>
                                                        <i class="input-icon uil uil-user"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <input type="email" name="signemail" class="form-style" placeholder="Your Email" id="logemail"
                                                               autocomplete="off" required>
                                                        <i class="input-icon uil uil-at"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <input type="date" name="signdate" class="form-style"  id="logdate"
                                                               autocomplete="off" required>
                                                        <i class="input-icon uil uil-calender"></i>
                                                    </div>
                                                    <div class="form-group mt-2 mb-3">
                                                        <input type="password" name="signpass" class="form-style" placeholder="Your Password"
                                                               id="logpass" autocomplete="off" required>
                                                        <i class="input-icon uil uil-lock-alt"></i>
                                                    </div>
                                                    <input type="submit" class="btn" value="Submit">
                                                    <p class="mb-0 mt-2 text-center">I accept the<a href="https://www.termsfeed.com/live/4f4b2086-8b77-4264-b8e4-81758db7895d" class="link"> <b>terms and
                                                                conditions</b>
                                                        </a></p>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
