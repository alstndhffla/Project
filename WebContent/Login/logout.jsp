<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("UserNo");
	session.removeAttribute("UserId");
	response.sendRedirect("/Project/auction/AuctionMain.jsp");
%>