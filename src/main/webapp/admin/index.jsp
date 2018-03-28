<%-- 
    Document   : index
    Created on : Mar 20, 2018, 3:41:06 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: "Lato", sans-serif;
                transition: background-color .5s;
            }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                color: #f1f1f1;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }
            .tabledatabase{
                width: 100%;
            }
            .logout{
                width: 100px;
                background-color: red;
                color: white;
            }

            #main {
                transition: margin-left .5s;
                padding: 16px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="userBean" class="data.local.UserDAO"/>
        <nav class="navbar navbar-default" id="main">
            <div class="container-fluid">
                <div class="navbar-header">
                    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Hello ${userBean.getUser(id).username}</span>
                </div>
                <div class="navbar-header navbar-right">
                    <a href="../AdminController?action=logout" class="logout btn">Log out</a>
                </div>
            </div>
        </nav>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="../AdminController?action=user">User</a>
            <a href="../AdminController?action=post">Post</a>
            <a href="../AdminController?action=comment">Comment</a>
            <a href="../AdminController?action=rela">Relationship</a>
            <a href="../AdminController?action=favorite">Favorite</a>
        </div>

        <div id="main">
            <div class="container">
                <div class="row">
                    <c:if test="${not empty adminUsers}">
                        <h1>User database</h1>
                        <div id="addUsers" >
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                Add User
                            </button>
                            <div id="myModal"  class="modal fade" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="Users">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">Enter your information</h4>
                                        </div>
                                        <div class="modal-body" style="width: 600px" >
                                            <form action="../LoginController" method="post" >
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
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="submit" name="btnRegister" class="btn btn-primary" align="center">Register</button>
                                                </p>
                                            </form>
                                        </div>                                                          
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        </div>    
                        <table class="tabledatabase table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Full name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Gender</th>
                                <th>Phone number</th>
                                <th>Website</th>
                                <th>Biography</th>
                                <th>Avatar</th>
                                <th>Role</th>
                            </tr>
                            <c:forEach var="u" items="${adminUsers}">
                                <tr>
                                    <td>${u.id}</td>
                                    <td>${u.fullname}</td>
                                    <td>${u.username}</td>
                                    <td>${u.email}</td>
                                    <td>${u.password}</td>
                                    <td>${u.gender}</td>
                                    <td>${u.phoneNumber}</td>
                                    <td>${u.website}</td>
                                    <td>${u.biography}</td>
                                    <td>${u.avatar}</td>
                                    <td>${u.role}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <c:if test="${not empty adminPosts}">
                        <h1>Post database</h1>
                        <table class="tabledatabase table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Author</th>
                                <th>Image</th>
                                <th>Time</th>
                                <th>Content</th>
                                
                            </tr>
                            <c:forEach var="p" items="${adminPosts}">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${userBean.getUser(p.uid).username}</td>
                                    <td>${p.image}</td>
                                    <td>${p.time}</td>
                                    <td>${p.content}</td>
                                    
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${not empty adminComments}">
                        <h1>Comment database</h1>
                        <table class="tabledatabase table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Author</th>
                                <th>Post ID</th>
                                <th>Content</th>
                                <th>Time</th>
                                <th></th>
                            </tr>
                            <c:forEach var="c" items="${adminComments}">
                                <tr>
                                    <td>${c.id}</td>
                                    <td>${userBean.getUser(c.uid).username}</td>
                                    <td>${c.postId}</td>
                                    <td>${c.content}</td>
                                    <td>${c.time}</td>
                                    <td>
                                        <a href="../AdminController?commentId=${c.id}&action=delete" class="btn btn-primary btn-lg">
                                            Delete Comment
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${not empty adminRelas}">
                        <h1>Relationship database</h1>
                        <table class="tabledatabase table table-bordered">
                            <tr>
                                <th>User</th>
                                <th>Friend</th>
                                <th></th>
                            </tr>
                            <c:forEach var="r" items="${adminRelas}">
                                <tr>
                                    <td>${userBean.getUser(r.uid).username}</td>
                                    <td>${userBean.getUser(r.friendId).username}</td>
                                    <td>
                                        <a href="../AdminController?uid=${r.uid}&friendId=${r.friendId}&action=unfollow" class="btn btn-primary btn-lg">
                                            Unfollow Users
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${not empty adminFavorites}">
                        <h1>Favorites database</h1>
                        <table class="tabledatabase table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Post</th>
                                <th></th>
                            </tr>
                            <c:forEach var="f" items="${adminFavorites}">
                                <tr>
                                    <td>${userBean.getUser(f.uid).username}</td>
                                    <td>${f.postId}</td>
                                    <td>
                                        <a href="../AdminController?uid=${f.uid}&postId=${f.postId}&action=unlike" class="btn btn-primary btn-lg">
                                            Unlike Post
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>

        </div>
    </body>
</html>
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
        document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
        document.body.style.backgroundColor = "white";
    }
</script>
