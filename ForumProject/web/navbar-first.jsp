<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:choose>
    <c:when test="${sessionScope.player != null}">
        <div class="container pt-4 pb-1 color-main2">
            <div class="row mb-3">
                <div class="col text-center">
                    <a class="btn btn-sm btn-info" href="me"><span class="fas fa-user"></span> ${player.getUsername()}</a>
                    <a class="btn btn-sm btn-info" href="/change-password"><span class="fas fa-key"></span> Đổi mật khẩu</a>
                    <a class="btn btn-sm btn-info hhtop" href="logout"><span class="fas fa-sign-out-alt"></span> Thoát</a>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="container pt-4 pb-1 color-main2">
            <div class="row mb-3">
                <div class="col text-center">
                    <a class="btn btn-sm btn-info " href="login"><i class="fas fa-sign-in-alt"></i> ĐĂNG NHẬP</a>
                    <a class="btn btn-sm btn-info mr-2" href="register"><i class="fas fa-user-plus"></i> ĐĂNG KÝ</a>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
