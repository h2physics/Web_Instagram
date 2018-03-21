<%-- 
    Document   : header
    Created on : Mar 19, 2018, 2:12:46 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid" style="position: relative">
                <div class="navbar-header">
                    <a class="navbar-brand" href="HomeController">Instagram</a>
                </div>

                <form class="navbar-form navbar-left" style="margin-left: 100px" action="HomeController" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#"><img src="image/favorite.png" width="20px" height="20px"/></a></li>
                    <li class="active"><a href="ProfileController"><img src="image/user.png" width="20px" height="20px"/></a></li>
                </ul>
            </div>
        </nav>
    </body>
</html>
