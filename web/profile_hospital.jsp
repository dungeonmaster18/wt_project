<%-- 
    Document   : profile_hospital
    Created on : Oct 24, 2016, 5:19:52 PM
    Author     : umesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Blood Donor Central Database And Web-portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="PRAGMA" content="NO-CACHE">
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

                </div>
            </nav>
        </div>


        <div id="wrapper" style="padding-bottom: 330px;background-image: url(img/index.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;">

            <c:if test="${sessionScope.login.uname==null}" >
                <c:redirect url="error.jsp"/>
            </c:if>
            
            <%
                 String username = (String) ((Login) session.getAttribute("login")).getUname();
                LoginHospitalDAO ldao =new LoginHospitalDAO();
                String img = ldao.getImg(username);
               // out.print(img);
            %>

<!-- You are Logged in as :  ${sessionScope.login.uname} <br />-->

            <div class="row">
                <div class="col-md-4">
                    <div class="card card-outline-danger" style="width: 300px">
                        <img class="card-img-top" src="<%=img%>" alt="img/img_avatar2.jpg" style="width: 300px;">
                        <div class="card-block text-xs-center">
                            <h4 class="card-title">${sessionScope.login.uname}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4" style="padding-left: 200px ; padding-top: 20px;">

                    <a href="logout.jsp" style="color: black;"> Logout </a> <br>
                    <a href="resethpassword.jsp" style="color: black;">change password</a><br>
                    <a href="uploadh.jsp" style="color: black;">change profile</a><br>
                    <a href="sendrequest.jsp" style="color: black;">send request</a><br>

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


