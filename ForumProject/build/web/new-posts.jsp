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

        <%@include file="headNav.jsp" %>


        <%@include file="navbar-first.jsp" %>

        <div class="container pt-2 pb-2" style="background-color: #E49637">
            <div class="row">
                <div class="col">
                    <a class="btn btn-light btn-sm" onclick="history.back()" style="padding: 1px 4px"><i class="fas fa-angle-left"></i> Quay lại</a>
                </div>
            </div>
        </div>

        <div class="container color-main2 pb-4 pt-3" style="background-color: #FFAF4D">
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
                        <button style="background-color: #F44336" class="btn btn-sm btn-danger form-control" type="submit"><span class="fas fa-key"></span> ĐĂNG BÀI</button>
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
