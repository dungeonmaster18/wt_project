<%-- 
    Document   : contact
    Created on : Oct 14, 2016, 9:57:19 PM
    Author     : umesh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    </head>
    <body>

        <div>

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand " href="index.jsp" style="color: red;">Blood</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class=" text-red"><a href="index.jsp" style="color: red;">Home</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" style="color: red;" href="#">Sign Up<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="register.jsp">Register</a></li>
                                <li><a href="login.jsp">Login</a></li>
                            </ul>
                        </li>
                        <li><a href="about.jsp" style="color: red;">About Us</a></li>
                        <li class="actives"><a href="contact.jsp" style="color: red;">Contact Us</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div style="padding-bottom: 10px;  background-image: url(img/index.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;">
            <div class="container">

                <div class="sec-title text-center">
                    <h2>Contact Us</h2>
                </div>


                <div class="col-md-6">
                    <form action="#" method="post">
                        <h3>Leave a Message</h3>
                        <div class="input-field">
                            <input type="text" name="name" class="form-control" placeholder="Your Name...">
                        </div>
                        <div class="input-field">
                            <input type="email" name="email" class="form-control" placeholder="Your Email...">
                        </div>
                        <div class="input-field">
                            <input type="text" name="subject" class="form-control" placeholder="Subject...">
                        </div>
                        <div class="input-field">
                            <textarea name="message" class="form-control" placeholder="Messages..."></textarea>
                        </div><br>
                        <button type="submit" id="submit" class="btn btn-blue btn-effect">Send</button>
                    </form>
                </div><br><br>
            </div><br><br>
            <div class="container" style="padding-bottom: 100px">
                <div class="col-md-6">
                    <h3>Contact Us</h3>           
                    <p>Phone: (+91) 99999 99999 </p>
                    <p>Email: admin@bbcd.com</p>
                </div>
            </div>
        </div>

        <div style="background-color: black; color: white; padding-top: 40px"> 
            <footer>
                <p align="center" style="padding-bottom: 30px"> Website Designed And Developed By Umesh</p>
            </footer>
        </div>
    </body>
</html>
