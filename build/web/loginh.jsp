<%-- 
    Document   : loginh
    Created on : Oct 19, 2016, 12:20:28 AM
    Author     : umesh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Blood Donor Central Database And Web-portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
        %>

        <style>

            .card-container.card {
                max-width: 350px;
                padding: 40px 40px;
            }



            /*
             * Card component
             */
            .card {
                background-color: #F7F7F7;
                /* just in case there no content*/
                padding: 20px 25px 30px;
                margin: 0 auto 25px;
                margin-top: 50px;
                /* shadows and rounded borders */
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
                -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            }

            .profile-img-card {
                width: 96px;
                height: 96px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }

            /*
             * Form styles
             */
            .profile-name-card {
                font-size: 16px;
                font-weight: bold;
                text-align: center;
                margin: 10px 0 0;
                min-height: 1em;
            }

            .reauth-email {
                display: block;
                color: #404040;
                line-height: 2;
                margin-bottom: 10px;
                font-size: 14px;
                text-align: center;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .form-signin #inputEmail,
            .form-signin #inputPassword {
                direction: ltr;
                height: 44px;
                font-size: 16px;
            }

            .form-signin input[type=email],
            .form-signin input[type=password],
            .form-signin input[type=text],
            .form-signin button {
                width: 100%;
                display: block;
                margin-bottom: 10px;
                z-index: 1;
                position: relative;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .form-signin .form-control:focus {
                border-color: rgb(104, 145, 162);
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
            }


            .forgot-password {
                color: rgb(104, 145, 162);
            }

            .forgot-password:hover,
            .forgot-password:active,
            .forgot-password:focus{
                color: rgb(12, 97, 33);
            }
        </style>

        <script>

            $(document).ready(function () {
                // DOM ready

                // Test data
                /*
                 * To test the script you should discomment the function
                 * testLocalStorageData and refresh the page. The function
                 * will load some test data and the loadProfile
                 * will do the changes in the UI
                 */
                // testLocalStorageData();
                // Load profile if it exits
                loadProfile();
            });

            /**
             * Function that gets the data of the profile in case
             * thar it has already saved in localstorage. Only the
             * UI will be update in case that all data is available
             *
             * A not existing key in localstorage return null
             *
             */
            function getLocalProfile(callback) {
                var profileImgSrc = localStorage.getItem("PROFILE_IMG_SRC");
                var profileName = localStorage.getItem("PROFILE_NAME");
                var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

                if (profileName !== null
                        && profileReAuthEmail !== null
                        && profileImgSrc !== null) {
                    callback(profileImgSrc, profileName, profileReAuthEmail);
                }
            }

            /**
             * Main function that load the profile if exists
             * in localstorage
             */
            function loadProfile() {
                if (!supportsHTML5Storage()) {
                    return false;
                }
                // we have to provide to the callback the basic
                // information to set the profile
                getLocalProfile(function (profileImgSrc, profileName, profileReAuthEmail) {
                    //changes in the UI
                    $("#profile-img").attr("src", profileImgSrc);
                    $("#profile-name").html(profileName);
                    $("#reauth-email").html(profileReAuthEmail);
                    $("#inputEmail").hide();
                    $("#remember").hide();
                });
            }

            /**
             * function that checks if the browser supports HTML5
             * local storage
             *
             * @returns {boolean}
             */
            function supportsHTML5Storage() {
                try {
                    return 'localStorage' in window && window['localStorage'] !== null;
                } catch (e) {
                    return false;
                }
            }

            /**
             * Test data. This data will be safe by the web app
             * in the first successful login of a auth user.
             * To Test the scripts, delete the localstorage data
             * and comment this call.
             *
             * @returns {boolean}
             */
            function testLocalStorageData() {
                if (!supportsHTML5Storage()) {
                    return false;
                }
                localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120");
                localStorage.setItem("PROFILE_NAME", "César Izquierdo Tello");
                localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
            }
        </script>

    </head>
    <body>

        <div>

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand " href="index.jsp" style="color: red;">Blood</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="text-red"><a href="index.jsp" style="color: red;">Home</a></li>
                        <li class="dropdown actives"><a class="dropdown-toggle" data-toggle="dropdown" style="color: red;" href="#">Sign Up<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="register.jsp">Register</a></li>
                                <li><a href="login.jsp">Login</a></li>
                            </ul>
                        </li>
                        <li><a href="about.jsp" style="color: red;">About Us</a></li>
                        <li><a href="contact.jsp" style="color: red;">Contact Us</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div style="background-image: url(img/index.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;"">
            <div class="container" style="padding-bottom: 100px; padding-top: 50px; ">
                <div class="card card-container">
                    <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                    <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                    <p id="profile-name" class="profile-name-card"></p>
                    <form class="form-signin" action="LoginHospitalServlet.do">
                        <input type="text" id="uname" name="uname" class="form-control" placeholder="username" required autofocus>
                        <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required>
                        <div id="remember" class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>
                        <button class="btn btn-effect btn-success" type="submit">Sign in</button>
                    </form><!-- /form -->
                    <a href="forgethpassword.jsp" class="forgot-password">
                        Forgot the password?
                    </a><br>
                    New User?
                    <a href="register.jsp">
                       Register
                    </a>
                </div><!-- /card-container -->
            </div><!-- /container -->
        </div>

        <div style="background-color: black; color: white; padding-top: 10px"> 
            <footer>
                <p align="center" style="padding-bottom: 30px"> Website Designed And Developed By Umesh</p>
            </footer>
        </div>

    </body>
</html>
