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
<!-- 값을 인서트(요청해 받아오는)하는 jsp... 이 jsp를 이용해서 detailpage에 값 입력해줘야함.ㅁ  -->
 <%
	int mno = Integer.parseInt(request.getParameter("mno"));
	String price = request.getParameter("price");
	int ano = Integer.parseInt(request.getParameter("ano"));
	BiddingVO biddingVO = new BiddingVO();
	BiddingDAO biddingDAO = new BiddingDAO();
	biddingVO.setAno(ano);
	
	int topprice = biddingDAO.topprice(biddingVO);
	if(mno < 1){
		%>
			<script>
				alert('로그인을 해주세요.');
				location.href="/Project/Login/login.jsp";
			</script>
		<%
	}else{
		if(price.equals("")){
			%>
				<script>
					alert('가격을 입력해주세요.');
					location.href="/Project/auction/auctionDetailPage.jsp";
				</script>
			<%
		}else{
			int pricep = Integer.parseInt(price); 
			if(pricep > topprice ){
				
			
				/* BiddingVO biddingVO = new BiddingVO(); */
				
				biddingVO.setMno(mno);
				biddingVO.setPrice(price);
				biddingVO.setAno(ano);			
				
			 	
			 	biddingDAO.insertBid(biddingVO);
			}else{
				%>
				<script>
					alert('입력하신 가격이 현재 입찰가보다 낮습니다.');
					
				</script>
			<% 
			}
		}
	}
	
 %>
 
 
 <script>
 	location.href="./auctionDetailPage.jsp?ano=<%=ano%>"
 </script>
  
</body>
</html>