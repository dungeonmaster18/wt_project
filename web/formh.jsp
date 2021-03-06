<%-- 
    Document   : formh
    Created on : Oct 14, 2016, 9:56:41 PM
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
        
        <script type="text/javascript">
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

            function validateNonEmpty(inputField, helpText) {
                // See if the input value contains any text
                return validateRegEx(/.+/,
                        inputField.value, helpText,
                        "Please enter a value.");
            }

            function validateLength(minLength, maxLength, inputField, helpText) {
                // See if the input value contains at least minLength but no more than maxLength characters
                return validateRegEx(new RegExp("^.{" + minLength + "," + maxLength + "}$"),
                        inputField.value, helpText,
                        "Please enter a value " + minLength + " to " + maxLength +
                        " characters in length.");
            }

            function validateZipCode(inputField, helpText) {
                // First see if the input value contains data
                if (!validateNonEmpty(inputField, helpText))
                    return false;

                // Then see if the input value is a ZIP code
                return validateRegEx(/^\d{6}$/,
                        inputField.value, helpText,
                        "Please enter a 6-digit ZIP code.");
            }

            function validatePhone(inputField, helpText) {
                // First see if the input value contains data
                if (!validateNonEmpty(inputField, helpText))
                    return false;

                // Then see if the input value is a phone number
                return validateRegEx(/^\d{10}$/,
                        inputField.value, helpText,
                        "Please enter a phone number (for example, 9999999999).");
            }

            function validateDate(inputField, helpText) {
                // First see if the input value contains data
                if (!validateNonEmpty(inputField, helpText))
                    return false;

                // Then see if the input value is a date
                return validateRegEx(/^\d{2}\/\d{2}\/(\d{2}|\d{4})$/,
                        inputField.value, helpText,
                        "Please enter a date (for example, 01/01/2016).");
            }

            function validateEmail(inputField, helpText) {
                // First see if the input value contains data
                if (!validateNonEmpty(inputField, helpText))
                    return false;

                // Then see if the input value is an email address
                return validateRegEx(/^[\w\.-_\+]+@[\w-]+(\.\w{2,3})+$/,
                        inputField.value, helpText,
                        "Please enter an email address (for example, dungeonmaster@mail.com).");
            }

            function validatePass(inputField, helpText) {
                // First see if the input value contains data
                if (!validateNonEmpty(inputField, helpText))
                    return false;

                // Then see if the input value is an valid password
                return validateRegEx(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}/,
                        inputField.value, helpText,
                        "Please enter an valid password.");
            }

            function confirmPass(inputField, helpText) {
                var p1 = document.getElementById("pass").value;
                var p2 = document.getElementById("cpass").value;
                if (!validateNonEmpty(inputField, helpText)) {
                    return false;
                }
                else if (p1 != p2) {
                    document.getElementById("cpass_help").innerHTML = "Password Does not match.";
                }
                return true;
            }

            function validateDrop(inputField, helpText) {
                var e = document.getElementById("htype");
                var optionSelIndex = e.options[e.selectedIndex].value;
                var optionSelectedText = e.options[e.selectedIndex].text;
                if (optionSelIndex == 0) {
                    document.getElementById("htype_help").innerHTML = "Please select a type.";
                }

            }

            function validateCheck() {
                var c = document.getElementById('cbox');
                if (c.checked) {
                    return true;
                }
                else {
                    return false;
                }
            }

            function Captcha() {
                var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
                var i;
                for (i = 0; i < 6; i++) {
                    var a = alpha[Math.floor(Math.random() * alpha.length)];
                    var b = alpha[Math.floor(Math.random() * alpha.length)];
                    var c = alpha[Math.floor(Math.random() * alpha.length)];
                    var d = alpha[Math.floor(Math.random() * alpha.length)];
                    var e = alpha[Math.floor(Math.random() * alpha.length)];
                    var f = alpha[Math.floor(Math.random() * alpha.length)];
                    var g = alpha[Math.floor(Math.random() * alpha.length)];
                }
                var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' ' + f + ' ' + g;
                document.getElementById("mainCaptcha").value = code;
            }
            function ValidCaptcha() {
                var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
                var string2 = removeSpaces(document.getElementById('txtInput').value);
                if (string1 == string2) {
                    return true;
                }
                else {
                    document.getElementById("captcha_help").innerHTML = "Captcha Doesnot matches";
                    return false;
                }
            }
            function removeSpaces(string) {
                return string.split(' ').join('');
            }
            /*

            function uploadImage() {
                if (document.getElementById("hpic").required)
                    return true;
                else
                    false;
            }
*/
            function registeruser(form) {
                if (validateLength(1, 32, form["hname"], form["hname_help"]) &&
                        validateLength(1, 32, form["address"], form["address_help"]) &&
                        validateLength(1, 12, form["uname"], form["uname_help"]) &&
                        validateLength(1, 10, form["hcode"], form["hcode_help"]) &&
                        validateZipCode(form["zipcode"], form["zipcode_help"]) &&
                        validatePhone(form["phone"], form["phone_help"]) &&
                        validateEmail(form["email"], form["email_help"]) &&
                        validatePass(form["pass"], form["pass_help"]) &&
                        // confirmPass(form["cpass"], form["cpass_help"]) &&
                        validateDrop(form["htype"], form["htype_help"]) &&
                        validCaptcha() &&
                        validateCheck()) {
                    // Submit the form to the server
                    form.submit();
                } else {
                    alert("Please! fill all * marked details.");
                }
            }
        </script>

    </head>
    <body onload="Captcha();">

        <div>

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand " href="index.jsp" style="color: red;">Blood</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class=" text-red"><a href="index.jsp" style="color: red;">Home</a></li>
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

        <div align="center" style="padding-top: 10px; padding-bottom: 100px ; background-image: url(img/index.jpg); background-repeat: no-repeat;background-attachment: fixed; background-size: 100% 100%; background-position: center;" >
            <form method="post" action="HospitalServlet.do"  >
                <table>
                    <caption style="padding: 20px; font-size: 18px; color:red;" class="sec-title text-center"><em> Hospital Registration </em></caption><br>

                    <tr>
                        <td >Hospital Name<span style="color: red;">*</span></td>
                        <td><input type="text" placeholder="Hospitalname" name="hname" id="hname" onblur="validateLength(1, 32, this, document.getElementById('hname_help'))" /></br>
                            <span id="hname_help" class="help"></span>
                        </td>
                    </tr>
                    <br>
                    <tr>
                        <td >Address<span style="color: red;">*</span></td>
                        <td><textarea rows="5" cols="40" typename="addr" id="addr" name="addr" placeholder="Address" onblur="validateLength(1, 32, this, document.getElementById('address_help'))"></textarea><br>
                            <span id="address_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Zipcode<span style="color: red;">*</span></td>
                        <td><input id="zipcode" name="zipcode" type="text" size="5" placeholder="Zipcode" onblur="validateZipCode(this, document.getElementById('zipcode_help'))" /></br>
                            <span id="zipcode_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Phone Number<span style="color: red;">*</span></td>
                        <td><input type="text" name="pnum" id="pnum" placeholder="Phone Number" onblur="validatePhone(this, document.getElementById('phone_help'))" /></br>
                            <span id="phone_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Email Address<span style="color: red;">*</span></td>
                        <td><input type="text" name="email" id="email" placeholder="Email_id" onblur="validateEmail(this, document.getElementById('email_help'))"/></br>
                            <span id="email_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Username<span style="color: red;">*</span></td>
                        <td><input type="text" name="uname" id="uname" placeholder="Username" onblur="validateLength(1, 12, this, document.getElementById('uname_help'))"></br>
                            <span id="uname_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Password<span style="color: red;">*</span></td>
                        <td><input type="password" name="pass" id="pass" placeholder="password" onblur="validatePass(this, document.getElementById('pass_help'))"></br>
                            <span id="pass_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Confirm Password<span style="color: red;">*</span></td>
                        <td><input type="password" name="cpass" id="cpass" placeholder="confirm password" onblur="confirmPass(this, document.getElementById('cpass_help'))"></br>
                            <span id="cpass_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Hospital Unique Code<span style="color: red;">*</span></td>
                        <td><input type="text" name="hcode" id="hcode" placeholder="Hospital code" onblur="validateLength(1, 10, this, document.getElementById('hcode_help'))"/></br>
                            <span id="hcode_help" class="help"></span>
                        </td>
                    </tr>

                    <tr>
                        <td >Hospital Establishment Date </td>
                        <td><input id="date" name="date" type="text" size="10" placeholder="01/01/2016")" /></br>
                        </td>
                    </tr>

                    <tr>
                        <td>Hospital Type<span style="color: red;">*</span></td>
                        <td><select name="htype" id="htype" onblur="validateDrop(this, document.getElementById('htype_help'))">
                                <option value="0" selected>------Select------</option>
                                <option value="Private">Private</option>
                                <option value="Public">Public</option>
                            </select>
                            <span id="htype_help" class="help"></span>
                        </td>
                    </tr>
                    <!--
                                        <tr>
                                            <td>Upload Photo<span style="color: red;">*</td>
                                            <td><input type="file" name="photo" id="hpic" size="50"/></td>
                                        </tr>
                    -->

                    <tr>
                        <td>
                            <input type="text" id="mainCaptcha" readonly disabled style="background-image: url(img/captcha.jpg);"/>
                            <input type="button" id="refresh" value="Refresh" onclick="Captcha();" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="txtInput" required />   
                            <span id="captcha_help" class="help"></span>
                        </td>
                    </tr>


                    <tr>
                        <td colspan="2"><input type="checkbox" name="cbox" id="cbox"> I agree to the terms and conditions<span style="color: red;">*</td>
                    </tr>

                    <tr>       
                        <td><button type="submit" id="submit" class="btn btn-effect btn-success" onclick="registeruser(this.form);">Submit</button>
                            <button type="reset" class="btn btn-effect btn-danger">Reset</button></td>
                    </tr>

                </table>

            </form>
        </div>
        <div style="background-color: black; color: white; padding-top: 40px"> 
            <footer>
                <p align="center" style="padding-bottom: 30px"> Website Designed And Developed By Umesh</p>
            </footer>
        </div>
    </body>
</html>