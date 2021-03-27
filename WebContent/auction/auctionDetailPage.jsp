
<%@page import="java.util.List"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.BiddingDAO"%>
<%@page import="vo.BiddingVO"%>
<%@page import="dao.AuctionDAO"%>
<%@page import="vo.AuctionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hammer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   $(document).ready(function() {
    $("#txt").keydown(function(key) {
        if (key.keyCode == 13) {
           search();
           }
       });
   });
    function search(){
        var search = $("#txt").val();
        location.href="/Project/auction/AuctionSearch.jsp?search=" + search;
     }
</script>
<style type="text/css">
   
   /* header css */
   body{
      margin:0;
      color:#2f2f2f;
   }
   p {
    color: #727272;
    font-size: 12px;
   }
   a {
    text-decoration: none;
   }
   a:hover {
    text-decoration: underline;
   }
   .layout{
      max-width:1400px;
      width:100%;
      margin:0 auto;   
   }

   #header {
   position:fixed; 
    width: 100%;
    margin: 0;
    text-align:center;
    background:white; z-index:1;
    border-radius: 4px;
   box-shadow: 0px 3px #f9f5f5;
   }
   #body {
    width: 100%;
    position: relative;
   }
   #logo_area {
    width: 200px;
    height: 170px;
    display: inline-block;
    vertical-align: middle;
    padding-right: 22px;
   }
   #logo_area h1{
   margin:0;
   }

   #search{
   position: relative;
    text-align:left;
   }
   #search .pro{
   display:inline-block; width:85px; height:36px; line-height:36px; margin-left:5px; padding:0 10px; background-color:#054c5e; text-align:center; text-decoration:none; color:#fff; box-sizing:border-box;
   border-radius:22px; -webkit-border-radius:22px;
   }
   #txt{
   border: 0px;
   width:450px;
    height: 50px;
    padding:0 55px 0 20px;
    background-color:#f3f3f3;
    font-size: 18px;
    font-weight:400;
    line-height: 24px;
    color: #000;
    outline: 0;
    box-sizing:border-box;
    border-radius:30px;
    -webkit-border-radius:30px;
    
   }
   
   #btn{
   overflow:hidden;
   border: 0px;
    width: 50px;
    height: 50px;
    font-size: 18px;
    position: absolute;
    top: 0;
    right:98px;
    bottom: 0;
    padding:0;
    background:url(../Images/search_ico.png) no-repeat center;
    text-indent:-2000px;
    color: #fff;
   }

   .class{
      float: left;
   }
   
   .logo_de{
   margin: 0;
   }
   
   .login_area{
   position:absolute; 
   top:62px; 
   right:160px; 
   display:inline-block; 
   height:42px; 
   line-height:42px; 
   text-align:right; 
   vertical-align:middle;
   }
   
   .login_area .login_text_box{
   display: inline-block; 
   margin-left:12px;
   }
   
   .login_area .login_text_box a{
   color:#2f2f2f;
   }
      
   /* #header{
      position: fixed; top: 0; left: 0; width: 100%; height:50px;
      background:white; z-index:1;
      
   } */
   
   /* 카테고리 네비바  css */
   #nav{
   padding-top:200px; 
   border-top:1px solid #cacaca;
   }
   
   #menuwrapper{
      /* border-top:1px solid #064D5F;
      border-bottom:1px solid #064D5F; */
      
       text-align:center;
   }
   
   #menuwrapper a{
   position:relative; 
   display:inline-block; 
   height:50px; 
   line-height:50px;
   padding:0 20px; 
   text-decoration:none; 
   font-size:24px; 
   color:#000;
   
   }
   
   #menuwrapper a:after{
   content:""; 
   position:absolute; 
   bottom:0; left:50%; 
   width:0; height:3px; 
   background-color:#064D5F;
   transform:translate(-50%);
   transition:all 0.3s ease; -webkit-transition:all 0.3s ease;
   
   }
   
   #menuwrapper a:hover:after{
   width:100%;
   }
   
   
   
      /* .logo{
         width: auto; height: auto; max-width: 150px; max-height: 150px;
         float: left; border-color:black;
         
      } */
      
   /* 본격 컨텐츠 css */      
   .btn{width:80px; height:35px; line-height:35px; background-color:#054c5e; border:0; text-align:center; vertical-align:middle; color:#fff;}
   .btn.ty2{background-color:#5f5f5f;}
   
   .container{width: 100%; max-width:1400px; margin:50px auto 0;}
   #container1{
      position: relative;
      
   }
      #topbx{overflow:hidden; position:relative; height:350px; padding-left:500px; border:1px solid #ccc; box-sizing:border-box;}
      #topbx .imgs{position:absolute; top:0; left:0; width:500px; height:100%;}
      #topbx .imgs img{display:block; width:100%; height:100%;}
      
      #auctionDetail{position:relative; float:left; width:calc(50% - 20px); height:100%; margin-left:20px; padding:35px 30px; box-sizing:border-box;}
      #auctionDetail:after{content:""; position:absolute; top:calc(50% - 40%); right:0; width:1px; height:80%; background:#ccc;}
      #auctionDetail h2{margin:0 0 12px; font-weight:400;}
      #auctionDetail p{margin:0 0 15px;}
      #auctionDetail input[type="text"]{
         width:195px;
         height:35px;
         padding:0 20px;
         border-width:1px;
         vertical-align:middle;
         box-sizing:border-box;
      }
      #bidding{float:left;  width:50%; height:100%; padding:35px 30px; box-sizing:border-box;}
      #bidding h2{margin:0 0 12px; font-weight:400;}
      #bidding p{margin:0;}
      
      .populbx{overflow:hidden; margin:0; padding:0;}
      .populbx li{float:left; width:calc(100% / 5); list-style:none; box-sizing:border-box;}
      .populbx li:not(:last-child){padding-right:15px;}
      .populbx li .popular{min-height:345px; border:1px solid #aaa;}
      .populbx li .popular a{
         overflow:hidden; display:block; height:180px;
      }
      .populbx li .popular a img{
         width:100%; height:100%;
         transition:all 0.3s ease; -webkit-transition:all 0.3s ease;
      }
      .populbx li .popular a:hover img{transform:scale(1.1);}
      .populbx li .popular p{margin:0; padding:18px; box-sizing:border-box;}
      
   
      .navibar{
         overflow:hidden; text-align: center;
      }
      .navibar [class*="menu_"]{float:left; width:calc(100% / 3); height:65px; line-height:65px; padding-right:10px; box-sizing:border-box;}
      .navibar .menu_03{padding-right:0;}
      .navibar [class*="menu_"] a{
         display:block; text-decoration:none; border:1px solid #054c5e; font-size:22px; color:#000; box-sizing:border-box;
         transition:all 0.3s ease; -webkit-transition:all 0.3s ease;
      }
      .navibar [class*="menu_"] a:hover{background-color:#054c5e; color:#fff;}
   
   .bidding{ /* 입찰 form태그 css */
      display: inline-block;
   }
   
   /* footer css */
   .footer {
       width: 100%;
       height: 60px;
       background-color: #Eeeeee;
       margin-top:100px;
       /* position:absolute; */
       bottom: 0;
   }
   
   .company_info {
    width: 80px;
    height: 50px;
    margin-top: 10px;
    display: inline-block;
    float: left;
    text-align: center;

   }
   .user_info {
    height: 50px;
    margin-top: 10px;
    margin-left: 15px;
    margin-right: 15px;
    display: inline-block;
    float: right;
    text-align: center;
   }
   /* #footer{
      clear:both;
      background: blue;
   }  */
   
   .auction_view{border: 1px solid #054c5e; height: 400px;}
   .auction_view_content{ padding-left: 20px;}
</style>
<script>
	function maxPrice(){
		var maxPrice = Number($("#maxPrice").text()); 
		var price = Number($("#price").val());
		if(maxPrice == price){
			if(confirm('즉시 낙찰하게 됩니다. \n 구입하시겠습니까?')){
				$("#biddingVO").submit();
			}else{
				return false;
			}
		}else{
			if(maxPrice < price){
				alert('즉시 구매가를 초과하여 구매할 수 없습니다.');
				return false;
			}else{				
				$("#biddingVO").submit();
			}
		}
	}
	function biddingDelete(){
		if(confirm('취소하시겠습니까?')){
			$("#biddingVOdelete").submit();
		}
	}
	$( document ).ready(function() {
		var biddingMax = Number($("#biddingMax").val());
		var maxPrice = Number($("#maxPrice").text());
	    if(biddingMax == maxPrice){
	    	$("biddingButton").hide();
	    }
	});
</script>
</head>
<body>   

   <%
      int mno = 0; 
      if(session.getAttribute("UserNo") != null){
         mno = Integer.parseInt(session.getAttribute("UserNo").toString());
      }
   %>
   
   <jsp:include page="/auction/Header.jsp" />
   <!-- 본격 컨텐츠  -->
   <div id="container1" class="container">
      <div id="topbx">
         <div class="imgs">
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
            <img class="auctionImg" src="../upload/<%=auctionVO.getImgpath() %>" width="100%" alt="경매사진" />
         </div>
         <div id="auctionDetail">
         
            <h1><%=auctionVO.getTitle() %></h1>
            <p>
               경매 시작 : <%=auctionVO.getStarttime() %><br/>
               경매 마감 : <%=auctionVO.getEndtime() %><br/>
               경매 시작가 : <%=auctionVO.getMinprice() %><br/>
               즉시 낙찰가 : <span id="maxPrice"><%=auctionVO.getMaxprice() %></span><br/>
               판매 수량 : <%=auctionVO.getAmount() %><br/>
               
               <%
               BiddingVO biddingVO1 = new BiddingVO();
               BiddingDAO biddingDAO1 = new BiddingDAO();
               biddingVO1.setAno(Integer.parseInt(ano));
               int topprice = biddingDAO1.topprice(biddingVO1);
               %>
               최고 입찰가 : <%=topprice %>
               <form name="biddingVO" id="biddingVO" action="bidding.jsp" class="bidding" >
                  <input type="hidden" name="ano" id="ano" value="<%=auctionVO.getAno() %>" />
                  <input type="hidden" name="mno" id="mno" value="<%=mno %>" />
                  <input type="text" name="price" id="price" placeholder="입찰가를 입력해주세요." maxlength="8"/>
                  <!-- <input type="submit" value="입찰" class="btn" /> -->
                  <input type="button" id="biddingButton" onclick="maxPrice(); return false;" value="입찰" class="btn" />
               </form>
                  <!-- <input type="button" value="입찰" class="btn" /> -->
               <form name="biddingVOdelete" id="biddingVOdelete" action="biddingDelete.jsp" class="bidding">
                  <input type="hidden" name="ano" id="ano" value="<%=auctionVO.getAno() %>" />
                  <input type="hidden" name="mno" id="mno" value="<%=mno %>" />
                  <!-- <input type="submit" value="입찰취소" class="btn ty2" /> -->
                  <input type="button" id="biddingCancel" onclick="biddingDelete(); return false;" value="입찰취소" class="btn ty2" />
               </form>
            </p>
         </div>
         <div id="bidding">
         <%
            BiddingVO biddingVO = new BiddingVO();
            BiddingDAO biddingDAO = new BiddingDAO();
            biddingVO.setAno(auctionVO.getAno());
            int countbidder = biddingDAO.countBidder(biddingVO);
            int countbid = biddingDAO.countBid(biddingVO);
            String counttime = biddingDAO.countTime(biddingVO);
            String[] splitDay = counttime.split(" ");
            String[] splitTime = splitDay[1].split(":");      
            
         %>
            <h1>입찰 기록</h1>
            <p>
               입찰자 : <%=countbidder %>명 <br /><!-- select count(distinct(mno)) as count from bidding where ano = 1; -->
               총 입찰 수 :  <%=countbid %>건 <br /><!-- select count as count from bidding where ano = 1; -->
               경매종료까지 남은 시간 : <%=splitDay[0] %>일  <%=splitTime[0] %>시 <%=splitTime[1] %>분 <%=splitTime[2] %>초 <br />               
               <br /><br />   
               
               
               <% 
                  List<BiddingVO> biddingList = biddingDAO.bidlist(biddingVO);
                  int biddingListCount = 1;
                  for(BiddingVO bidding : biddingList){
                     %>
                     <%=biddingListCount %>. <%=bidding.getId() %> <%=bidding.getPrice() %>원 <%=bidding.getTime().substring(0,19) %> <br/>
                     
                     <%
                     if(biddingListCount == 1){
                    	 %>
                    	 <input type="hidden" id="biddingMax" value="<%=bidding.getPrice() %>" />
                    	 <%
                     }
                     biddingListCount ++;
                  }
               %>   
            </p>
         </div>
      </div>
   </div>
   
   
   <div id="container2" class="container">
      <h2>실시간 인기 경매</h2>
      <ul class="populbx">
      <%
               
         List<AuctionVO> auctionList = biddingDAO.popularlist(auctionVO);
         /* for(int i =1; i<=5; i++){ */
         
         int count = 1;
         for(AuctionVO auction : auctionList){
            if(count <= 5){
               
               
      %>
         <li>
            <div class="popular">
               <a href="auctionDetailPage.jsp?ano=<%=auction.getAno()%>"><img src="../upload/<%=auction.getImgpath()%>" width="100%" alt="인기경매" /></a>
               <p>                  
                  <%
                  String countTime2 = auction.getStarttime();
                  String[] splitDay2 = countTime2.split(" ");
                  String[] splitTime2 = splitDay2[1].split(":");
                  %>
                  <%=auction.getTitle() %> <br /> <br />
                  남은 시간 :    <br /> <%=splitDay2[0] %>일  <%=splitTime2[0] %>시 <%=splitTime2[1] %>분 <%-- <%=splitTime2[2] %>초 --%> <br/><br/>
                  입찰자 : <%=auction.getBidder() %>명
               </p>
            </div>
         </li>
         <%
                  count ++;
               }
            }
         %>
      </ul>
   </div>
   
   
   <%
      String pname = "";
      
      String name = request.getParameter("name");
      
      if(name == null ){
         /* pname = "auctionDetailPage.jsp"; //기본으로 떠있는 걸 구성하는 화면. 맨 처음 키면 값이 null이라서 오류가 뜨기 때문에... */
         pname = "detailInfo.jsp";
      }else if(name.equals("qna")){
         pname = "../banswer/banswer.jsp";
      }else{
         pname = name+".jsp"; //각 섹션을 클릭하면 넘어가도록 설정. 페이지 변화 없이.
      }
   %>
   <div id="container3" class="container">
   
      <div class ="navibar">
         <div class="menu_01">
            <a href="auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%>&name=detailInfo">경매 상품 정보</a> <!-- 페이지 이동이 아니라 그냥 값이 보이게 해야함. -->
            <%-- auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%> --%>
            <!-- detailInfo.jsp 이거 입력하면 rer이라는 놈이 나온다 이거 어서 나온거지? -->
         </div>
         <div class="menu_02">
            <a href="auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%>&name=qna">Q&A</a>
            
         </div>
         <div class="menu_03">
            <a href="auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%>&name=cancelInfo">취소/환불 정보</a>
         </div>
      </div>      
      
      <!-- 네비바 안에 내용 변경. 위 3가지 -->
      <div class="auction_view">
         
         <!-- 네비바 출력 형식 2가지 위에는 자바문, 아래는 jsp그대로 따오기 -->
         <p class="auction_view_content"><jsp:include page="<%=pname %>"></jsp:include></p>
         <%-- <p class="auction_view_content"><jsp:include page="detailInfo.jsp"></jsp:include></p> --%>
         
                  
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
            <a href="#"><p>Auction.com 사용</p><a>
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