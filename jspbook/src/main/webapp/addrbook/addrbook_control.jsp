<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jspbook.addrbook.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ab" class="jspbook.addrbook.AddrBean" />
<jsp:useBean id="addrBook" class="jspbook.addrbook.AddrBook" />
<jsp:setProperty name="addrBook" class="jspbook.addrbook.AddrBook" property="*" />

<%
	//컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	//파라미터 요청 처리
	if(action.equals("list")){
		ArrayList<AddrBook> datas = ab.getDBList();
		request.setAttribute("datas", datas);	//서버 저장
		
		pageContext.forward("addrbook_list.jsp");
	} else if(action.equals("insert")){
		if(ab.insertDB(addrBook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{
			throw new Exception("DB 입력 오류");
		}
	} else if(action.equals("update")){
		if(ab.updateDB(addrBook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{
			throw new Exception("DB 입력 오류");
		}
	} else if(action.equals("delete")){
		if(ab.deleteDB(addrBook.getAb_id())){
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{
			throw new Exception("DB 입력 오류");
		}
	} else{
		out.println("<script>alert('action 파라미터를 확인해주세요.')</script>");
	}
%>