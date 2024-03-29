<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>choose</title>
</head>
<body>
<h3>&lt; c:choose &gt;</h3>
<form action="choose.jsp">
	<select name="sel">
		<option>-</option>
		<option ${param.sel=='a'? 'selected':'?' }>a</option>
		<option ${param.sel=='b'? 'selected':'?' }>b</option>
		<option ${param.sel=='c'? 'selected':'?' }>c</option>
		<option ${param.sel=='d'? 'selected':'?' }>d</option>
	</select>
	<input type="submit" value="선택" />
</form>
<hr />

<c:choose>
	<c:when test="${param.sel == 'a' }">a 옵션 선택</c:when>
	<c:when test="${param.sel == 'b' }">b 옵션 선택</c:when>
	<c:when test="${param.sel == 'c' }">a 옵션 선택</c:when>
	<c:when test="${param.sel == 'd' }">d 옵션 선택</c:when>
	<c:otherwise>
		옵션을 선택하지 않았습니다(옵션 선택은 필수입니다).
	</c:otherwise>
</c:choose>
</body>
</html>