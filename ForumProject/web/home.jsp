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
                    <a href="" class="btn btn-sm bg-light">Diễn đàn</a>
                </div>
                <div class="col">
                    <a href="/box/1" class="btn btn-sm">Góp ý</a>
                </div>
                <div class="col">
                    <a href="/box/2" class="btn btn-sm">Báo lỗi</a>
                </div>
            </div>
        </div>


        <div class="container pt-2" style="background-color: #17a2b8">
            <div class="row">
                <div class="col">

                    <c:forEach items="${listpostsNotification}" var="lpn">
                        <div class="box-stt">
                            <div style="width: 30px; float:left; margin-right: 5px;">
                                <c:forEach items="${listplayer}" var="lpl">
                                    <c:if test="${lpl.getId() == lpn.getUser_id()}">
                                        <img src="app/view/images/avatar/${lpl.getAvatar()}.png" style="width: 25px">
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="box-right">
                                <a href="topic?id=${lpn.getId()}" class="important"> 
                                    ${lpn.getTitle()} 
                                    <c:if test="${lpn.getStatus() == 2}">
                                        <img src="app/view/images/status/new.gif">
                                    </c:if>
                                    <c:if test="${lpn.getStatus() == 3}">
                                        <img src="app/view/images/status/hot.gif">
                                    </c:if>
                                </a>
                                <div class="box-name" style="font-size: 9px;">
                                    <c:forEach items="${listplayer}" var="lpl">
                                        <c:if test="${lpl.getId() == lpn.getUser_id()}">
                                            từ ${lpl.getUsername()}
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <div class="container pt-2 pb-2 color-main2">
            <div class="row">
                <div class="col">

                    <c:forEach items="${listposts}" var="lpo">
                        <div class="box-stt">
                            <div style="width: 30px; float:left; margin-right: 5px;">
                                <c:forEach items="${listplayer}" var="lpl">
                                    <c:if test="${lpl.getId() == lpo.getUser_id()}">
                                        <img src="app/view/images/avatar/${lpl.getAvatar()}.png" style="width: 25px">
                                    </c:if>
                                </c:forEach>
                            </div>

                            <div class="box-right">
                                <a href="topic?id=${lpo.getId()}">
                                    ${lpo.getTitle()}
                                </a>
                                <div class="box-name" style="font-size: 9px;">
                                    <c:forEach items="${listplayer}" var="lpl">
                                        <c:if test="${lpl.getId() == lpo.getUser_id()}">
                                            bởi ${lpl.getUsername()}
                                        </c:if>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <a class="btn btn-light btn-sm" href="new-posts">Đăng bài mới</a>
                </div>
                <div class="col text-right">
                    <a href="/box/0/1" class="btn btn-sm btn-light page-active"> 1 </a>
                    <a href="/box/0/2" class="btn btn-sm btn-light">2</a>
                    <a href="/box/0/3" class="btn btn-sm btn-light">3</a>
                    <a href="/box/0/2" class="btn btn-sm btn-light">></a>
                </div>
            </div>

        </div>

        <%@include file="foot.jsp" %>

    </body>

    <!-- Bootstrap core JavaScript -->

    <script src="https://nroblue.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
