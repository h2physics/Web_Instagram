<%-- 
    Document   : home
    Created on : Mar 15, 2018, 9:21:28 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagram</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .content{
                width: 800px
            }
            .comment{
                list-style-type: none
            }
            #avatar{
                border-radius: 50% 
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu.jsp"/>

            <c:forEach var="p" items="${posts}">
                <div class="content" style="margin: 0 auto; border: 1px solid #A0A0A0">
                    <div class="content content-header" style="padding: 10px; height: 50px">
                        <ul class="nav navbar-nav">
                            <li class="active"><img id="avatar" src="image/default_avatar.jpg" width="30px" height="30px"/></li>
                            <li class="active" style="margin-left: 10px; margin-top: 5px">Van Hung</li>
                        </ul>
                    </div>
                    <img src=${p.image} width="798px"/>
                    <div style="display: inline-block">
                        <a href="#"><img src="image/favorite.png" width="25px" height="25px"/></a>
                        <a href="#"><img src="image/favorite.png" width="25px" height="25px"/></a>
                    </div>
                    <div>
                        <ul class="comment">
                            <li>h2physics: Nice</li>
                            <li>h2physics: Nice</li>
                            <li>h2physics: Nice</li>
                            <li>h2physics: Nice</li>
                            <li>h2physics: Nice</li>
                        </ul>

                        <form class="navbar-form" action="HomeController">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Write comment">
                            </div>
                            <button type="submit" class="btn btn-default">Send</button>
                        </form>
                    </div>
                </div>
            </c:forEach>


        </div>
    </body>
</html>
