<%@page import="vo.AnswerVO"%>
<%@page import="dao.AnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- replyOk.jsp -->
<%
   String answer = request.getParameter("answer");
   String no = request.getParameter("ano");
   String userid = (String)session.getAttribute("UserId");
   int mno = (int)session.getAttribute("UserNo");
   
   // System.out.println(no);
   
   int qno = 0;
   
   if(no!=null) {
      int ano = Integer.parseInt(no);
      
      /* out.println("bno : " + bno);
      out.println("contents : " + contents);
      out.println("id : " + id); */
      
      AnswerDAO rdao = new AnswerDAO();
      AnswerVO vo = new AnswerVO();
      
      vo.setAnswer(answer);
      vo.setQno(qno);
      vo.setAno(ano);
      vo.setMno(mno);
      vo.setId(userid);
      
      rdao.insertReply(vo);
      
      
      response.sendRedirect("/Project/auction/auctionDetailPage.jsp?ano=" + ano + "&name=qna");
      
   } else {
      response.sendRedirect("/Project/auction/auctionDetailPage.jsp");
   }


%>