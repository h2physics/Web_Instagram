<%-- 
    Document   : profile
    Created on : Mar 15, 2018, 9:21:37 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .header{
                position: relative
            }
            .avatar{
                border-radius: 50%;
                margin-top: 10px;
                background-image: url("image/default_avatar.jpg");
                width: 130px;
                height: 130px;
                background-size: cover;
                background-position: top center;

            }
            .follow_button{
                width: 100px;
                margin-top: 20px;
            }
            .logout_button{
                width: 100px;
                margin-top: 20px;
                background-color: red
            }
            .gallery{
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="u" class="data.local.UserDAO"/>
        <div class="container">
            <jsp:include page="menu.jsp"/>

            <div class="header row">
                <div class="col-md-4">
                    <p style="text-align: center">
                        <img class="avatar"/>
                    </p>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-4">
                            <h2>${user.username}</h2>
                        </div>
                        <div class="col-md-8">
                            <c:if test="${isMe == true}">
                                <button type="submit" class="follow_button btn btn-default">Setting</button>
                                <button type="submit" class="logout_button btn btn-default">Log out</button>
                            </c:if>
                            <c:if test="${isMe == false}">
                                <form method="post">
                                    <c:if test="${u.checkRelationship(id, user.id) == true}">
                                        <button type="submit" class="follow_button btn btn-default">Following</button>
                                    </c:if>
                                    <c:if test="${u.checkRelationship(id, user.id) == false}">
                                        <button type="submit" class="follow_button btn btn-default">Follow</button>
                                    </c:if>
                                </form>
                            </c:if>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <strong>${fn:length(posts)}</strong> posts
                        </div>
                        <div class="col-md-4">
                            <strong>1025</strong> followers
                        </div>
                        <div class="col-md-4">
                            <strong>480</strong> followings
                        </div>
                    </div>
                    <h3>${user.fullname}</h3>
                    <p>${user.email}</p>
                    <c:if test="${not empty user.website}"> 
                        <p>${user.website}</p>
                    </c:if>
                    <c:if test="${not empty user.phoneNumber}"> 
                        <p>${user.phoneNumber}</p>
                    </c:if>
                    <c:if test="${not empty user.biography}"> 
                        <p>${user.biography}</p>
                    </c:if>
                </div>
            </div>
            <hr/>
            <div class="content row galerry">
                <c:forEach var="p" items="${posts}">
                    <div class="col-md-4" style="padding:0.5em;">
                        <div style="background-image: url(${p.image}); height: 350px; background-size: cover; background-position: center;"></div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>

