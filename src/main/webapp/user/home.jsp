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
        <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>
        <style>
            .author {
                color: black;
                text-decoration: none;
                font-weight: bold;
            }
            .author:hover{
                color: black;
                text-decoration: none;
            }
            .content{
                width: 100%;
            }
            .comment{
                padding-left: 20px;
            }
            .follow_button{
                width: 100%;
            }
            #avatar{
                border-radius: 50%;
                width: 40px;
                height: 40px;
                background-size: cover;
                background-position: top center;
            }
            #title{
                margin: 5px 5px 5px 5px;
            }
            #scrollbar{
                background-color: white;
                width: 100%;
                height: 400px;
                overflow: scroll;
            }
            #inputComment{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
            }
            #buttonComment{
                height: 48px;
                background-color: transparent;
                border: 0;
                margin-top: 7px;
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
                <div class="col-md-6">
                    <c:forEach var="p" items="${posts}">
                        <div class="content" style="margin: 0 auto; border: 1px solid #A0A0A0">
                            <div class="row" style="padding: 15px; height: 70px">
                                <div class="col-md-1">
                                    <c:if test="${u.getUser(p.uid).avatar == null}">
                                        <img id="avatar" style="background-image: url('../image/default_avatar.png')"/>
                                    </c:if>
                                    <c:if test="${u.getUser(p.uid).avatar != null}">
                                        <img id="avatar" style="background-image: url('${u.getUser(p.uid).avatar}')"/>
                                    </c:if>
                                </div>
                                <div class="col-md-11" style="margin-top: 10px;">
                                    <a class="author" href="../ProfileController?uid=${p.uid}">${u.getUser(p.uid).fullname}</a>
                                </div>
                            </div>
                            <c:if test="${not empty p.content}">
                                <p id="title">${p.content}</p>
                            </c:if>
                            <img src=${p.image} width="100%"/>
                            <div style="display: inline-block; padding: 10px 10px 5px 20px">
                                <a href="#"><i class="far fa-heart" style="width: 25px; height: 25px"></i></a>
                            </div>
                            <div>
                                <div class="comment">
                                    <c:forEach var="comment" items="${c.getComments(p.id)}">
                                        <p><strong>${u.getUser(comment.uid).fullname}</strong>: ${comment.content}</p>
                                    </c:forEach>
                                </div>

                                <form class="navbar-form" action="../HomeController" method="post">
                                    <div class="row">
                                        <div class="col-md-11">
                                            <input id="inputComment" type="text" placeholder="Write comment" name="txtComment">
                                        </div>
                                        <div class="col-md-1" style="padding-left: 0">
                                            <input type="text" name="txtPostId" value="${p.id}" hidden/>
                                            <button type="submit" name="btnComment" id="buttonComment"><i class="fas fa-location-arrow" style="width: 25px; height: 25px;"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-3">
                            <c:if test="${u.getUser(id).avatar == null}">
                                <img id="avatar" style="background-image: url('../image/default_avatar.png'); width: 55px; height: 55px; margin-top: 6px;"/>
                            </c:if>
                            <c:if test="${u.getUser(id).avatar != null}">
                                <img id="avatar" style="background-image: url('${u.getUser(id).avatar}'); width: 55px; height: 55px; margin-top: 6px;"/>
                            </c:if>
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
                                        <c:if test="${currentUser.avatar == null}">
                                            <img id="avatar" style="background-image: url('../image/default_avatar.png'); width: 55px; height: 55px; "/>
                                        </c:if>
                                        <c:if test="${currentUser.avatar != null}">
                                            <img id="avatar" style="background-image: url('${currentUser.avatar}'); width: 55px; height: 55px; "/>
                                        </c:if>
                                    </div>
                                    <div class="col-md-5" style="margin-top: 10px;">
                                        <h4>${currentUser.username}</h4>
                                    </div>
                                    <div class="col-md-3" style="padding-left: 0; padding-right: 0; margin-top: 10px;">
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
