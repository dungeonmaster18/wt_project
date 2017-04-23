<%-- 
    Document   : changeHpassword
    Created on : Oct 27, 2016, 7:18:53 PM
    Author     : umesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Login"%>
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

            function confirmPassword(form) {
                var p1 = document.getElementById("pass").value;
                var p2 = document.getElementById("cpass").value;
                if (p1 != p2)
                    alert("Password does not matches");
                else
                    form.submit();
            }

        </script>

    </head>
    <body>

        <div>

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">

            </nav>
        </div>

        <% System.out.println(((Login) session.getAttribute("otp")).getUname()); %>
        <c:if test="${sessionScope.otp.uname==null}" >
            <c:redirect url="error.jsp"/>
        </c:if>

       

        <!--You are Logged in as :  ${sessionScope.otp.uname} <br /> -->

        <div style="background-image: url(img/index.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;padding-bottom: 180px">
            
            <div class="container" style=" padding-top: 180px; ">
                <div class="card card-container" >
                    <p id="profile-name" class="profile-name-card"></p>
                    <form class="form-signin"  action="ForgetHservlet.do" method="post">
                        <input type="text" id="otp" name="otp" class="form-control" placeholder="otp" max="4" required autofocus>
                        <input type="password" id="pass" name="pass" class="form-control" placeholder="New password" required autofocus >
                        <input type="password" id="cpass" name="cpass" class="form-control" placeholder="Confirm password" required autofocus>
                        <input type="hidden" name="uname" value="${sessionScope.otp.uname}"/>
                        <button class="btn btn-effect btn-success" id="submit" type="submit" onclick="confirmPassword(this.form);">Change Password</button>
                    </form><!-- /form -->

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
