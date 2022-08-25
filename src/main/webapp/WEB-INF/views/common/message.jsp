<%--
  Created by IntelliJ IDEA.
  User: jungjihyo
  Date: 2022-08-25
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>message</title>
</head>
<body>
<script type="text/javascript">
    alert("${msg}");
    location.href = "<c:url value='${url}'/>";
</script>
</body>
</html>
