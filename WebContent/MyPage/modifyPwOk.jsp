<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String newPw = request.getParameter("new");
	int mno = (int)session.getAttribute("UserNo");
	
	memberDAO dao = new memberDAO();
	dao.modifyPw(mno, newPw);
	
	response.sendRedirect("myPage.jsp?name=modify");
%>