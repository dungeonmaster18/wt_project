<%-- 
    Document   : sendrequest
    Created on : Nov 9, 2016, 10:59:35 PM
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
        <script>

            function validateDrop(form) {
                var e = document.getElementById("bgroup");
                var optionSelIndex = e.options[e.selectedIndex].value;
                var optionSelectedText = e.options[e.selectedIndex].text;
                if (optionSelIndex == -1) {
                    alert("Please choose a right group");
                }
                else {
                    form.submit();
                }

            }



        </script>


    </head>

    <body>


        <div>

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">

                </div>
            </nav>
        </div>


        <div id="wrapper" style="padding-bottom: 300px;background-image: url(img/index.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;">

            <c:if test="${sessionScope.login.uname==null}" >
                <c:redirect url="error.jsp"/>
            </c:if>


<!-- You are Logged in as :  ${sessionScope.login.uname} <br />-->


            <div class="col-md-4">
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-4" style="padding-left: 200px ; padding-top: 20px;">

                <a href="logout.jsp" style="color: black;"> Logout </a> <br>
                <a href="resethpassword.jsp" style="color: black;">change password</a><br>
                <a href="uploadh.jsp" style="color: black;">change profile</a><br>
                <a href="profile_hospital.jsp" style="color: black;">profile</a><br>

            </div>

            <form  method="post" action="SendRequestServlet.do" style="padding-top: 250px;padding-left: 650px;">
                <table>
                    <tr>
                        <td>Blood Group<span style="color: red;">*</span></td>
                        <td><select name="bgroup" id="bgroup" >
                                <option value="-1">------Select Blood Group------</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B_">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select><br><br>
                        </td>
                    </tr>
                    <input type="hidden" name="uname" value="${sessionScope.login.uname}"/>
                    <tr>       
                        <td><button type="submit" id="submit" class="btn btn-effect btn-success" onclick="validateDrop(this, form);">Send Request</button>
                            <button type="reset" class="btn btn-effect btn-danger">Reset</button>
                        </td>
                    </tr>
                </table>
            </form>


        </div>


    </div>

    <div style="background-color: black; color: white; padding-top: 40px"> 
        <footer>
            <p align="center" style="padding-bottom: 30px"> Website Designed And Developed By Umesh</p>
        </footer>
    </div>

</body>
</html>
