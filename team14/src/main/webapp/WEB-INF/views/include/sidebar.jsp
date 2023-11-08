<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path4" value="${pageContext.request.contextPath }"/>

<nav style="margin-right: 0">
    <div class="sidebar">
        <div class="header" style="text-align: center; margin-bottom: 8px">승원스쿨</div>
        <ul>
            <li id="side_modify">
                <a href="${path4}/member/update.do?id=${sid }" >
                    개인정보 수정
                </a>
            </li>
            <li id="side_paymentList">
                <a href="${path4}/payment/paymentList.do">
                    결제내역
                </a>
            </li>
        </ul>
    </div>
</nav>