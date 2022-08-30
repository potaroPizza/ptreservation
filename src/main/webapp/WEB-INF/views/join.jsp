<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Join</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/join.js'/>"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>
<div>
    <form method="post" name="joinFrm"
        action="<c:url value='/user/join'/>">
        NAME : <input type="text" name="name" id="name"/>
        <span class="error-msg"></span><br/>
        ID &nbsp : <input type="text" name="id" id="id"/>
        <input type="button" value="중복확인" id="chkIdDupBtn"/>
        <span class="error-msg"></span>
        <input type="hidden" name="isChkId" id="isChkId" value="N"/>
        <br/>
        PW : <input type="password" name="pw" id="pw"/>
        <span class="error-msg"></span><br/>
        PW Check : <input type="password" name="pwChk" id="pwChk"/>
        <input type="hidden" name="isChkPw" id="isChkPw" value="N"/>
        <span class="error-msg"></span><br/>
        hp : <input type="text" name="hp" id="hp"/>
        <span class="error-msg"></span><br/>
        계정구분 :
            <select name="usersCategoryCode">
                <option value="100">일반회원</option>
                <option value="200">트레이너</option>
            </select><br/><br/>
        <input type="submit" value="회원가입"/>
        <input type="button" value="취소" id="cancelBtn"/>
    </form>
</div>

</body>
</html>
