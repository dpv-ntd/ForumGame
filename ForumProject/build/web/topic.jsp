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

        <div class="container pt-2 pb-2" style="background-color: #17a2b8">
            <div class="row">
                <div class="col">
                    <a class="btn btn-light btn-sm" href="home" style="padding: 1px 4px"><i class="fas fa-angle-left"></i> Quay lại</a>
                </div>
            </div>
        </div>

        <div class="container pt-2 pb-2 color-main2">
            <div class="row mb-4">
                <div class="col">

                    <table cellpadding="0" cellspacing="0" width="99%" style="font-size: 13px;">
                        <tbody>
                            <tr>
                                <td width="60px;" style="vertical-align: top">
                                    <div class="text-center" style="margin-left: -10px;">
                                        <c:forEach items="${listplayer}" var="lpl">
                                            <c:if test="${lpl.getId() == getposts.getUser_id()}">
                                                <img src="app/view/images/avatar/${lpl.getAvatar()}.png" style="width: 30px; "></br>
                                                <c:if test="${lpl.getAdmin() == 1}">
                                                    <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #FF4444">
                                                        ${lpl.getDisplayname()}
                                                    </div>
                                                    <div style="font-size: 7px; font-weight: bold; color: #FF4444">
                                                        Admin
                                                    </div>
                                                </c:if>
                                                <c:if test="${lpl.getAdmin() == 2}">
                                                    <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #008000">
                                                        ${lpl.getDisplayname()}
                                                    </div>
                                                    <div style="font-size: 7px; font-weight: bold; color: #008000">
                                                        SMod
                                                    </div>
                                                </c:if>
                                                <c:if test="${lpl.getAdmin() == 3}">
                                                    <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #9932CC">
                                                        ${lpl.getUsername()}
                                                    </div>
                                                    <div style="font-size: 7px; font-weight: bold; color: #9932CC">
                                                        Mod
                                                    </div>
                                                </c:if>
                                                <c:if test="${lpl.getAdmin() == 0}">
                                                    <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #013481">
                                                        ${lpl.getUsername()}
                                                    </div>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </td>
                                <td class="bg bg-light" style=" border-radius: 7px">
                                    <div class="row" style="font-size: 9px; padding: 5px 7px;">
                                        <div class="col">
                                            <c:forEach items="${listplayer}" var="lpl">
                                                <c:if test="${lpl.getId() == getposts.getUser_id()}">
                                                    <img src="app/view/images/status/${lpl.getOnline() == 0 ? "offline":"online"}.png" alt=""/>
                                                </c:if>
                                            </c:forEach>
                                            <i id="timeTitle"></i>
                                        </div>
                                        <div class="col text-right">
                                            <c:if test="${sessionScope.player.getAdmin() == 1}">
                                                <span><a href=""><i>[EDIT]</i></a></span>
                                                <span><a href="topics?action=delete&&id=${getposts.getId()}"><i>[DEL]</i></a></span>
                                                <c:if test="${getposts.getLock() == 0}">
                                                    <span><a href="topics?action=lock&&id=${getposts.getId()}"><i>[KHÓA]</i></a></span>
                                                </c:if>
                                                <c:if test="${getposts.getLock() == 1}">
                                                    <span><a href="topics?action=unlock&&id=${getposts.getId()}"><i>[MỞ KHÓA]</i></a></span>
                                                </c:if>
                                                <c:if test="${getposts.getStatus() == 2}">
                                                    <span><a href="topics?action=hot&&id=${getposts.getId()}"><i>[HOT]</i></a></span>
                                                </c:if>
                                                <c:if test="${getposts.getStatus() == 3}">
                                                    <span><a href="topics?action=new&&id=${getposts.getId()}"><i>[NEW]</i></a></span>
                                                </c:if>
                                                <c:if test="${getposts.getStatus() > 1}">
                                                    <span><a href="topics?action=normal&&id=${getposts.getId()}"><i>[NORMAL]</i></a></span>
                                                </c:if>
                                                <c:if test="${getposts.getStatus() == 0}">
                                                    <span><a href="topics?action=new&&id=${getposts.getId()}"><i>[NEW]</i></a></span>
                                                    <span><a href="topics?action=hot&&id=${getposts.getId()}"><i>[HOT]</i></a></span>
                                                </c:if>
                                            </c:if>
                                            <c:forEach items="${listplayer}" var="lpl">
                                                <c:if test="${lpl.getId() == getposts.getUser_id()}">
                                                    <i>Điểm: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpl.getPosts()}" /></i>
                                                </c:if>
                                            </c:forEach>
                                        </div>

                                    </div>

                                    <div class="row" style="padding: 0 7px 15px 7px">
                                        <div class="col">
                                            <span class="font-weight-bold">
                                                ${getposts.getTitle()}
                                                <c:if test="${getposts.getStatus() == 2}">
                                                    <img src="app/view/images/status/new.gif">
                                                </c:if>
                                                <c:if test="${getposts.getStatus() == 3}">
                                                    <img src="app/view/images/status/hot.gif">
                                                </c:if>
                                            </span></br>
                                            <span>${getposts.getContent()}</span>
                                        </div>
                                    </div>
                                    <div class="row" style="font-size: 10px; padding: 5px 7px;">
                                        <c:if test="${sessionScope.player != null}">
                                            <c:set var="count" value="${0}"></c:set>
                                            <c:forEach items="${getposts.getList_userID_liked()}" var="lul">
                                                <c:if test="${lul == sessionScope.player.getId()}">
                                                    <c:set var="count" value="${count + 1}"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${count == 0}">
                                                    <div class="col">
                                                        <span style="color:red">♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${getposts.getLike()}" /></span> lượt thích

                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col">
                                                        <span style="color:red">♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${getposts.getLike()}" /></span> Bạn đã thích bài này
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${sessionScope.player == null}">
                                            <div class="col">
                                                <span style="color:red">♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${getposts.getLike()}" /></span> lượt thích
                                            </div>
                                        </c:if>

                                        <c:if test="${sessionScope.player != null}">
                                            <c:set var="count" value="${0}"></c:set>
                                            <c:forEach items="${getposts.getList_userID_liked()}" var="lul">
                                                <c:if test="${lul == sessionScope.player.getId()}">
                                                    <c:set var="count" value="${count + 1}"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${count == 0}">
                                                <div class="col text-right">
                                                    <a style="float:right;padding-right: 3px;" href="topics?action=like&&id=${getposts.getId()}">
                                                        <img src="app/view/images/button/heart.png" alt=""/>
                                                    </a>
                                                </div>
                                            </c:if>
                                        </c:if>

                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

            <div class="row mb-3">
                <div class="col">

                    <c:forEach items="${listComment}" var="lc" varStatus="stt">
                        <table cellpadding="0" cellspacing="0" width="99%" style="font-size: 13px;" class="mb-3">
                            <tbody>
                                <tr>
                                    <td width="60px;" style="vertical-align: top">
                                        <c:forEach items="${listplayer}" var="lpl">
                                            <c:if test="${lpl.getId() == lc.getUser_id()}">
                                                <div class="text-center" style="margin-left: -10px;">
                                                    <img src="app/view/images/avatar/${lpl.getAvatar()}.png" style="width: 30px; "></br>
                                                    <c:if test="${lpl.getAdmin() == 1}">
                                                        <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #FF4444">
                                                            ${lpl.getDisplayname()}
                                                        </div>
                                                        <div style="font-size: 7px; font-weight: bold; color: #FF4444">
                                                            Admin
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${lpl.getAdmin() == 2}">
                                                        <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #008000">
                                                            ${lpl.getDisplayname()}
                                                        </div>
                                                        <div style="font-size: 7px; font-weight: bold; color: #008000">
                                                            SMod
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${lpl.getAdmin() == 3}">
                                                        <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #9932CC">
                                                            ${lpl.getUsername()}
                                                        </div>
                                                        <div style="font-size: 7px; font-weight: bold; color: #9932CC">
                                                            Mod
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${lpl.getAdmin() == 0}">
                                                        <div style="font-size: 7px; font-weight: bold; padding-top: 5px; color: #013481">
                                                            ${lpl.getUsername()}
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </td>

                                    <td class="bg bg-light" style="border-radius: 7px;">
                                        <div class="row" style="font-size: 9px; padding: 5px 7px;">
                                            <div class="col">
                                                <c:forEach items="${listplayer}" var="lpl">
                                                    <c:if test="${lpl.getId() == lc.getUser_id()}">
                                                        <img src="app/view/images/status/${lpl.getOnline() == 0 ? "offline":"online"}.png" alt=""/>
                                                    </c:if>
                                                </c:forEach>
                                                <span><i>${lc.getThoigian()}</i></span>
                                            </div>
                                            <div class="col text-right">
                                                <c:if test="${sessionScope.player.getAdmin() == 1}">
                                                    <span><a href=""><i>[EDIT]</i></a></span>
                                                    <span><a href="topics?action=del&&id=${lc.getId()}"><i>[DEL]</i></a></span>
                                                </c:if>
                                                <c:forEach items="${listplayer}" var="lpl">
                                                    <c:if test="${lpl.getId() == lc.getUser_id()}">
                                                        <i>Điểm: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lpl.getPosts()}" /></i>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <style type="text/css">
                                            .item{
                                                transition: .5s ease-in-out;
                                            }
                                            .item:hover{
                                                filter: brightness(80%);
                                            }
                                        </style>
                                        <div class="row" style="padding: 0 7px 15px 7px">
                                            <div class="col">
                                                <span><p>${lc.getContent()}</p></span>
                                                <!-- <div class="text-center">
                                                    <img src="http://ngocrongonline.com/images/banner_2.png" >
                                                </div> /-->

                                                <c:if test="${lc.getLinkImg() != null}">
                                                    <div class="text-center">
                                                        <div class="item col-sm-6 col-md-4 mb-3">
                                                            <a href="${lc.getLinkImg()}" class="fancybox" data-fancybox="gallery">
                                                                <img src="${lc.getLinkImg()}" width="100%" height="100%">
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>

                                        </div>
                                        <div class="row" style="font-size: 10px; padding: 5px 7px;">
                                            <c:if test="${sessionScope.player != null}">
                                                <c:set var="count" value="${0}"></c:set>
                                                <c:forEach items="${lc.getList_userID_liked()}" var="lul">
                                                    <c:if test="${lul == sessionScope.player.getId()}">
                                                        <c:set var="count" value="${count + 1}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${count == 0}">
                                                        <div class="col">
                                                            <span style="color:red">♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lc.getLike()}" /></span> lượt thích

                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="col">
                                                            <span style="color:red">♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lc.getLike()}" /></span> Bạn đã thích bình luận này
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                            <c:if test="${sessionScope.player == null}">
                                                <div class="col">
                                                    <span style="color:red">♥ <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${lc.getLike()}" /></span> lượt thích
                                                </div>
                                            </c:if>

                                            <c:if test="${sessionScope.player != null}">
                                                <c:set var="count" value="${0}"></c:set>
                                                <c:forEach items="${lc.getList_userID_liked()}" var="lul">
                                                    <c:if test="${lul == sessionScope.player.getId()}">
                                                        <c:set var="count" value="${count + 1}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${count == 0}">
                                                    <div class="col text-right">
                                                        <a style="float:right;padding-right: 3px;" href="topics?action=like&&id=${lc.getId()}">
                                                            <img src="app/view/images/button/heart.png" alt=""/>
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </c:if>

                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:forEach>

                </div>
            </div>

            <div class="row">
                <div class="col text-right">
                    <a href="/topic/27052/1" class="btn btn-sm btn-light page-active"> 1 </a>
                    <a href="/topic/27052/2" class="btn btn-sm btn-light">2</a>
                    <a href="/topic/27052/3" class="btn btn-sm btn-light">3</a>
                    <a href="/topic/27052/2" class="btn btn-sm btn-light">></a>
                </div>
            </div>
            <c:if test="${getposts.getLock() == 0}">
                <c:if test="${sessionScope.player != null}">
                    <div class="row mt-3">
                        <div class="col">
                            <table cellpadding="0" cellspacing="0" width="99%" style="font-size: 13px;">
                                <tbody>
                                    <tr>
                                        <td width="55px;" style="vertical-align: top">
                                            <div class="text-left" style="display: block;">
                                                <c:forEach items="${listplayer}" var="lpl">
                                                    <c:if test="${lpl.getId() == sessionScope.player.getId()}">
                                                        <img src="app/view/images/avatar/${lpl.getAvatar()}.png" style="width: 30px; "></br>
                                                        <div style="font-size: 9px; padding-top: 5px"></div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td style=" border-radius: 7px">
                                            <div class="row">
                                                <div class="col">
                                                    <form id="form" action="topic" method="post">
                                                        <input type="hidden" id="topicID" name="topicID" value="${getposts.getId()}">
                                                        <input type="hidden" id="userID" name="userID" value="${sessionScope.player.getId()}">
                                                        <input type="hidden" id="timeCmt" name="timeCmt" value="">
                                                        <div class="form-group">
                                                            <textarea class="form-control" name="content" id="content" aria-label="With textarea" placeholder="Từ 4 tới 256 kí tự" required=""></textarea>
                                                            <span id="notify" class="text-danger"></span>
                                                        </div>
                                                        <button class="btn btn-light btn-sm" type="submit">Bình luận</button>
                                                        <a href="new-comment?id=${getposts.getId()}" class="btn btn-light btn-sm" type="submit">Gửi ảnh</a>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
            </c:if>




        </div>

        <%@include file="foot.jsp" %>

    </body>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript">
        function thoigian(time) {

            let minute = Math.round((Date.now() - time) / 60000);

            if (minute < 1) {
                minute = 'Vài giây trước'
            }
            ;
            if (minute >= 1 && minute < 60) {
                minute += ' phút trước'
            }
            ;
            if (minute >= 60 && minute <= 1440) {
                minute = Math.round(minute / 60) + ' giờ trước'
            }
            ;
            if (minute > 1440 && minute < 43200) {
                minute = Math.round(minute / 60 / 24) + ' ngày trước'
            }
            ;
            if (minute > 43200 && minute < 518400) {
                minute = Math.round(minute / 60 / 24 / 30) + ' tháng trước'
            }
            ;
            if (minute > 518400) {
                minute = Math.round(minute / 60 / 24 / 30 / 12) + ' năm trước'
            }
            ;

            return minute;
        }

        document.getElementById("timeTitle").innerHTML = thoigian("${getposts.getTime()}");
        document.getElementById('timeCmt').value = Date.now();
    </script>

    <script src="https://nroblue.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
