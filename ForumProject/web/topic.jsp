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

        <div class="container pt-2 pb-2" style="background-color: #17a2b8">
            <div class="row">
                <div class="col">
                    <a class="btn btn-light btn-sm" onclick="history.back()" style="padding: 1px 4px"><i class="fas fa-angle-left"></i> Quay lại</a>
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
                                                <div style="font-size: 9px; padding-top: 5px">
                                                    ${lpl.getUsername()}
                                                </div>
                                                <div style="font-size: 8px">Điểm: ${lpl.getPosts()}</div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </td>
                                <td class="bg bg-light" style=" border-radius: 7px">
                                    <div class="row" style="font-size: 9px; padding: 5px 7px;">
                                        <div class="col">
                                            <span id="timeTitle"></span>
                                        </div>
                                        <div class="col text-right">
                                            <span><a href=""><i>[EDIT]</i></a></span>
                                            <span><a href=""><i>[KHÓA]</i></a></span>
                                            <span><a href=""><i>[HOT]</i></a></span>
                                            <span><a href=""><i>[NEW]</i></a></span>
                                            <span>#0</span>
                                        </div>
                                    </div>

                                    <div class="row" style="padding: 0 7px 15px 7px">
                                        <div class="col">
                                            <span class="font-weight-bold">${getposts.getTitle()}</span></br>
                                            <span>${getposts.getContent()}</span>
                                        </div>
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
                                                    <div style="font-size: 9px; padding-top: 5px">
                                                        ${lpl.getUsername()}
                                                    </div>
                                                    <div style="font-size: 8px">Điểm: ${lpl.getPosts()}</div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </td>

                                    <td class="bg bg-light" style="border-radius: 7px;">
                                        <div class="row" style="font-size: 9px; padding: 5px 7px;">
                                            <div class="col">
                                                <span>${lc.getThoigian()}</span>
                                            </div>
                                            <div class="col text-right">
                                                <span>#${stt.getIndex()+1}</span>
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

                                                <div class="item col-sm-6 col-md-4 mb-3">
                                                    <a href="http://ngocrongonline.com/images/banner_2.png" class="fancybox" data-fancybox="gallery">
                                                        <img src="http://ngocrongonline.com/images/banner_2.png" width="100%" height="100%">
                                                    </a>
                                                </div>
                                                <div class="item col-sm-6 col-md-4 mb-3">
                                                    <a href="https://animehay.club/upload/poster/2451.png" class="fancybox" data-fancybox="gallery">
                                                        <img src="https://animehay.club/upload/poster/2451.png" width="50%" height="50%">
                                                    </a>
                                                </div>

                                            </div>
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
