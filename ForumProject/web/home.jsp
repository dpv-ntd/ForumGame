<%-- 
    Document   : home
    Created on : Apr 29, 2022, 11:58:37 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@include file="head.jsp" %>
    </head>

    <body class="">

        <%@include file="headNav.jsp" %>


        <%@include file="navbar-first.jsp" %>
        <style>
            #columns {
            }

            div#columns figure {
                margin: 0 2px 0;
                transition: opacity .4s ease-in-out;
                display: inline-block
            }

            div#columns figure img {
            }

            div#columns figure figcaption {
                font-size: 9px;
                color: #444
            }

            div#columns small {
                font-size: 1rem;
                float: right;
                text-transform: uppercase;
                color: #aaa
            }

            div#columns small a {
                color: #666;
                text-decoration: none;
                transition: .4s color
            }
        </style>
        <div class="container text-center pb-2" style="background-color: #FFAF4D" id="columns">
            <figure>
                <a href=""><img height="35" src="app/view/images/button/jar.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">210</span> - <b> 6 ngày</b>
                </figcaption>
            </figure>
            <figure>
                <a href=""><img height="35" src="app/view/images/button/android.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">210</span> - <b> 6 ngày</b>
                </figcaption>
            </figure>
            <figure>
                <a href=""><img height="35" src="app/view/images/button/play.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">210</span> - <b> 6 ngày</b>
                </figcaption>
            </figure>
            <figure>
                <a href=""><img height="35" src="app/view/images/button/pc.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">210</span> - <b> 6 ngày</b>
                </figcaption>
            </figure>
            <figure>
                <a href=""><img height="35" src="app/view/images/button/ip.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">210</span> - <b> 6 ngày</b>
                </figcaption>
            </figure>
            <figure>
                <a href=""><img height="35" src="app/view/images/button/wp.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">210</span> - <b> 6 ngày</b>
                </figcaption>
            </figure>
            <figure>
                <a href=""><img height="35" src="app/view/images/button/napngoc.png" alt=""/></a>
                <figcaption>
                    <span style="color:rgb(209, 9, 50);">Báo Lỗi thẻ</span>
                </figcaption>
            </figure>
        </div>

        <div class="container pt-2" style="background-color: #E49637">
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
                                <c:forEach items="${listplayer}" var="lpl">
                                    <c:if test="${lpl.getId() == lpn.getUser_id()}">
                                        <c:if test="${lpl.getAdmin() == 1 || lpl.getAdmin() == 2}">
                                            <a href="topic?id=${lpn.getId()}" class="important" style="color: #AD4105"> 
                                                <c:if test="${lpn.getLock() == 1}">
                                                    <span class="fas fa-lock" style="font-size: 11px"></span>
                                                </c:if>
                                                ${lpn.getTitle()} 
                                                <c:if test="${lpn.getStatus() == 2}">
                                                    <img src="app/view/images/status/new.gif">
                                                </c:if>
                                                <c:if test="${lpn.getStatus() == 3}">
                                                    <img src="app/view/images/status/hot.gif">
                                                </c:if>
                                            </a>
                                            <div class="box-name" style="font-size: 10px;">
                                                từ <b style="color: #1E5B7E">${lpl.getDisplayname()}</b> <i style="color: #666666">Trả lời: ${lpn.getReply()} - Xem: ${lpn.getView()}<span style="color:red"> [♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpn.getLike()}" />]</span></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${lpl.getAdmin() == 3 || lpl.getAdmin() == 0}">
                                            <a href="topic?id=${lpn.getId()}" style="color: #AD4105"> 
                                                <c:if test="${lpn.getLock() == 1}">
                                                    <span class="fas fa-lock" style="font-size: 11px"></span>
                                                </c:if>
                                                ${lpn.getTitle()} 
                                                <c:if test="${lpn.getStatus() == 2}">
                                                    <img src="app/view/images/status/new.gif">
                                                </c:if>
                                                <c:if test="${lpn.getStatus() == 3}">
                                                    <img src="app/view/images/status/hot.gif">
                                                </c:if>
                                            </a>
                                            <div class="box-name" style="font-size: 10px;">
                                                <c:if test="${lpl.getAdmin() == 3}">
                                                    từ <b style="color: #1E5B7E">${lpl.getUsername()}</b> <i style="color: #666666">Trả lời: ${lpn.getReply()} - Xem: ${lpn.getView()}<span style="color:red"> [♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpn.getLike()}" />]</span></i>
                                                </c:if>
                                                <c:if test="${lpl.getAdmin() == 0}">
                                                    bởi <b style="color: #1E5B7E">${lpl.getUsername()}</b> <i style="color: #666666">Trả lời: ${lpn.getReply()} - Xem: ${lpn.getView()}<span style="color:red"> [♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpn.getLike()}" />]</span></i>
                                                </c:if>
                                            </div>
                                        </c:if>

                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <div class="container pt-2 pb-2 color-main2" style="background-color: #FFAF4D">
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
                                <a href="topic?id=${lpo.getId()}" style="color: #AD4105">
                                    <c:if test="${lpo.getLock() == 1}">
                                        <span class="fas fa-lock" style="font-size: 11px"></span>
                                    </c:if>
                                    ${lpo.getTitle()}
                                </a>
                                <div class="box-name" style="font-size: 10px;">
                                    <c:forEach items="${listplayer}" var="lpl">
                                        <c:if test="${lpl.getId() == lpo.getUser_id()}">
                                            <c:if test="${lpl.getAdmin() == 1 || lpl.getAdmin() == 2}">
                                                từ <b style="color: #1E5B7E">${lpl.getDisplayname()}</b> <i style="color: #666666">Trả lời: ${lpo.getReply()} - Xem: ${lpo.getView()}<span style="color:red"> [♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpo.getLike()}" />]</span></i>
                                            </c:if>
                                            <c:if test="${lpl.getAdmin() == 3}">
                                                từ <b style="color: #1E5B7E">${lpl.getUsername()}</b> <i style="color: #666666">Trả lời: ${lpo.getReply()} - Xem: ${lpo.getView()}<span style="color:red"> [♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpo.getLike()}" />]</span></i>
                                            </c:if>
                                            <c:if test="${lpl.getAdmin() == 0}">
                                                bởi <b style="color: #1E5B7E">${lpl.getUsername()}</b> <i style="color: #666666">Trả lời: ${lpo.getReply()} - Xem: ${lpo.getView()}<span style="color:red"> [♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpo.getLike()}" />]</span></i>
                                            </c:if>
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
                    <a style="background-color: #F44336; color: white" class="btn btn-sm btn-danger" href="new-posts">Đăng bài mới</a>
                </div>
                <div class="col text-right">
                    <a href="/box/0/1" class="btn btn-sm" style="background-color: #561D00; color: white"> 1 </a>
                    <a href="/box/0/2" class="btn btn-sm" style="background-color: white; color: #561D00">2</a>
                    <a href="/box/0/3" class="btn btn-sm" style="background-color: white; color: #561D00">3</a>
                    <a href="/box/0/2" class="btn btn-sm" style="background-color: white; color: #561D00">></a>
                </div>
            </div>

        </div>

        <%@include file="foot.jsp" %>

    </body>

    <!-- Bootstrap core JavaScript -->

    <script src="https://nroblue.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
