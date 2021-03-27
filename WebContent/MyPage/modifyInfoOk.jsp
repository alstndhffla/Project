<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	memberDAO dao = new memberDAO();
	
	String check = request.getParameter("check");
	int mno = (int)session.getAttribute("UserNo");
	String name = null;
	String email = null;
	String address = null;
	String postCode = null;
	String road = null;
	String detail = null;
	String account = null;
	String bank = null;
	
	if(check.equals("name")){
		name = request.getParameter("newName");
		
		dao.modifyName(mno, name);
	}else if(check.equals("email")){
		email = request.getParameter("newEmail");
		
		dao.modifyEmail(mno, email);
	}else if(check.equals("address")){
		postCode = request.getParameter("postCode");
		road = request.getParameter("roadAddress");
		detail = request.getParameter("detailAddress");
		
		address = "(" + postCode + ") " + road;
		if(detail != null){
			address += " " + detail;	
		}
		
		dao.modifyAddress(mno, address);
	}else if(check.equals("account")){
		account = request.getParameter("newAccount");
		bank = request.getParameter("bank");
		account += " " + bank;
		
		dao.modifyAccunt(mno, account);
	}
	
	response.sendRedirect("myPage.jsp?name=modify");

%>