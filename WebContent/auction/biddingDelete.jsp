<%@page import="dao.BiddingDAO"%>
<%@page import="vo.BiddingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int mno = Integer.parseInt(request.getParameter("mno"));
	int ano = Integer.parseInt(request.getParameter("ano"));
	if(mno < 1){
		%>
			<script>
				alert('로그인을 해주세요.');
				location.href="/Project/Login/login.jsp";
			</script>
		<%
	}else{
		BiddingVO biddingVO = new BiddingVO();
		
		biddingVO.setMno(mno);
		biddingVO.setAno(ano);
		
		BiddingDAO biddingDAO = new BiddingDAO();
		
		biddingDAO.deleteBid(ano, mno);
	}
	%>
	
 <script>
 
 	location.href="./auctionDetailPage.jsp?ano=<%=ano%>"
 </script>
</body>
</html>