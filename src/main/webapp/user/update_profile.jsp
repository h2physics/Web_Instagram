<%-- 
    Document   : update_profile
    Created on : Mar 25, 2018, 1:51:20 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            #avatar{
                border-radius: 50%;
                width: 40px;
                height: 40px;
                background-size: cover;
                background-position: top center;
            }
            .table_title{
                width: 30%;
                text-align: right;
                padding-right: 20px;
                padding-bottom: 15px;
            }
            .table_content{
                width: 70%;
            }
            .inputfield{
                width: 100%;
                border-radius: 3px;
                border: 1px solid #ccc;
                margin-bottom: 15px;
                padding: 7px;
                padding-left: 13px;
            }
            strong{
                text-align: right;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu.jsp"/>
            <jsp:useBean id="u" class="data.local.UserDAO"/>
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-6">
                    <form action="../UpdateProfileController" method="post">
                        <table style="width: 100%">
                            <tr>
                                <td class="table_title"><img id="avatar" style="background-image: url('../image/default_avatar.jpg')"/></td>
                                <td class="table_content">
                                    <p style="font-size: 1.3em; margin-bottom: 0">${u.getUser(id).username}</p>
                                    <p style="font-size: 0.9em"><a href="#">Update avatar</a></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_title"><strong>Name</strong></td>
                                <td class="table_content">
                                    <input type="text" name="txtName" value="${u.getUser(id).fullname}" class="inputfield"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_title"><strong>Username</strong></td>
                                <td class="table_content">
                                    <input type="text" name="txtUsername" value="${u.getUser(id).username}" class="inputfield"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_title"><strong>Website</strong></td>
                                <td class="table_content">
                                    <input type="text" name="txtWebsite" value="${u.getUser(id).website}" class="inputfield"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_title"><strong>Biography</strong></td>
                                <td class="table_content">
                                    <textarea rows="4" class="inputfield" name="txtBiography">
                                        ${u.getUser(id).biography}
                                    </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_title"><strong>Email</strong></td>
                                <td class="table_content">
                                    <input type="text" name="txtEmail" value="${u.getUser(id).email}" class="inputfield" readonly style="background-color: #ddd"/>
                                </td>
                            </tr>

                            <tr>
                                <td class="table_title"><strong>Phone number</strong></td>
                                <td class="table_content">
                                    <input type="text" name="txtPhone" value="${u.getUser(id).phoneNumber}" class="inputfield"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_title"><strong>Gender</strong></td>
                                <td>
                                    <input type="radio" name="txtGender" value="Male" checked/> Male
                                    <input type="radio" name="txtGender" value="Female" style="margin-left: 20px;"/> Male
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success" name="btnUpdate"  style="margin-top: 20px;">Update</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="col-md-3">

                </div>
            </div>
        </div>
    </body>
</html>
