<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>if_set</title>
</head>
<body>
<h3>&lt; c:if &gt;</h3>
<c:set value="admin" var="msg" />
msg : ${msg }<br>
<c:if test="${msg == 'admin' }" var="result">
	test result : ${result }
</c:if>
</body>
</html>