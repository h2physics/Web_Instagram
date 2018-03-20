<%-- 
    Document   : profile
    Created on : Mar 15, 2018, 9:21:37 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                position: absolute;
                left: 0
            }
            .header-right{
                position: absolute;
                right: 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu.jsp"/>
            
            <div class="header">
                <img class="avatar" src="image/default_avatar.jpg" width="100px" height="100px"/>
                
                <div class="header-right">
                    
                </div>
                
            </div>
        </div>
    </body>
</html>
