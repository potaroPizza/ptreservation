<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>아이디 중복검사 페이지</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/chkIdDup.js'/>"></script>
</head>
<body>
    <h2>아이디 중복검사</h2>
    <div>
        <div>
            <span>ID : </span>
            <input type="text" name="chkIdDup" id="chkIdDup" value="${id}"/>
            <button id="chkIdDupBtn">중복검사</button>
            <button id="useIdBtn" style="display: none">사용하기</button>
        </div>
        <div>
            <p class="error-msg"></p>
            <p id="result">아이디를 입력 후 중복검사 해주세요.<p/>
        </div>
    </div>
</body>
</html>
