<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:forward page="04page_control_end.jsp">
	<jsp:param name="tel" value="010-1111-2222"/>
</jsp:forward>
</body>
</html>