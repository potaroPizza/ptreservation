<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PT 예약 서비스</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/index.js'/>"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>

<form name="loginFrm" method="post"
      action="<c:url value='/user/login'/>">
    <label for="id">ID &nbsp : </label>
    <input type="text" name="id" id="id"/>
        <input type="checkbox" name="rememberId" id="rememberId"/>
        ID 저장<br/>
    PW : <input type="password" name="pw"/><br/><br/>
    <input type="submit" value="로그인"/>
    <button onclick="location.href='<c:url value="/user/join"/>'"
            type="button">회원가입</button><br/>
    <button id="findInfo" type="button">아이디/비밀번호 찾기</button>
</form>
    <button onclick="location.href='<c:url value="/user/adminLogin"/>'">관리자 로그인</button>

<%--<p>
    DB연결 테스트 :
    <c:forEach var="vo" items="${list}" varStatus="status">
        ${vo.name}
        <c:if test="${!status.last}">, </c:if>
    </c:forEach>
</p>--%>

</body>
</html>
