<%@page import="vo.QBoardVO"%>
<%@page import="dao.QBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String qtitle = request.getParameter("qtitle");
	String qcontents = request.getParameter("qcontents");
	String no = request.getParameter("qno");
	
	if(no!=null) {
		int qno = Integer.parseInt(no);
		
		QBoardDAO dao = new QBoardDAO();
		QBoardVO vo = new QBoardVO();
		vo.setQtitle(qtitle);
		vo.setQcontents(qcontents);
		vo.setQno(qno);
		
		dao.modifyData(vo); 
		
		response.sendRedirect("qboard_list.jsp");
	} else {
		response.sendRedirect("qboard_list.jsp");
	}
%>