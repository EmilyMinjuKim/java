<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addrbook_form</title>
<link rel="stylesheet" href="addrbook.css" />
</head>
<body>
<div align="center">
<h2>주소록 작성화면</h2>
<hr />
[&nbsp;<a href="addrbook_control.jsp?action=list" style="text-decoration: none">주소록 목록으로</a>&nbsp;]<p/>
<form name=form1 method=post action="addrbook_control.jsp">
	<input type="hidden" name="action" value="insert" />
	<table border="1">
		<tr>
		    <th>아이디</th>	
		    <td><input type="text" name="ab_id" ></td>
	  	</tr>
		<tr>
			<th>이 름</th>	
			<td><input type="text" name="ab_name" maxlength="15"></td>
		</tr>
		<tr>
			<th>email</th>
			<td><input type="email" name="ab_email" maxlength="50"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="ab_tel" maxlength="20"></td>
		</tr>
		<tr>
			<th>생 일</th>
			<td><input type="date" name="ab_birth"></td>
		</tr>  
		<tr>
			<th>회 사</th>
			<td><input type="text" name="ab_comdept" maxlength="20"></td>
		</tr>
		<tr>
			<th>메 모</th>
			<td><input type="text" name="ab_memo"></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
				<input type=submit value="저장">
				<input type=reset value="취소">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>