<%-- 
    Document   : login
    Created on : Aug 10, 2021, 9:03:26 PM
    Author     : thaon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/style.css" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>

        <title>Register Page</title>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-4 offset-sm-4 border bg-main py-2 border-radius-top">
                    <p class="m-0 text-bold text-center">SIGN UP</p>
                </div>
                <div class="col-12 col-sm-4 offset-sm-4 border px-3 border-radius-bottom">
                    <form action="MainController" method="POST">
                        <span class="text-danger">${error}</span>
                        <div class="form-group my-2">
                            <input type="text" placeholder="Username" class="form-control" name="txtUsername" required maxlength="50">
                        </div>                        
                        <div class="form-group">
                            <input type="text" placeholder="Fullname" class="form-control" name="txtFullname" required maxlength="50">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control" name="txtPassword" id="password" onkeyup="checkConfirmPassword()" required maxlength="50">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control" id="confirm_password" onkeyup="checkConfirmPassword()" required maxlength="50">
                            <span class="text-danger" id="message"></span>
                        </div>
                        <input type="submit" class="btn btn-main btn-block m-1" value="Signup" name="action" id="signup">
                        <a class="btn m-1 btn-block" href="login.jsp">Sign In</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
