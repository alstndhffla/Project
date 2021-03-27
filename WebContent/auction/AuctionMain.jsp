
<%@page import="vo.AuctionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AuctionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<jsp:include page="/auction/Header.jsp" />
		<div id="contents" class="fire">
			<h2> 인기 상승 AUCTION LIST</h2>
			<div class="main" >
				<ul>
					<%
					AuctionDAO dao = new AuctionDAO();	
					ArrayList<AuctionVO> Alist = dao.getAData();
					int count = 1;
					for(AuctionVO vo : Alist){
						if(count <= 4){
					%>
					<li>
						<div class="con">
							<%
								String counttime3 = vo.getStarttime();
								String[] splitDay3 = counttime3.split(" ");
								String[] splittime3 = splitDay3[1].split(":");
							%>
							<strong><%=vo.getTitle() %></strong>
							<div class="imgs">
								<a href="auctionDetailPage.jsp?ano=<%=vo.getAno()%>"><img src="../upload/<%=vo.getImgpath()%>"></a>
							</div>
							<a href="#">판매자 : <%=vo.getId()%></a>
							<span>경매 참여자 : <%=vo.getBidder() %>명</span>
							<span>남은 시간 : <%=splitDay3[0] %>일 <%=splittime3[0] %>시<%=splittime3[1] %>분</span>
						</div>
					</li>
					<%
							count++;
						}
					}
					%>
				</ul>
			</div>
		</div>
		<div id="contents" >
		<h2> FOOD AUCTION BEST</h2>
			<div class="main_01">
				<ul>
				<%
				ArrayList<AuctionVO> Flist = dao.getFData();
				count = 1;
				for(AuctionVO vo : Flist){
					if(count <= 4){
				%>
					<li>
						<div class="con">
							<%
								String counttime3 = vo.getStarttime();
								String[] splitDay3 = counttime3.split(" ");
								String[] splittime3 = splitDay3[1].split(":");
							%>
							<strong><%=vo.getTitle() %></strong>
							<div class="imgs">
								<a href="auctionDetailPage.jsp?ano=<%=vo.getAno()%>"><img src="../upload/<%=vo.getImgpath()%>"></a>
							</div>
							<a href="#">판매자 : <%=vo.getId() %></a>
							<span>경매 참여자 : <%=vo.getBidder() %>명</span>
							<span>남은 시간 : <%=splitDay3[0] %>일 <%=splittime3[0] %>시<%=splittime3[1] %>분</span>
					</div>
				</li>
				<%
						count++;
					}
				}
				%>
				</ul>
			</div>
		</div>
		<div id="contents" >
		<h2> ELECTRONIC AUCTION BEST</h2>
			<div class="main_02">
				<ul>
				<%
				ArrayList<AuctionVO> Elist = dao.getEData();
				count = 1;
				for(AuctionVO vo : Elist){
					if(count <= 4){
				%>
					<li>
						<div class="con">
							<%
								String counttime3 = vo.getStarttime();
								String[] splitDay3 = counttime3.split(" ");
								String[] splittime3 = splitDay3[1].split(":");
							%>
							<strong><%=vo.getTitle() %></strong>
							<div class="imgs">
								<a href="auctionDetailPage.jsp?ano=<%=vo.getAno()%>"><img src="../upload/<%=vo.getImgpath()%>"></a>
							</div>
							<a href="#">판매자 : <%=vo.getId() %></a>
							<span>경매 참여자 : <%=vo.getBidder() %>명</span>
							<span>남은 시간 : <%=splitDay3[0] %>일 <%=splittime3[0] %>시<%=splittime3[1] %>분</span>
						</div>
					</li>
				<%
						count++;
					}
				}
				%>
				</ul>
			</div>
		</div>
		<div id="contents" >
		<h2> CLOTHES AUCTION BEST</h2>
			<div class="main_03">
				<ul>
				<%
				ArrayList<AuctionVO> Clist = dao.getCData();
				count = 1;
				for(AuctionVO vo : Clist){
					if(count <= 4){
				
				%>
				<li>
				
					<div class="con">
					<%
						String counttime3 = vo.getStarttime();
						String[] splitDay3 = counttime3.split(" ");
						String[] splittime3 = splitDay3[1].split(":");
					%>
						<strong><%=vo.getTitle() %></strong>
						<div class="imgs">
							<a href="auctionDetailPage.jsp?ano=<%=vo.getAno()%>"><img src="../upload/<%=vo.getImgpath()%>"></a>
						</div>
						<a href="#">판매자 : <%=vo.getId() %></a>
						<span>경매 참여자 : <%=vo.getBidder() %>명</span>
						<span>남은 시간 : <%=splitDay3[0] %>일 <%=splittime3[0] %>시<%=splittime3[1] %>분</span>
					</div>
				</li>
				<%
					count++;
					}
					
				}
				%>
				</ul>
			</div>
		</div>
		
		<div class="footer">
                <div class="company_info">
                    <a href="#"><p>광고</p></a>
                </div>
                <div class="company_info">
                    <a href="#"><p>비즈니스</p></a>
                </div>
                <div class="company_info">
                    <a href="#"><p>Auction 정보</p></a>
                </div>
                <div class="user_info">
                    <a href="#"><p>Auction.com 사용</p></a>
                </div>
                <div class="user_info">
                    <a href="#"><p>설정</p></a>
                </div>
                <div class="user_info">
                    <a href="#"><p>약관</p></a>
                </div>
                <div class="user_info">
                    <a href="#"><p>개인정보 취급방침</p></a>
                </div>
        </div>
</body>
</html>