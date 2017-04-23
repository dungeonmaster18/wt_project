<%-- 
    Document   : index
    Created on : Oct 14, 2016, 9:56:02 PM
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
                        <li class="actives text-red"><a href="index.jsp" style="color: red;">Home</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" style="color: red;" href="#">Sign Up<span class="caret"></span></a>
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
        <div class="sec-title text-center">
            <h1>Home</h1>
        </div>

        <div id="homeslider" class="carousel slide" data-ride="carousel">

            <!-- Carousel indicators -->

            <ol class="carousel-indicators">

                <li data-target="#homeslider" data-slide-to="0" class="active"></li>

                <li data-target="#homeslider" data-slide-to="1"></li>

                <li data-target="#homeslider" data-slide-to="2"></li>

            </ol>   

            <!-- Wrapper for carousel items -->

            <div class="carousel-inner">

                <div class="item active">

                    <img src="img/slide1.jpg" alt="First Slide" style="width: 100%">
                </div>

                <div class="item">

                    <img src="img/slide2.jpg" alt="Second Slide" style="width: 100%">
                </div>

                <div class="item">

                    <img src="img/slide3.jpg" alt="Third Slide" style="width: 100%">

                </div>

            </div>

            <!-- Carousel controls -->

            <a class="carousel-control left" href="#homeslider" data-slide="prev">

                <span class="glyphicon glyphicon-chevron-left"></span>

            </a>

            <a class="carousel-control right" href="#homeslider" data-slide="next">

                <span class="glyphicon glyphicon-chevron-right"></span>

            </a>

        </div><br>



        <div style="background-color: black; color: white; padding-top: 40px"> 
            <footer>
                <p align="center" style="padding-bottom: 30px"> Website Designed And Developed By Umesh</p>
            </footer>
        </div>
    </body>
</html>
