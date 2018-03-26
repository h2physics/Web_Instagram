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
                width: 100%;
            }
            .comment{
                list-style-type: none
            }
            #avatar{
                border-radius: 50%;
                width: 40px;
                height: 40px;
                background-size: cover;
                background-position: top center;
            }
            #title{
                margin: 10px;
            }
            #scrollbar{
                background-color: white;
                width: 100%;
                height: 400px;
                overflow: scroll;
            }
            .follow_button{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="u" class="data.local.UserDAO"/>
        <jsp:useBean id="c" class="data.local.CommentDAO"/>
        <div class="container">
            <jsp:include page="menu.jsp"/>

            <div class="row">
                <div class="col-md-1">

                </div>
                <div class="col-md-7">
                    <c:forEach var="p" items="${posts}">
                        <div class="content" style="margin: 0 auto; border: 1px solid #A0A0A0">
                            <div class="content" style="padding: 10px; height: 50px">
                                <ul class="nav navbar-nav">
                                    <li class="active"><img id="avatar" style="background-image: url('../image/default_avatar.jpg')"/></li>

                                    <li class="active" style="margin-left: 10px; margin-top: 5px">
                                        <a href="../ProfileController?uid=${p.uid}">${u.getUser(p.uid).fullname}</a>
                                    </li>
                                </ul>
                            </div>
                            <c:if test="${not empty p.content}">
                                <p id="title">${p.content}</p>
                            </c:if>
                            <img src=${p.image} width="100%"/>
                            <div style="display: inline-block">
                                <a href="#"><img src="../image/favorite.png" width="25px" height="25px"/></a>
                                <a href="#"><img src="../image/favorite.png" width="25px" height="25px"/></a>
                            </div>
                            <div>
                                <ul class="comment">
                                    <c:forEach var="comment" items="${c.getComments(p.id)}">
                                        <li>
                                            <strong>${u.getUser(comment.uid).fullname}</strong>: ${comment.content}
                                        </li>
                                    </c:forEach>
                                </ul>

                                <form class="navbar-form" action="../HomeController" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Write comment" name="txtComment">
                                    </div>
                                    <input type="text" name="txtPostId" value="${p.id}" hidden/>
                                    <button type="submit" class="btn btn-default" name="btnComment">Send</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-md-3">
                            <img id="avatar" style="background-image: url('../image/default_avatar.jpg')"/>
                        </div>
                        <div class="col-md-9">
                            <h4>${u.getUser(id).username}</h4>
                            <p>${u.getUser(id).fullname}</p>
                        </div>
                    </div>
                    <hr/>
                    <div id="scrollbar">
                        <c:forEach var="currentUser" items="${u.users}">
                            <c:if test="${currentUser.id != id}">
                                <div class="row" style="margin-top: 10px">
                                    <div class="col-md-3">
                                        <img id="avatar" style="background-image: url('../image/default_avatar.jpg')"/>
                                    </div>
                                    <div class="col-md-5">
                                        <h4>${currentUser.username}</h4>
                                    </div>
                                    <div class="col-md-3" style="padding-left: 0; padding-right: 0">
                                        <c:if test="${u.checkRelationship(id, currentUser.id) == true}">
                                            <a href="../HomeController?friend_id=${currentUser.id}&action=unfollow" class="follow_button btn btn-default">Following</a>
                                        </c:if>
                                        <c:if test="${u.checkRelationship(id, currentUser.id) == false}">
                                            <a href="../HomeController?friend_id=${currentUser.id}&action=follow" class="follow_button btn btn-default">Follow</a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
                <div class="col-md-1">

                </div>
            </div>
        </div>
    </body>
</html>
