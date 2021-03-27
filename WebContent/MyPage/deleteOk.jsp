<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 

	memberDAO dao = new memberDAO();
	int mno = (int)session.getAttribute("UserNo");
	
	dao.deleteData(mno);
	
	session.removeAttribute("UserNo");
	session.removeAttribute("UserId");
	
	response.sendRedirect("../auction/AuctionMain.jsp");
	
%>