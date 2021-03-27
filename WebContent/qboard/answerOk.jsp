<%@page import="dao.memberDAO"%>
<%@page import="vo.memberVO"%>
<%@page import="vo.AnswerVO"%>
<%@page import="dao.AnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- replyOk.jsp -->
<%
	String answer = request.getParameter("answer");
	String no = request.getParameter("qno");
	int ano = 0;
	String userid = (String)session.getAttribute("UserId");
	int mno = (int)session.getAttribute("UserNo");
	
	if(no!=null) {
		int qno = Integer.parseInt(no);
		
		/* out.println("bno : " + bno);
		out.println("contents : " + contents);
		out.println("id : " + id); */
		
		AnswerDAO rdao = new AnswerDAO();
		AnswerVO vo = new AnswerVO();
		memberVO mvo = new memberVO();
		memberDAO mdao = new memberDAO();
		
		/* mdao.getData(qno); */
		
		vo.setAnswer(answer);
		vo.setQno(qno);
		vo.setAno(ano);
		vo.setMno(mno);
		vo.setId(userid);
		
		rdao.insertReply(vo);
		
		
		response.sendRedirect("qboard_detail.jsp?qno=" + qno);
		
	} else {
		response.sendRedirect("qboard_list.jsp");
	}


%>