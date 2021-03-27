<%@page import="dao.QBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	QBoardDAO dao = new QBoardDAO();
	
	String no = request.getParameter("qno");
	
	int qno = Integer.parseInt(no);
	
	dao.deleteData(qno);
	 
	response.sendRedirect("qboard_list.jsp");
	

%>