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

        <%@include  file="headNav.jsp" %>


        <%@include file="navbar-first.jsp" %>

        <div class="container color-main2 pb-3" style="background-color: #FFAF4D">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 pr-5 pl-5">
                    <h4 class="text-center">ĐĂNG NHẬP</h4>
                    <form method="post" id="form" action="login">
                        <div class="form-group">
                            <label>Tài khoản:</label>
                            <input class="form-control" id="user" name="user">
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu:</label>
                            <input class="form-control" id="pass" name="pass" type="password">
                        </div>
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="accept" name="accept" id="accept" checked="checked"> Chấp nhận <a href="/dieu-khoan">Điều khoản sử dụng</a>
                            </label>
                        </div>
                        <div id="notify" class="text-danger form-group">
                            ${notify}
                        </div>
                        <div class="form-group">
                            <button style="background-color: #F44336"  class="btn btn-sm btn-danger font-weight-bold form-control" type="submit" id="btn" ><i class="fas fa-sign-in-alt"></i> ĐĂNG NHẬP</button>
                        </div>
                    </form>
                    <div class="text-center">
                        <p>Bạn chưa có tài khoản? <a href="register">Đăng ký tại đây</a></p>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="foot.jsp" %>

    </body>

    <!-- Bootstrap core JavaScript -->

    <script src="https://nroblue.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
