<%-- 
    Document   : home
    Created on : Apr 29, 2022, 11:58:37 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@include file="head.jsp" %>
    </head>

    <body class="">

        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="text-center">
                        <img height="12" src="app/view/images/12.png" style="vertical-align: middle;"> <small style="font-size: 10px" id="hour3">Dành cho người chơi trên 12 tuổi. Chơi quá 180 phút mỗi ngày sẽ hại sức khỏe.</small>
                    </div>
                </div>
            </div>
            <div class="row bg bg-info pb-3 pt-2 rounded-top">
                <div class="col">
                    <div class="text-center mb-2">
                        <a href="home"><img class="rounded" src="app/view/images/logo/nroblue.png" id="logo"></a>
                    </div>
                    <div class="text-center pt-2">
                        <a href="http://download.nroblue.com/adr/" class="btn btn-success btn-sm font-weight-bold border"><i class="fas fa-download"></i> Android</a>
                        <a href="http://download.nroblue.com/pc/" class="btn btn-success btn-sm font-weight-bold border"><i class="fas fa-download"></i> Pc</a>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="navbar-first.jsp" %>

        <div class="container color-main2 pb-2" id="pageHeader">
            <div class="row text-center">
                <div class="col">
                    <a href="home" class="btn btn-sm bg-light">Diễn đàn</a>
                </div>
                <div class="col">
                    <a href="/box/1" class="btn btn-sm">Góp ý</a>
                </div>
                <div class="col">
                    <a href="/box/2" class="btn btn-sm">Báo lỗi</a>
                </div>
            </div>
        </div>

        <div class="container pt-2 pb-2" style="background-color: #17a2b8">
            <div class="row">
                <div class="col">
                    <a class="btn btn-light btn-sm" onclick="history.back()" style="padding: 1px 4px"><i class="fas fa-angle-left"></i> Quay lại</a>
                </div>
            </div>
        </div>

        <div class="container color-main2 pb-4 pt-3">
            <div class="row">
                <div class="col-lg-6 offset-lg-3  pr-5 pl-5">
                    <form action="new-posts" method="post">
                        <input name="userID" id="userID" value="${sessionScope.player.getId()}" type="hidden">
                        <input name="time" id="time" value="" type="hidden">
                        <div class="form-group">
                            <label>Tiêu đề:</label>
                            <input class="form-control" type="text" name="title" id="title" placeholder="Từ 4 tới 64 kí tự" required="">
                        </div>
                        <div class="form-group">
                            <label>Nội dung:</label>
                            <textarea class="form-control" name="content" id="content" aria-label="With textarea" placeholder="Từ 4 tới 256 kí tự" required=""></textarea>
                        </div>
                        <div id="notify" class="text-danger form-group">
                        </div>
                        <button class="btn btn-info btn-sm form-control" type="submit"><span class="fas fa-key"></span> ĐĂNG BÀI</button>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="foot.jsp" %>

    </body>

    <!-- Bootstrap core JavaScript -->

    <script type="text/javascript">
        document.getElementById('time').value = Date.now();
    </script>
    <script src="https://nroblue.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
