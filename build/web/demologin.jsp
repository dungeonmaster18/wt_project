<%-- 
    Document   : demologin
    Created on : Oct 24, 2016, 1:50:55 AM
    Author     : umesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <<div id="wrapper">
            <fieldset>
                <div align="center"><h2> Donor Login</h2><br><br></div>
                <form name="donor_log"  action="LoginDonorServlet.do" method="post">

                    <div>
                        <div class="small"> Username</div>
                        <input type="text" name="uname" placeholder=""/>
                    </div>
                    <div>
                        <div class="small"> Password</div>
                        <input type="password" name="pass" placeholder=""/>
                    </div>

                    <input type="submit" name="paswd" value="Log In"/>
                    <div class="p">                

                        <p>Not Registered ?</p><a href="donor_reg.jsp"><p><font color="red">Sign Up</p></a>

                    </div></font></form>
            </fieldset>
        </div>
    </body>
</html>
