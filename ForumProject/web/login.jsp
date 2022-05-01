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

        <div class="container color-main2 pb-3">
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
                            <button class="btn color-main font-weight-bold form-control" type="submit" id="btn" ><i class="fas fa-sign-in-alt"></i> ĐĂNG NHẬP</button>
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
