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
                border-radius: 50%;
                width: 40px;
                height: 40px;
                background-size: cover;
                background-position: top center;
            }
            #scroll_box{
                height: 120px;
                width: 400px;
                display: auto;
                border: 1px soli #CCCCCC;
                margin: 1em 0;
                border-color: black;
                border-style: black;
            }
            #title{
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu.jsp"/>

            <div id="scroll_box">
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#postModal">
                    Post article
                </button>
                <div id="postModal"  class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Post</h4>
                            </div>
                            <form action="Save">
                                <div class="modal-body" style="width: 700px" >
                                    <input type="textbox" name="writePost" placeholder="Bạn đang nghĩ gì...." width="700px">
                                </div>
                                <div class="modal-footer">
                                    <input type="file" name="fileupload" value="fileupload" id="fileupload"> 
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <c:forEach var="p" items="${posts}">
                <div class="content" style="margin: 0 auto; border: 1px solid #A0A0A0">
                    <div class="content content-header" style="padding: 10px; height: 50px">
                        <ul class="nav navbar-nav">
                            <li class="active"><img id="avatar" style="background-image: url('image/default_avatar.jpg')"/></li>
                            <li class="active" style="margin-left: 10px; margin-top: 5px">Van Hung</li>
                        </ul>
                    </div>
                    <c:if test="${not empty p.content}">
                        <p id="title">${p.content}</p>
                    </c:if>
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
