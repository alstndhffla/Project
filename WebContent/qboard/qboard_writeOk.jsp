<%@page import="vo.QBoardVO"%>
<%@page import="dao.QBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String qtitle = request.getParameter("qtitle");
	String qcontents = request.getParameter("qcontents");
	int mno = 0;
	
	QBoardDAO dao = new QBoardDAO();
	QBoardVO vo = new QBoardVO();
	
	vo.setQtitle(qtitle);
	vo.setQcontents(qcontents);
	if(session.getAttribute("UserNo") != null) {
		mno = Integer.parseInt(session.getAttribute("UserNo").toString());
	}
	vo.setMno(mno);
	
	
	dao.addData(vo);
	
	response.sendRedirect("qboard_list.jsp");

%>