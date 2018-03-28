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
        <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>
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
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: left;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }
            strong{
                text-align: right;
            }
            #scroll_box{
                height: 120px;
                width: 200px;
                display: auto;
                border: 1px soli #CCCCCC;
                margin: 1em 0;
                border-color: black;
                border-style: black;
                position: absolute;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <jsp:useBean id="u" class="data.local.UserDAO"/>
            
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-6">
                    <form action="../UpdateProfileController" method="post" enctype="multipart/form-data">
                        <table style="width: 100%">
                            <tr>
                                <td class="table_title">
                                    <c:if test="${u.getUser(id).avatar == null}">
                                        <img id="avatar" style="background-image: url('../image/default_avatar.png')"/>
                                    </c:if>
                                        <c:if test="${u.getUser(id).avatar != null}">
                                        <img id="avatar" style="background-image: url('${u.getUser(id).avatar}')"/>
                                    </c:if>
                                </td>
                                <td class="table_content">
                                    <p style="font-size: 1.3em; margin-bottom: 0">${u.getUser(id).username}</p>
                                    <p style="font-size: 0.9em">
                                        <span class="btn btn-default btn-file" style="background-color: #6EC3C9; color: white">
                                            Upload avatar <input type="file" name="avatar" value="fileupload" id="fileupload"> 
                                        </span>
                                    </p>
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
                                    <c:if test="${u.getUser(id).gender == 0}">
                                        <input type="radio" name="txtGender" value="Male" checked/> Male
                                        <input type="radio" name="txtGender" value="Female" style="margin-left: 20px;"/> Female
                                    </c:if>
                                    <c:if test="${u.getUser(id).gender == 1}">
                                        <input type="radio" name="txtGender" value="Male"/> Male
                                        <input type="radio" name="txtGender" value="Female" style="margin-left: 20px;" checked=""/> Female
                                    </c:if>
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
