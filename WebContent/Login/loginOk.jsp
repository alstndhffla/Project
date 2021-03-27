<%@page import="dao.memberDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>		

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	memberDAO dao = new memberDAO();
	
	boolean flag = dao.isExist(id, pw);
	int mno = -1;
	
	if(id != null && flag){	
		session.setAttribute("UserId", id);
		mno = dao.getMno(id);
		session.setAttribute("UserNo", mno);
		
		response.sendRedirect("/Project/auction/AuctionMain.jsp");
	}else{
		session.setAttribute("state", "false");
		response.sendRedirect("login.jsp");
	}

%>