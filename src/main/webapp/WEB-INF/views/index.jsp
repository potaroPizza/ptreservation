<%--
  Created by IntelliJ IDEA.
  User: jungjihyo
  Date: 2022-08-25
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PT 예약 서비스</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>

<form action="<c:url value='/user/login'/>">
    ID &nbsp : <input type="text" name="id"/><br/>
    PW : <input type="password" name="pw"/><br/><br/>
    <input type="submit" value="로그인"/>
</form>
    <button onclick="location.href='<c:url value="/user/adminLogin"/>'">관리자 로그인</button>
    <button onclick="location.href='<c:url value="/user/join"/>'">회원가입</button>

<p>
    DB연결 테스트 :
    <c:forEach var="vo" items="${list}" varStatus="status">
        ${vo.name}
        <c:if test="${!status.last}">, </c:if>
    </c:forEach>
</p>

</body>
</html>
