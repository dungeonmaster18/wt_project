<%-- 
    Document   : resethpassword
    Created on : Oct 26, 2016, 9:00:29 AM
    Author     : umesh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Login"%>
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

        <style>
            @import url(http://fonts.googleapis.com/css?family=Roboto:400,100);


            .login-card {
                padding: 40px;
                width: 500px;
                background-color: #F7F7F7;
                margin: 0 auto 10px;
                border-radius: 2px;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                overflow: hidden;
            }

            .login-card h1 {
                font-weight: 100;
                text-align: center;
                font-size: 2.3em;
            }

            .login-card input[type=submit] {
                width: 100%;
                display: block;
                margin-bottom: 10px;
                position: relative;
            }

            .login-card input[type=text], input[type=password] {
                height: 44px;
                font-size: 16px;
                width: 100%;
                margin-bottom: 10px;
                -webkit-appearance: none;
                background: #fff;
                border: 1px solid #d9d9d9;
                border-top: 1px solid #c0c0c0;
                /* border-radius: 2px; */
                padding: 0 8px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
            }

            .login-card input[type=text]:hover, input[type=password]:hover {
                border: 1px solid #b9b9b9;
                border-top: 1px solid #a0a0a0;
                -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            }

            .login {
                text-align: center;
                font-size: 14px;
                font-family: 'Arial', sans-serif;
                font-weight: 700;
                height: 36px;
                padding: 0 8px;
                /* border-radius: 3px; */
                /* -webkit-user-select: none;
                  user-select: none; */
            }

            .login-submit {
                /* border: 1px solid #3079ed; */
                border: 0px;
                color: #fff;
                text-shadow: 0 1px rgba(0,0,0,0.1); 
                background-color: #4d90fe;
                /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
            }

            .login-submit:hover {
                /* border: 1px solid #2f5bb7; */
                border: 0px;
                text-shadow: 0 1px rgba(0,0,0,0.3);
                background-color: #357ae8;
                /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
            }

            .login-card a {
                text-decoration: none;
                color: #666;
                font-weight: 400;
                text-align: center;
                display: inline-block;
                opacity: 0.6;
                transition: opacity ease 0.5s;
            }

            .login-card a:hover {
                opacity: 1;
            }

            .login-help {
                width: 100%;
                text-align: center;
                font-size: 12px;
            }
        </style>

        <script>

            function validateNonEmpty(inputField, helpText) {
                // See if the input value contains any text
                return validateRegEx(/.+/,
                        inputField.value, helpText,
                        "Please enter a value.");
            }

            function validateRegEx(regex, input, helpText, helpMessage) {
                // See if the input data validates OK
                if (!regex.test(input)) {
                    // The data is invalid, so set the help message and return false
                    if (helpText != null)
                        helpText.innerHTML = helpMessage;
                    return false;
                }
                else {
                    // The data is OK, so clear the help message and return true
                    if (helpText != null)
                        helpText.innerHTML = "";
                    return true;
                }
            }

            function validatePass(inputField, helpText) {
                // First see if the input value contains data
                if (!validateNonEmpty(inputField, helpText))
                    return false;

                // Then see if the input value is an email address
                return validateRegEx(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}/,
                        inputField.value, helpText,
                        "Please enter an valid password.");
            }

            function checkPassword() {
                var o = document.getElementById("opass").value;
                var n = document.getElementById("npass").value;
                var c = document.getElementById("cpass").value;
                if (o == n)
                    document.getElementById("npass_help").innerHTML = "New and old password can not be same";
                else if (n != c)
                    document.getElementById("cpass_help").innerHTML = "Password does not matches";
                else
                    return true;
            }

            function changePassword(form) {
                if (validatePass(form["opass"], form["opass_help"]) &&
                        validatePass(form["npass"], form["npass_help"]) &&
                        validatePass(form["cpass"], form["cpass_help"]) &&
                        checkPassword()) {
                    form.submit();
                }
                else {
                    alert("Please! fill all the field correctly.");
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

            </c:if>

            <%
                String username = (String) ((Login) session.getAttribute("login")).getUname();
                //out.print(username);
            %>
            <div class="row">
                <div class="col-md-4">

                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4" style="padding-left: 200px ; padding-top: 20px;">

                    <a href="logout.jsp" style="color: black;"> Logout </a> <br>
                    <a href="profile_hospital.jsp" style="color: black;">profile</a><br>
                    <a href="uploadh.jsp" style="color: black;">Upload profile</a><br>
                    <a href="sendrequest.jsp" style="color: black;">send request</a><br>
                </div>
            </div>
            <div class="login-card">
                <h1>Change Password</h1><br>
                <form action="ChangePasswordHServlet.do" method="post">
                    <tr>
                        <td>
                            <input type="password" name="opass" id="opass" placeholder="Old password"><br>
                            <span id="opass_help" class="help"></span>
                        </td>
                    </tr><br>
                    <tr>
                        <td>
                            <input type="password" name="npass"id="npass" placeholder="New Password"><br>
                            <span id="npass_help" class="help"></span>
                        </td>
                    </tr><br>
                    <input type="hidden" name="uname" value="<%=username%>"
                           <tr>
                        <td>
                            <input type="password" name="cpass " id="cpass" placeholder="Confirm Password"><br>
                            <span id="cpass_help" class="help"></span>
                        </td>
                    </tr><br>
                    <tr>
                        <td>
                            <input type="submit" name="login" class="login login-submit" value="Change Password" onclick="changePassword(this.form)">
                        </td>
                    </tr>
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