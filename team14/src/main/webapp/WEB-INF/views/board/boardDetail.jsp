<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 상세</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <%-- cleditor --%>
    <script type="text/javascript" src="${path}/resources/cleditor/jquery.cleditor.js"></script>
    <link rel="stylesheet" href="${path}/resources/cleditor/jquery.cleditor.css">

    <!-- datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="${path}/resources/css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <link rel="stylesheet" href="${path}/resources/css/hd.css">
    <link rel="stylesheet" href="${path}/resources/css/ft.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height: 110vh; background-image: url("../img/login.jpg");
            background-repeat: no-repeat; background-position: center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center;  color:#fff;
            padding-bottom: 1.3em; }

        .tb1 {
            width: 1200px;
            font-size: 17px;
            margin-bottom: 50px;
            border-collapse: collapse; /* 테이블 간격 없애기 */
        }

        .tb1 thead th {
            line-height: 32px;
            padding: 12px 15px; /
            /*border: 1px solid #f5f5f5; !*/
        box-sizing: border-box;
            background-color: #eeeeee; /* 배경색 조정 */
            font-size: 22px;
            font-weight: 600;
            border-radius: 10px;
        }

        .tb1 thead td {
            font-size: 16px;
            text-align: right;
            line-height: 40px;
            border-bottom: #7e7e7e 1px solid;

        }
        .tb1 thead td:nth-child(1) {
            width: 6%;
            text-align: center;
        }.tb1 thead td:nth-child(2) {
             text-align: left;
             width: 14%;
         }
        .tb1 thead td:nth-child(3) {
            font-weight: 600;
            width: 55%;
        }
        .tb1 thead td:nth-child(4) {
            width: 15%;
        }
        .tb1 thead td:nth-child(5) {
            width: 8%;

        }
        /*글 내용*/
        .tb1 tbody tr td {
            padding-left: 10px;
            padding-top: 40px;
            font-size: 18px;
            text-align: left;


        }
        .content > div {
            min-height: 400px;
            border-bottom: 1px solid #7e7e7e;
        }

        .tb2{
            width: 1200px;
        }

        .tb2 .item1 { width: 10%; }
        .tb2 .item2 { width: 68%;}
        .tb2 .item3 { width: 10%; }
        .tb2 .item4 { width: 12%;
        }
        .tb2 td {
            border-bottom: 1px solid #7e7e7e;
            vertical-align: middle;
            height: 60px;
        }

        .tb2 thead tr th{
            text-align: center;
        }
        .tb2 tbody tr td:first-child{
            text-align: center;
            font-weight: bold;

        }
        .tb2 tbody tr td:nth-child(2){
            word-break: break-word;

        }
        .tb2 tbody tr td:nth-child(3){
            text-align: center;
        }

        .inbtn, .delete_btn {
            display: inline-block;
            border-radius: 5px;
            width: 88px;
            line-height: 20px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s; /* 마우스 오버 효과 */
        }

        .inbtn {
            background-color: #bbd4ff;
            color: #fff;
            border: none;
        }

        .inbtn:hover, .delete_btn:hover {
            background-color: #555;
        }

        .frm {
            margin-top: 50px;
        }

        .btn_group {
            margin-top: 50px;
        }

        #ans_btn {

            border-radius: 5px;
            width: 80px; /* 버튼 크기  */
            padding: 7px 15px;
            text-align: center;
        }

        .tb3{
            width: 1200px;
            height: 140px;
            margin-bottom: 50px;
            background-color: #eeeeee;
            border-radius: 10px;
        }

        .tb3 th {
            line-height: 100px;

            text-align: center;
            vertical-align: middle;

        }
        .tb3 th:first-child{
            width: 15%;
            font-weight: bold;
            font-size: 18px;

        }
        .tb3 th:nth-child(2){
            width: 70%;
        }
        .tb3 th:last-child{
            width: 15%;

        }
        textarea {
            resize: none;
            padding: 10px;
            height: 80px;
            border: 1px solid #ccc;
            border-radius: 5px;
            vertical-align: middle;
        }
        #nologin_comment {
            width: 1200px;
            text-align: center;
            padding-top: 60px;
            position: absolute;
            font-weight: bold;
        }

        .item4 .button{
            padding-top: 0;
            padding-bottom: 0;
        }

        .hero {
            height: 250px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <section class="hero is-whtie is-medium">
        <div class="hero-body has-text-centered">
            <p class="title is-size-3">
                자유게시판
            </p>
            <p class="subtitle is-size-5">
                상세
            </p>
        </div>
    </section>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
<%--                <h2 class="page_tit">게시글</h2>--%>
                <table class="tb1">

                    <thead>
                    <tr class="title">
                        <th colspan="5">${dto.title}</th>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${dto.author eq sid && not empty sid}">
                                <a href="${path}/board/edit.do?bno=${dto.bno}" class="button is-outlined is-link">수정</a>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty sid && (sid eq 'admin' || dto.author eq sid)}">
                                <a href="${path}/board/delete.do?bno=${dto.bno}" class="button is-outlined is-danger" >삭제</a>
                            </c:if>
                        </td>
                        <td>${dto.author}</td>
                        <td>${dto.resdate}</td>
                        <td>조회수 : ${dto.cnt}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="5" class="content">
                            <div style="display: block;">${dto.content}</div>
                                <script>
                                    function readableEdit(Bno) {
                                        let selected =  $("#contentSelect option:selected").val();
                                        //alert(selected);
                                        let params = {"Bno": parseInt(Bno), "selected" : selected};
                                        $.ajax({
                                            url:"${path }/board/readableEdit.do",
                                            type:"POST",
                                            data:params,
                                            success: function(result) {
                                                console.log(result);
                                            },
                                            error: function (request, status, error) {
                                                console.log("code: " + request.status)
                                                console.log("message: " + request.responseText)
                                                console.log("error: " + error);
                                            }
                                        });
                                    }

                                </script>

                                <script>
                                    // select 요소의 변경을 감지, content를 표시 또는 숨김
                                    const contentSelect = document.getElementById('contentSelect');
                                    const content = document.getElementById('content');

                                    contentSelect.addEventListener('change', function () {
                                        if (contentSelect.value === 'true') {
                                            content.style.display = 'block';
                                        } else if (contentSelect.value === 'false') {
                                            content.style.display = 'none';
                                        }
                                    });
                                </script>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
</body>

</html>