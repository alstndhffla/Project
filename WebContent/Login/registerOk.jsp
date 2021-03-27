<%@page import="vo.memberVO"%>
<%@page import="dao.memberDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 

	memberDAO dao = new memberDAO();
	memberVO vo = null;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String postCode = request.getParameter("postCode");
	String road = request.getParameter("roadAddress");
	String detail = request.getParameter("detailAddress");
	
	String address = "(" + postCode + ") " + road;
	if(detail != null){
		address += " " + detail;	
	}
	
	String account = request.getParameter("account") + " " + request.getParameter("bank");
	
	vo = new memberVO(id, pw, name, email, address, account);
	dao.addData(vo);
	
	boolean flag = dao.isExist(id, pw);
	int mno = -1;
	
	if(id != null && flag){	
		session.setAttribute("UserId", id);
		mno = dao.getMno(id);
		session.setAttribute("UserNo", mno);
		
		response.sendRedirect("/Project/auction/AuctionMain.jsp");
	}else{
		response.sendRedirect("register.jsp");
	}
	
	
	
%>
