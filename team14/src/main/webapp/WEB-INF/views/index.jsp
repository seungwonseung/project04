<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<!--
// WEBSITE: https://themefisher.com
// TWITTER: https://twitter.com/themefisher
// FACEBOOK: https://www.facebook.com/themefisher
// GITHUB: https://github.com/themefisher/
-->
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <title>승원스쿨 메인 페이지</title>
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- theme meta -->
    <meta name="theme-name" content="kross-bulma"/>
    <!-- ** Plugins Needed for the Project ** -->
    <!-- bulma -->
    <link rel="stylesheet" href="${path}/resources/theme/plugins/bulma/bulma.min.css">
    <!-- slick slider -->
    <link rel="stylesheet" href="${path}/resources/theme/plugins/slick/slick.css">
    <!-- themefy-icon -->
    <link rel="stylesheet" href="${path}/resources/theme/plugins/themify-icons/themify-icons.css">
    <!-- Main Stylesheet -->
    <link href="${path}/resources/theme/css/style.css" rel="stylesheet">
    <!--Favicon-->
    <link rel="shortcut icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">


    <!-- 슬라이드 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>

    <style>
        .swiper {
            z-index: 2;
        }

        * {
            font-family: 'NanumSquare' !important;
        }

        .buttons {
            margin-bottom: 0;
        }

        .buttons .button {
            margin-bottom: 0;
        }

        .enter-button{
            margin-left: 870px;
            margin-top: 450px;
        }





        /*비디오*/
        .jb-text { position: absolute; top: 50%; width: 100%; }
        .jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #ffffff; }

        .navbar{
            position: fixed;
            /*background-color: grey;*/
            /*opacity: 0.5;*/
            background-color: rgba(255, 255, 255, 0.6) !important;
        }

        .footer-section{
            margin-top: 0px;
        }

        .button.is-link{
            background-color: transparent;
        }

    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<%--<jsp:include page="include/header.jsp"></jsp:include>--%>
<header id="header">
    <nav class="navbar is-dark is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="${path}/" >
                <img src="${path}/resources/img/logo782.png" width="112" height="28">
            </a>
        </div>
        <!-- header menu -->
        <div class="navbar-start">
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu1"
                   onmouseover="$(this).css({'background-color': '#CDEBFF', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>강의</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined"
                     onmouseover="$('#menu1').css({'background-color': '#CDEBFF', 'color': 'white'});"
                     onmouseout="$('#menu1').css({'background-color': '', 'color': ''});">
                    <a href="${path}/lecture/lecList" class="button is-link2 is-rounded b2">
                        강의 목록
                    </a>
                </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu2"
                   onmouseover="$(this).css({'background-color': '#CDEBFF', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>선생님</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined"
                     onmouseover="$('#menu2').css({'background-color': '#CDEBFF', 'color': 'white'});"
                     onmouseout="$('#menu2').css({'background-color': '', 'color': ''});">
                    <a href="${path}/instructor/instructorList" class="button is-link2 is-rounded b2">
                        선생님 목록
                    </a>
                </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu3"
                   onmouseover="$(this).css({'background-color': '#CDEBFF', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>커뮤니티</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined"
                     onmouseover="$('#menu3').css({'background-color': '#CDEBFF', 'color': 'white'});"
                     onmouseout="$('#menu3').css({'background-color': '', 'color': ''});">
                    <a href="${path}/board/list.do" class="navbar-item">
                        자유 게시판
                    </a>
                    <a href="${path}/file/filelist1.do" class="navbar-item">
                        자료실
                    </a>
                </div>
            </div>
        </div>
        <!-- header menu end -->
        <div class="navbar-end">
            <div class="navbar-item">
                <div style="padding-right: 10px">

                </div>
                <div class="buttons" style="margin-bottom: 0">
                    <c:if test="${not empty sid and sid ne ''}"> <%-- 회원으로 로그인한 경우 --%>
                        <a href="${path}/member/mypage.do" class="button is-link is-rounded b2"
                           style="margin-bottom: 0">
                            &nbsp;마이페이지
                        </a>
                        <a href="${path}/member/logout.do" class="button is-link2 is-rounded b2"
                           style="margin-bottom: 0">로그아웃
                                <%--                            로그아웃--%>
                        </a>
                    </c:if>
                    <c:if test="${empty sid}"> <%-- 로그인을 안 한 경우 --%>
                        <a href="${path}/member/login.do" class="button is-link2 is-rounded b2"
                           style="margin-bottom: 0">
                            로그인

                        </a>
                        <a href="${path}/member/join.do" class="button is-link is-rounded b2" style="margin-bottom: 0">
                            회원가입
                        </a>

                    </c:if>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link is-arrowless" id="menu4"
                       onmouseover="$(this).css({'background-color': '#CDEBFF', 'color': 'white'});"
                       onmouseout="$(this).css({'background-color': '', 'color': ''});">
                        <img src="${path}/resources/img/help_thin.svg" alt="" width="26px">
                        <%--                        <strong>고객센터</strong>--%>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>

<!-- hero area -->
<section class="hero-area has-background-primary" id="parallax" style="padding-top: 0;">
    <%--<div class="columns">
        <img src="${path }/resources/img/main_banner.png">
    </div>--%>

    <%--<div class="columns">
        <img src="${path }/resources/img/index_1.png">
    </div>--%>

        <div class="jb-box">
            <img src="${path}/resources/img/mainbanner.png" alt="배너">
            <div class="jb-text">
                <a href="${path}/lecture/lecList" class="button enter-button is-outlined is-link" style="float: inherit" style="margin-left: 580px"; ><strong>강의 목록 보러가기</strong></a>
            </div>
        </div>
</section>
<!-- footer -->

<jsp:include page="include/footer.jsp"></jsp:include>

<!-- /footer -->
<!-- jQuery -->
<script src="${path}/resources/theme/plugins/jQuery/jquery.min.js"></script>
<!-- slick slider -->
<script src="${path}/resources/theme/plugins/slick/slick.min.js"></script>
<!-- filter -->
<script src="${path}/resources/theme/plugins/shuffle/shuffle.min.js"></script>
<!-- Main Script -->
<script src="${path}/resources/theme/js/script.js"></script>

<!--End of Tawk.to Script-->
</body>
</html>