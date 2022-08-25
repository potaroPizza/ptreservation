<%--
  Created by IntelliJ IDEA.
  User: jungjihyo
  Date: 2022-08-25
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>
  <a href="<c:url value='/pass/buy'/>">이용권 구매</a>
  <a href="<c:url value='/pt/reserve'/>">PT 예약</a>
  <a href="<c:url value='/locker/reserve'/>">사물함 예약</a>
  <a href="<c:url value='/user/mypage'/>">마이페이지</a>
  <a href="<c:url value='/charts'/>">통계</a>
</body>
</html>
