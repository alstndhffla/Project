
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
   
   /* ???????????? ?????????  css */
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
      
   /* ?????? ????????? css */      
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
   
   .bidding{ /* ?????? form?????? css */
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
			if(confirm('?????? ???????????? ?????????. \n ?????????????????????????')){
				$("#biddingVO").submit();
			}else{
				return false;
			}
		}else{
			if(maxPrice < price){
				alert('?????? ???????????? ???????????? ????????? ??? ????????????.');
				return false;
			}else{				
				$("#biddingVO").submit();
			}
		}
	}
	function biddingDelete(){
		if(confirm('?????????????????????????')){
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
   <!-- ?????? ?????????  -->
   <div id="container1" class="container">
      <div id="topbx">
         <div class="imgs">
         <%
            AuctionVO auctionVO = new AuctionVO();
            AuctionDAO auctionDAO = new AuctionDAO();
            
            String ano = request.getParameter("ano");
            
            if(ano != null){
               auctionVO.setAno(Integer.parseInt(ano));// ???????????? ????????? ?????? ?????????????????? ????????? ?????????.
            }else{
               auctionVO.setAno(1);
            }
            
            auctionVO = auctionDAO.selectOne(auctionVO);
         %>
            <img class="auctionImg" src="../upload/<%=auctionVO.getImgpath() %>" width="100%" alt="????????????" />
         </div>
         <div id="auctionDetail">
         
            <h1><%=auctionVO.getTitle() %></h1>
            <p>
               ?????? ?????? : <%=auctionVO.getStarttime() %><br/>
               ?????? ?????? : <%=auctionVO.getEndtime() %><br/>
               ?????? ????????? : <%=auctionVO.getMinprice() %><br/>
               ?????? ????????? : <span id="maxPrice"><%=auctionVO.getMaxprice() %></span><br/>
               ?????? ?????? : <%=auctionVO.getAmount() %><br/>
               
               <%
               BiddingVO biddingVO1 = new BiddingVO();
               BiddingDAO biddingDAO1 = new BiddingDAO();
               biddingVO1.setAno(Integer.parseInt(ano));
               int topprice = biddingDAO1.topprice(biddingVO1);
               %>
               ?????? ????????? : <%=topprice %>
               <form name="biddingVO" id="biddingVO" action="bidding.jsp" class="bidding" >
                  <input type="hidden" name="ano" id="ano" value="<%=auctionVO.getAno() %>" />
                  <input type="hidden" name="mno" id="mno" value="<%=mno %>" />
                  <input type="text" name="price" id="price" placeholder="???????????? ??????????????????." maxlength="8"/>
                  <!-- <input type="submit" value="??????" class="btn" /> -->
                  <input type="button" id="biddingButton" onclick="maxPrice(); return false;" value="??????" class="btn" />
               </form>
                  <!-- <input type="button" value="??????" class="btn" /> -->
               <form name="biddingVOdelete" id="biddingVOdelete" action="biddingDelete.jsp" class="bidding">
                  <input type="hidden" name="ano" id="ano" value="<%=auctionVO.getAno() %>" />
                  <input type="hidden" name="mno" id="mno" value="<%=mno %>" />
                  <!-- <input type="submit" value="????????????" class="btn ty2" /> -->
                  <input type="button" id="biddingCancel" onclick="biddingDelete(); return false;" value="????????????" class="btn ty2" />
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
            <h1>?????? ??????</h1>
            <p>
               ????????? : <%=countbidder %>??? <br /><!-- select count(distinct(mno)) as count from bidding where ano = 1; -->
               ??? ?????? ??? :  <%=countbid %>??? <br /><!-- select count as count from bidding where ano = 1; -->
               ?????????????????? ?????? ?????? : <%=splitDay[0] %>???  <%=splitTime[0] %>??? <%=splitTime[1] %>??? <%=splitTime[2] %>??? <br />               
               <br /><br />   
               
               
               <% 
                  List<BiddingVO> biddingList = biddingDAO.bidlist(biddingVO);
                  int biddingListCount = 1;
                  for(BiddingVO bidding : biddingList){
                     %>
                     <%=biddingListCount %>. <%=bidding.getId() %> <%=bidding.getPrice() %>??? <%=bidding.getTime().substring(0,19) %> <br/>
                     
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
      <h2>????????? ?????? ??????</h2>
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
               <a href="auctionDetailPage.jsp?ano=<%=auction.getAno()%>"><img src="../upload/<%=auction.getImgpath()%>" width="100%" alt="????????????" /></a>
               <p>                  
                  <%
                  String countTime2 = auction.getStarttime();
                  String[] splitDay2 = countTime2.split(" ");
                  String[] splitTime2 = splitDay2[1].split(":");
                  %>
                  <%=auction.getTitle() %> <br /> <br />
                  ?????? ?????? :    <br /> <%=splitDay2[0] %>???  <%=splitTime2[0] %>??? <%=splitTime2[1] %>??? <%-- <%=splitTime2[2] %>??? --%> <br/><br/>
                  ????????? : <%=auction.getBidder() %>???
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
         /* pname = "auctionDetailPage.jsp"; //???????????? ????????? ??? ???????????? ??????. ??? ?????? ?????? ?????? null????????? ????????? ?????? ?????????... */
         pname = "detailInfo.jsp";
      }else if(name.equals("qna")){
         pname = "../banswer/banswer.jsp";
      }else{
         pname = name+".jsp"; //??? ????????? ???????????? ??????????????? ??????. ????????? ?????? ??????.
      }
   %>
   <div id="container3" class="container">
   
      <div class ="navibar">
         <div class="menu_01">
            <a href="auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%>&name=detailInfo">?????? ?????? ??????</a> <!-- ????????? ????????? ????????? ?????? ?????? ????????? ?????????. -->
            <%-- auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%> --%>
            <!-- detailInfo.jsp ?????? ???????????? rer????????? ?????? ????????? ?????? ?????? ????????????? -->
         </div>
         <div class="menu_02">
            <a href="auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%>&name=qna">Q&A</a>
            
         </div>
         <div class="menu_03">
            <a href="auctionDetailPage.jsp?ano=<%=auctionVO.getAno()%>&name=cancelInfo">??????/?????? ??????</a>
         </div>
      </div>      
      
      <!-- ????????? ?????? ?????? ??????. ??? 3?????? -->
      <div class="auction_view">
         
         <!-- ????????? ?????? ?????? 2?????? ????????? ?????????, ????????? jsp????????? ????????? -->
         <p class="auction_view_content"><jsp:include page="<%=pname %>"></jsp:include></p>
         <%-- <p class="auction_view_content"><jsp:include page="detailInfo.jsp"></jsp:include></p> --%>
         
                  
      </div>               
   
   </div>
   
   
   
   
   <div class="footer">
        <div class="company_info">
            <a href="#"><p>??????</p></a>
        </div>
        <div class="company_info">
            <a href="#"><p>????????????</p></a>
        </div>
        <div class="company_info">
            <a href="#"><p>Auction ??????</p></a>
        </div>
        <div class="user_info">
            <a href="#"><p>Auction.com ??????</p><a>
        </div>
        <div class="user_info">
            <a href="#"><p>??????</p></a>
        </div>
        <div class="user_info">
            <a href="#"><p>??????</p></a>
        </div>
        <div class="user_info">
            <a href="#"><p>???????????? ????????????</p></a>
        </div>
    </div>
   
</body>
</html>