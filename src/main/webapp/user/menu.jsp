<%-- 
    Document   : header
    Created on : Mar 19, 2018, 2:12:46 PM
    Author     : H2PhySicS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            #scroll_box{
                height: 120px;
                width: 400px;
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
        <nav class="navbar navbar-default">
            <div class="container-fluid" style="position: relative">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../HomeController">Instagram</a>
                </div>

                <form class="navbar-form navbar-left" style="margin-left: 100px" action="../HomeController" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a style="cursor: pointer" data-toggle="modal" data-target="#postModal"><i class="fas fa-upload" style="width: 20px; height: 20px"></i></a>

                    </li>
                    <li class="active"><a href="#"><i class="fas fa-heart" style="width: 20px; height: 20px"></i></a></li>
                    <li class="active"><a href="../ProfileController"><i class="fas fa-user" style="width: 20px; height: 20px"></i></a></li>
                </ul>
            </div>
        </nav>
        <div id="scroll_box">
            <div id="postModal"  class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Post</h4>
                        </div>
                        <form action="../HomeController" method="post" enctype="multipart/form-data">
                            <div class="modal-body" style="width: 700px" >
                                <input type="textbox" name="txtPostContent" placeholder="Bạn đang nghĩ gì...." width="700px">
                            </div>
                            <div class="modal-footer">
                                <input type="file" name="fileupload" value="fileupload" id="fileupload"> 
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" value="submit" name="btnUpload">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
