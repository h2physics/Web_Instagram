<%-- 
    Document   : login
    Created on : Mar 15, 2018, 9:21:18 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ"
        crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
        </style>
    </head>
    <body>
        <div class="container" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-6" style="text-align: right">
                    <img src="http://mediakix.com/wp-content/uploads/2016/08/How-To-Use-Instagram-Stories-Guide.png" />
                </div>
                <div class="col-md-6" style="text-align: left">
                    <div style="width: 350px; border: 1px solid #B7B7B7; padding: 30px; margin-top: 30px; background-color: #fafafa">
                        <h2 style="text-align: center; font-family: 'Satisfy', cursive; font-size: 3em; margin: 0 0 30px 0;">Instagram</h2>
                        <form action="LoginController" method="post">
                            <div class="form-group">
                                <input type="email" class="form-control" name="emailLogin" placeholder="Email" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="passwordLogin" placeholder="Password" />
                            </div>
                            <p style="text-align: center">
                                <button type="submit" name="btnLogin" class="btn btn-success" align="center">Login</button>
                            </p>
                        </form>
                        <p style="text-align: center">Or</p>
                        <form action="LoginController" method="post">
                            <div class="form-group">
                                <input type="email" class="form-control" name="emailRegister" placeholder="Email" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="fullname" placeholder="Full name" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="username" placeholder="Username" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="passwordRegister" placeholder="Password" />
                            </div>
                            <p style="text-align: center">
                                <button type="submit" name="btnRegister" class="btn btn-primary" align="center">Register</button>
                            </p>
                        </form>

                        <div style="margin-top: 30px">
                            <button type="submit" name="facebookLogin" class="btn btn-default" style="width: 300px; background: 	#3b5998; color: #fff">
                                <i class="fab fa-facebook-f" style="font-size: 1.2em; margin-right: 5px;"></i> Login with Facebook</button>
                            <button type="submit" name="googleLogin" class="btn btn-default" style="width: 300px; margin-top: 15px; background: 	#db3236; color: #fff">
                                <i class="fab fa-google" style="font-size: 1.2em; margin-right: 5px;"></i> Login with Google</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
