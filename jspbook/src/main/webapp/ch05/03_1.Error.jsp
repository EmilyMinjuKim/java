<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error Page</title>
</head>
<body>
<center>
	<h2>요청 처리중 문제가 발생했습니다.</h2>
	<hr />
	<table>
		<tr bgcolor="pink" align="center">
			<td>관리자에게 문의하세요. <br>
			빠른 시일 내에 복구하겠습니다.
			<hr />
			<%= exception %>
			</td>
		</tr>
	</table>
</center>
</body>
</html>