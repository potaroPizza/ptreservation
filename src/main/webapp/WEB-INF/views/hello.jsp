<%--
  Created by IntelliJ IDEA.
  User: jungjihyo
  Date: 2022-08-25
  Time: 오후 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Calendar c = Calendar.getInstance();
    int hour=c.get(Calendar.HOUR_OF_DAY);
    int minute=c.get(Calendar.MINUTE);
    int second=c.get(Calendar.SECOND);
%>
<html>
<head>
    <title>hello</title>
</head>
<body>
    <h1>hello!!</h1>
    <h1>현재시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.</h1>
</body>
</html>
