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
        <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
        <style>
            .header{
                position: relative
            }
            .avatar{
                border-radius: 50%;
                margin-top: 10px;
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
            .image-post:hover {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="u" class="data.local.UserDAO"/>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="header row">
                <div class="col-md-4">
                    <p style="text-align: center">
                        <c:if test="${user.avatar == null}">
                            <img class="avatar" style="background-image: url('../image/default_avatar.png');"/>
                        </c:if>
                        <c:if test="${user.avatar != null}">
                            <img class="avatar" style="background-image: url('${user.avatar}');"/>
                        </c:if>
                    </p>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-4">
                            <h2 style="font-family: 'Nanum Gothic', sans-serif;">${user.username}</h2>
                        </div>
                        <div class="col-md-8">
                            <c:if test="${isMe == true}">
                                <a href="update_profile.jsp" class="follow_button btn btn-default">
                                    <i class="fas fa-cog"></i> Setting</a>
                                <a href="../ProfileController?action=logout" type="submit" class="logout_button btn btn-default">
                                    <i class="fas fa-sign-out-alt"></i> Log out</a>
                                </c:if>
                                <c:if test="${isMe == false}">
                                    <c:if test="${u.checkRelationship(id, user.id) == true}">
                                    <a href="../ProfileController?friend_id=${user.id}&action=unfollow" class="follow_button btn btn-default">Following</a>
                                </c:if>
                                <c:if test="${u.checkRelationship(id, user.id) == false}">
                                    <a href="../ProfileController?friend_id=${user.id}&action=follow" class="follow_button btn btn-default">Follow</a>
                                </c:if>
                            </c:if>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <strong>${fn:length(userPosts)}</strong> posts
                        </div>
                        <div class="col-md-4">
                            <strong>${u.getFollowers(id)}</strong> followers
                        </div>
                        <div class="col-md-4">
                            <strong>${u.getFollowings(id)}</strong> followings
                        </div>
                    </div>
                    <h3>${user.fullname}</h3>
                    <p><i class="far fa-envelope"></i> ${user.email}</p>
                    <c:if test="${not empty user.website}"> 
                        <p><i class="fab fa-github"></i> ${user.website}</p>
                    </c:if>
                    <c:if test="${not empty user.phoneNumber}"> 
                        <p><i class="fas fa-phone"></i> ${user.phoneNumber}</p>
                    </c:if>
                    <c:if test="${not empty user.biography}"> 
                        <p>${user.biography}</p>
                    </c:if>
                </div>
            </div>
            <hr/>
            <div class="content row galerry">
                <c:forEach var="p" items="${userPosts}">
                    <div class="col-md-4 image-post" style="padding:0.5em;">
                        <div style="background-image: url(${p.image}); height: 350px; background-size: cover; background-position: center;"></div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>

