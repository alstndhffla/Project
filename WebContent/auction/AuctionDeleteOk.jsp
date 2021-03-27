<%@page import="vo.AuctionVO"%>
<%@page import="dao.AuctionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuctionDelete.jsp</title>
</head>
<body>
	<%
		String no = request.getParameter("ano");
	
		if(no != null){
			int ano = Integer.parseInt(no);
			AuctionDAO dao = new AuctionDAO();
			AuctionVO vo = new AuctionVO();
			
			vo.setAno(ano);
			
			dao.deleteDate(vo);
			
			response.sendRedirect("/Project/MyPage/myPage.jsp");
			
		}else{
			response.sendRedirect("/Project/MyPage/myPage.jsp");
			
		}
	
	
	%>
</body>
</html>