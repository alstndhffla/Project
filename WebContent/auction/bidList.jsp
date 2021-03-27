<%@page import="dao.AuctionDAO"%>
<%@page import="vo.BiddingVO"%>
<%@page import="vo.AuctionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BiddingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	// 페이징 처리
    	
    	// 현재 페이지(currentPage) 얻어오기 << 이정보는 브라우저가 가지고 있으니까
    	String cp = request.getParameter("cp");
     	int mno = Integer.parseInt(session.getAttribute("UserNo").toString());
    	int currentPage = 0;
    	
    	if(cp!=null){
    		currentPage = Integer.parseInt(cp);
    	}else {
    		currentPage = 1;
    	}
    
    	// 총 게시글 수  << DB에 있음
    	BiddingDAO dao = new BiddingDAO();
     	int totalCount = dao.getTotalBid(mno);
    	
//     	// 한 페이지당 레코드 수 : 10
     	int recordByPage = 10;
    	
//     	// 총 페이지 수
     	int totalPage = (totalCount%recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;

    	
//     	// 현재 페이지 - 레코드 시작 번호
    	int startNo = (currentPage-1)*recordByPage+1;
    	
//     	// 현재페이지 - 레코드 끝 번호
    	int endNo = currentPage*recordByPage;
    %>
    
    <style type="text/css">
	#contents{
		max-width:1400px;
    	margin:0 auto;
    	margin-top: 20px;
    }	
    	
    #contents [class*="main"] ul{overflow:hidden; margin:0; padding:0;}
	#contents [class*="main"] ul li{float:left; width:calc(100%); list-style:none; box-sizing:border-box;}
	#contents [class*="main"] ul li:not(:last-child){padding-right:15px;}
	#contents [class*="main"] ul li .con{position:relative; width:100%; height: 800px; padding:40px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] h4 {font-size: 30px; margin-bottom: 30px; margin-left: 20px;}
	
	div.item-table table th{
	padding: 8px 0 9px;
    border: 1px solid #ccc;
    color: #666;
    font-size: 20px;
    font-weight: normal;
    text-align: center;
    background: url(//pics.auction.co.kr/sell/basic/bg/bg_btn_box.gif) 0px 0px repeat-x rgb(245, 245, 245);
    font-weight: bold;
	}
	
	tr{
	text-align: center;
	}
	
	td{
	border: 1px solid #ccc;
	border-collapse: collapse;
	padding: 5px;
	}
	
	table{
	width: 100%;
	}
	
	.col1{
	width: 16%;
	}
	
	.col2 {
	width: 15%;
	}
	
	.col4{ 
	width: 10%;
	}
	
	.col3{
	width: 23%;
	}
	
	.col5 .col6{
	width: 18%;
	}
	
	.button{
	overflow: hidden;
	float: right;
	
	}
	
	.button1{
	width: 135px;
    height: 40px;
    margin-top: 45px;
    font: 14px / 16px "Malgun Gothic", "맑은 고딕", "Nanum Gothic", sans-serif !important;
    
	}
	
	.title-content{
	 display: inline-block;
	}
	
	#pagelist{
	text-align: center;
	height: 30px;
	}
	
	
</style>

<script>
	function cofirm(){
		if(confirm('구매하시겠습니까?')){
			alert('구매');
		}else{
			return false;
		}
	}
</script>
<form action="/Project/auction/AuctionWriter.jsp">
	<div id="contents" >
		<div class="main" >
			<ul>
				<li>
					<div class="con">
						<div class="title-content">
							<h4 class="title">
							입찰 건수 <%=totalCount %>건
							</h4>
						</div>						
						<div class="item-table">
							<table>
								<tread>
									<tr>
										<th class="col1">물품명</th>
										<th class="col2">현재 최고 입찰가</th>
										<th class="col3">나의 입찰가</th>
										<th class="col4">판매상태</th>
										<th class="col5">판매일</th>
										<th class="col6">종료일</th>
										<th class="col7">입찰여부</th>
									</tr>
								</tread>
								<%										
										ArrayList<BiddingVO> list = dao.myBiddingList(mno);
								
										for(BiddingVO biddingVO : list){ 
											AuctionVO vo = new AuctionVO();
											AuctionDAO auctionDAO = new AuctionDAO();
											vo.setAno(biddingVO.getAno());
											vo = auctionDAO.selectOne(vo);
											int topPrice = dao.topprice(biddingVO);
											
											boolean state = auctionDAO.finalCount(vo.getAno());
											int calPrice = topPrice - Integer.parseInt(biddingVO.getPrice());
											String finalBid = "";
											if(state){
												if(calPrice == 0){
													finalBid = "입찰";
												}else{
													finalBid = "꽝";	
												}
											}else{
												if((vo.getMaxprice() - Integer.parseInt(biddingVO.getPrice())) == 0){
													finalBid = "입찰";
												}else{
													finalBid = "";													
												}												
											}
								%>
									 <tr>
										<td class="col1"><a href="/Project/auction/auctionDetailPage.jsp?ano=<%=vo.getAno() %>"><%=vo.getTitle() %></a></td>
										<td class="col2"><%=topPrice %></td>
										<td class="col3"><%=biddingVO.getPrice() %></td>
										<td class="col4">
											<%if(vo.getStatus().equals("Y")){ %>
												취소
											<%}else{ 
												if((vo.getMaxprice() - Integer.parseInt(biddingVO.getPrice())) == 0 || state){
												%>
													종료
												<%
												}else{
												%>
													진행
												<%} 
												}
											%>
										</td>
										<td class="col5"><%=vo.getStarttime() %></td>
										<td class="col6"><%=vo.getEndtime() %></td>
										<% 
											/* boolean state = auctionDAO.finalCount(vo.getAno());
											int calPrice = topPrice - Integer.parseInt(biddingVO.getPrice());
											String finalBid = "";
											if(state){
												if(calPrice == 0){
													finalBid = "입찰";
												}else{
													finalBid = "꽝";	
												}
											}else{
												if((vo.getMaxprice() - Integer.parseInt(biddingVO.getPrice())) == 0){
													finalBid = "입찰";
												}else{
													finalBid = "";													
												}												
											} */
										%>
										<td class="col7">
											<%if(calPrice == 0){ %>
												<a href="#" onclick="cofirm(); return false;"><%=finalBid %></a>	
											<%
											}else{
											%>
												<%=finalBid %>
											<%	
											}
											 %>
										</td>
									</tr>
									<%
									}// list() end
									%>
									<tr>
										<td colspan="6" id="pagelist">
											<%
												for(int i=currentPage-3; i<=currentPage+3; i++){
													if(i<=0){
														continue; // 읽지못하도록?
													}else if(i>totalPage){
														break;
													}else{
														
											%>
											<a href="/Project/auction/AuctionList.jsp?cp=<%=i %>"><span id="page">[<%=i %>]</span></a>
											<%
														}//if end
													}// for end
											%>
										
										</td>
									</tr>
							</table>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>	

