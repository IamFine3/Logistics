<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
<title>
物流管理平台
</title>

</head>
<body bgcolor="#ffffff">
<!-- 默认跳转到首页 -->
<%
response.sendRedirect(request.getContextPath() + "/jsp/pageHome.jsp");
%>
</body>
</html>