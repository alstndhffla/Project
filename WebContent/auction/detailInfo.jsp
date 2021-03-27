<%@page import="dao.AuctionDAO"%>
<%@page import="vo.AuctionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
	.contents{
			text-align:left;			
			padding:10px;
		}
	</style>
		
	
    <%
		int mno = 0; 
		if(session.getAttribute("UserNo") != null){
			mno = Integer.parseInt(session.getAttribute("UserNo").toString());
		}
	%>
	
    <%
				AuctionVO auctionVO = new AuctionVO();
				AuctionDAO auctionDAO = new AuctionDAO();
				
				String ano = request.getParameter("ano");
				
				if(ano != null){
					auctionVO.setAno(Integer.parseInt(ano));// 사용자가 클릭한 값을 파라미터로ㅗ 받아와 넘긴다.
				}else{
					auctionVO.setAno(1);
				}
				
				auctionVO = auctionDAO.selectOne(auctionVO);
			%>
<div id="contents" class="contents">
	<h4><%=auctionVO.getContents()%></h4>
</div>