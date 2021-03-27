<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String id = request.getParameter("id");
	boolean flag = true;
	
	memberDAO dao = new memberDAO();
	if(id != null && !id.equals("")){
		flag = dao.isExistById(id);
	}
	
	out.print(flag);
	
	

%>