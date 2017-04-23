<%-- 
    Document   : about
    Created on : Oct 14, 2016, 9:56:23 PM
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
                        <li class="actives"><a href="about.jsp" style="color: red;">About Us</a></li>
                        <li><a href="contact.jsp" style="color: red;">Contact Us</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div style="padding-bottom: 520px;  background-image: url(img/index.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;"><br>

            <h2 class="sec-title text-center">About Us</h2>

            <p align="center" style="padding-top: 100px">
                We are the aspiring engineerings.We have designed this website for our college project.
            </p>
        </div>
    </div>

    <div style="background-color: black; color: white; padding-top: 40px"> 
        <footer>
            <p align="center" style="padding-bottom: 30px"> Website Designed And Developed By Umesh</p>
        </footer>
    </div>
</body>
</html>
