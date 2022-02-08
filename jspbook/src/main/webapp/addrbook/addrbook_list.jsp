<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jspbook.addrbook.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<script type="text/javascript">
	function check(ab_id){
		pwd = prompt('수정/삭제 하려면 비밀번호를 입력하세요.');
		document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
	};
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록 목록 보기</title>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
</head>
<body>
<div align="center">
	<h2>주소록:목록화면</h2>
	<hr />
	<form action="">
		<a href="addrbook_form.jsp">주소록 등록</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생일</th>
				<th>회사</th>
				<th>메모</th>
			</tr>
			<%
			for(AddrBook ab:(ArrayList<AddrBook>)datas){
			%>
			<tr>
				<td><a href="javascript:check(<%=ab.getAb_id() %>)"></a><%=ab.getAb_id() %></td>
				<td><%=ab.getAb_name() %></td>
				<td><%=ab.getAb_tel() %></td>
				<td><%=ab.getAb_birth() %></td>
				<td><%=ab.getAb_comdept() %></td>
				<td><%=ab.getAb_memo() %></td>
			</tr>
			<%
			}
			%>
		</table>
	</form>
</div>
</body>
</html>