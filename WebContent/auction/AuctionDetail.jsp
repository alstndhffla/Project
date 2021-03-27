<%@page import="vo.AuctionVO"%>
<%@page import="dao.AuctionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String no = request.getParameter("ano");
    	AuctionDAO dao = new AuctionDAO();
    	AuctionVO vo = new AuctionVO();
    	
    	if(no!=null){
    		int ano = Integer.parseInt(no);
    		
			vo = dao.getDate(ano);
    	}else{
    		response.sendRedirect("/Project/MyPage/myPage.jsp");	
    	
    	}
    %>
    
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
    
    // 이미지 불러오기 활용 jQuery
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
        
        // Delete 사용
        $(document).ready(function(){
    		$("#delConfirm").on('click', function(){
    			
    			var result = confirm("경매를 취소 하시겠습니까?");
    			
    			if(result){
    				//console.log('삭제수행');
    				
    				//삭제기능을 다시 작성할 필요없이 삭제기능이 있는 페이지로 데이터를 보내면 됨
    			location.href = "AuctionDeleteOk.jsp?ano=<%=vo.getAno()%>";
    			
    			}else{
    				
    			}
    			
    		});
    	});
        
        $(document).ready(function() {
            $("#txt").keydown(function(key) {
                if (key.keyCode == 13) {
                   search();
                }
            });
        });
        
        function search(){
           var search = $("#txt").val();
           location.href="AuctionSearch.jsp?search=" + search;
        }
      

    </script>
<style type="text/css">
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
	position: relative;
    width: 100%;
    margin: 0;
    text-align:center;
    background: white;
/*     position: fixed; */
/*     z-index: 1; */
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

	#nav{
	padding-top:30px; 
	border-top:1px solid #cacaca;
	}
	#menuwrapper{
		/* border-top:1px solid #064D5F;
		border-bottom:1px solid #064D5F; */
		
    	text-align:center;
	}
	#menuwrapper a{
	position:relative; display:inline-block; height:50px; line-height:50px; padding:0 20px; text-decoration:none; font-size:24px; color:#000;
	
	}
	#menuwrapper a:after{
	content:""; position:absolute; bottom:0; left:50%; width:0; height:3px; background-color:#064D5F;
	transform:translate(-50%);
	transition:all 0.3s ease; -webkit-transition:all 0.3s ease;
	}
	#menuwrapper a:hover:after{width:100%;}

	.class{
		float: left;
	}
	
	.logo_de{
	margin: 0;
	}
	
	.footer {
	    width: 100%;
	    height: 60px;
	    background-color: #Eeeeee;
	    margin-top:150px;
	}
	
	.login_area{position:absolute; top:62px; right:160px; display:inline-block; height:42px; line-height:42px; text-align:right; vertical-align:middle;}
	.login_area .login_text_box{display: inline-block; margin-left:12px;}
	.login_area .login_text_box a{color:#2f2f2f;}
	
	#contents{
		max-width:1400px;
    	margin:0 auto;
    	margin-top: 100px;
    }	
    	
    #contents [class*="main"] ul{overflow:hidden; margin:0; padding:0;}
	#contents [class*="main"] ul li{float:left; width:calc(100%); list-style:none; box-sizing:border-box;}
	#contents [class*="main"] ul li:not(:last-child){padding-right:15px;}
	#contents [class*="main"] ul li .con{position:relative; width:100%; height: 2227px; padding:40px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] ul li .con .con1{position:relative; width:100%; height: 230px; margin-top: 3px; padding:18px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box; }
	#contents [class*="main"] ul li .con .con2{position:relative; width:100%; height: 650px; margin-top: 3px; padding:30px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] ul li .con .con3{position:relative; width:100%; height: 505px; margin-top: 15px; padding:10px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] ul li .con .con4{position:relative; width:100%; height: 420px; margin-top: 3px; padding:30px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] ul li .con .con5{position:relative; width:400px; height: 280px; margin-top: 3px; padding:30px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] ul li .con .con6{position:relative; width:100%; height: 300px; margin-top: 3px; padding:18px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box; }
	#contents [class*="main"] ul li .con .imgs{position:relative; top:0; left:0; height:200px; float: left; padding-right: 25px;}
	#contents [class*="main"] h1 {margin: 0;}
	#contents [class*="main"] h2 {font-size: 30px; margin-bottom: -20px; margin-bottom: -5px;}
	#contents [class*="main"] h4 {font-size: 30px; margin-bottom: 10px;}
	#contents [class*="main"] p {font-size: 20px;}
	
	#txt1{
	width: 240px;
    height: 35px;
    padding:0 0 0 15px;
    font-size: 15px;
    font-weight:400;
    line-height: 24px;
    color: #000;
    outline: 0;
    box-sizing:border-box;
    border: 1px solid black;
    border-color: rgb(181, 181, 181);
    margin-top: 0;
    
	}
	
	#txt2{
	width: 150px;
    height: 30px;
    padding:0 15px 0 15px;
    font-size: 18px;
    font-weight:400;
    line-height: 24px;
    color: #000;
    outline: 0;
    box-sizing:border-box;
    border: 1px solid black;
    border-color: rgb(181, 181, 181);
    text-align: right;
    
	}
	
	#txt3{
	width: 85px;
    height: 30px;
    padding:0 15px 0 15px;
    font-size: 18px;
    font-weight:400;
    line-height: 24px;
    color: #000;
    outline: 0;
    box-sizing:border-box;
    border: 1px solid black;
    border-color: rgb(181, 181, 181);
    text-align: right;
    
	}
	
	#blah{
	width : 100%;
	height: 200px;
	position:relative;
	color: black; 
	border: 0px solid black;
	dispaly: inline;

	}
	
	#form1{
	display: inline-block;
	}
	
	.btnitem{
	width: 130px;
	height: 50px;
	position: relative;
	display: inline-block;
	font: 20px / 16px "Malgun Gothic", "맑은 고딕", "Nanum Gothic", sans-serif !important;
	
	}
	
	.btn-box{
	padding: 50px 0;
    text-align: center;
/*     background: url(//pics.auction.co.kr/sell/basic/bg/bg_btn_box.gif) 0px 0px repeat-x rgb(245, 245, 245); */
	}
	
	#text-contents{
	position: relative;
	}
	
	#img1{
	width: 200px;
    height: 200px;
	}
	
	#na{
	width: 130px;
    height: 40px;
	}
	
	#ct{
	padding-left: 10px;
    padding-top: 10px;
	}
	
</style>
</head>
<body>
	<div id="body">
		<div id="header" class="bar">
			<div id="logo_area">
				<h1 class="logo_de">
					<a href="AuctionMain.jsp" class="logo_hammer" style="display: block;">
					<img id="logo" src="../Images/hammer.PNG" alt="hammer" style="width: 180px;">
					</a>
				</h1>
			</div>
			<div id="search" class="search_area" style="display: inline-block; vertical-align: middle;">
				<input type="text" name="txt" id="txt" >
				<input type="button" id="btn" value="검색" onclick="search();" >
					<!-- <span><img src="../Images/sell.PNG"/></span> -->
					<a href="#" class="pro">상품등록</a>
				</div>
				<div class="login_area">
				<div class="layout">
	                <div class="login_text_box">
	                	<%
	                		String id = ""; 
	                		if(session.getAttribute("UserId") != null){
	                			id = String.valueOf(session.getAttribute("UserId"));	                			
	                		}
	                		
	                		if(!id.equals("")){
	                			%>
	                				<a href="/Project/MyPage/myPage.jsp" class="login_text_box"><%=id %>님</a>
	                				<a href="/Project/Login/logout.jsp">
				                    	로그아웃
				                    </a>
	                			<%
	                		}else{
	                			%>
	                				<a href="/Project/Login/login.jsp">
				                    	로그인
				                    </a>
	                			<%
	                		}
	                	%>
	                </div>
	                <%
	                	if(id.equals("")){
	                %>
	                <div class="login_text_box">
	                    <a href="/Project/Login/register.jsp"> 
	                    	회원가입
	                   	</a>
	                </div>
	                <%} %>	                
	                <div class="login_text_box">
	                    <a href="/Project/qboard/qboard_list.jsp">
	                    	고객센터
	                    </a> 
	                </div>
	            </div>
            </div>
			</div>
            <div id="nav">
				<div id="menuwrapper">
					<a href="#">FOOD</a>
					<a href="#">ELECTRONIC</a>
					<a href="#">CLOTHES</a>
				</div>
			</div>
		</div>
			<div id="contents" >
				<div class="main" >
					<ul>
						<li>
							<div class="con">
								<div class="con1">
									<div class="imgs">
									<h1><img src="../Images/작성.JPG" alt="" id="img1"/></h1>
									</div>
									<div id="text-contents" >
									<h4>상품등록</h4>
									<p>
									상품 등록 수량 제한은 없으며, <br />
									판매 기간은 모두 등록 부탁드리며, <br />
									이미지 등록은 1개로 제한됩니다. <br />
									</p>
									</div>
								</div>
								<form action="AuctionModifyOk.jsp" method="post" name="AuctionModifyOk" id="AuctionModifyOk" enctype="multipart/form-data">
									<input type="hidden" name="ano" id="ano" value="<%=vo.getAno() %>" />
									<input type="hidden" name="mno" id="mno" value="1" />
									<input type="hidden" name="oldPhoto" id="oldPhoto" value="<%=vo.getImgpath() %>" />
									<div class="con6">
									<h2>카테고리를 선택하세요</h2>
									<br />
										<select name="category" id="na" >
											<option value="-----">선택</option>
											<option value="F" <%if(vo.getCategory().equals("F")){%> selected="selected" <%} %> >FOOD</option>
											<option value="E" <%if(vo.getCategory().equals("E")){%> selected="selected" <%} %> >ELECTRONIC</option>
											<option value="C" <%if(vo.getCategory().equals("C")){%> selected="selected" <%} %> >CLOTHES</option>
										</select>
										<h2>상품명 </h2><br />
										<input type="text" name="title" id="txt1" placeholder="50글자 이내로 작성해주세요" value="<%=vo.getTitle() %>"/>
									</div>
									<div class="con2">
										<h2>가격 </h2><br />
										<div class="con3">
											<h3>경매 시작가</h3>
											<input type="text" name="minprice" id="txt2" value="<%=vo.getMinprice() %>" /> 원 <br />
											<h3>즉시 구매가</h3>
											<input type="text" name="maxprice" id="txt2"  value="<%=vo.getMaxprice() %>"/> 원 <br />
											<h3>판매 수량</h3>
											<input type="text" name="amount" id="txt3"  value="<%=vo.getAmount() %>"/> 개 <br />
											
											<h3>경매 시작시간</h3>
											<input type="text" name="startYear" id="txt3" value="<%=vo.getStarttime().substring(0,4) %>"/> 년 
											<input type="text" name="startMonth" id="txt3" value="<%=vo.getStarttime().substring(5,7) %>"/> 월 
											<input type="text" name="startDay" id="txt3" value="<%=vo.getStarttime().substring(8,10) %>"/> 일 
											<input type="text" name="startTime" id="txt3" value="<%=vo.getStarttime().substring(11,13) %>"/> 시 
											<input type="text" name="startMinute" id="txt3" value="<%=vo.getStarttime().substring(14,16) %>"/> 분 <br />
											<h3>경매 마감시간</h3>
											<input type="text" name="endYear" id="txt3" value="<%=vo.getEndtime().substring(0,4) %>" /> 년 
											<input type="text" name="endMonth" id="txt3" value="<%=vo.getEndtime().substring(5,7) %>" /> 월 
											<input type="text" name="endDay" id="txt3" value="<%=vo.getEndtime().substring(8,10) %>" /> 일 
											<input type="text" name="endTime" id="txt3" value="<%=vo.getEndtime().substring(11,13) %>"/> 시 
											<input type="text" name="endMinute" id="txt3" value="<%=vo.getEndtime().substring(14,16) %>"/> 분 <br />
										</div>
									</div>
									<div class="con4">
										<h2>상품 설명 </h2><br />
										<p>
											<textarea name="contents" id="ct" cols="163" rows="15" style="font-size: 15px"><%=vo.getContents() %></textarea>
										</p>
									</div>
									<div class="con4">
										<h2>사진 </h2><br />
										<div class="con5">
<!-- 										  <form id="form1" runat="server"> -->
										      <img name = "im" id="blah" src="/Project/upload/<%=vo.getImgpath() %>" alt="상품이미지" />
<!-- 										 </form> -->
										  <br />
										  <br />
										  <input type='file' name="imgpath" id="imgpath" />
										</div>
									</div>
									<div class="btn-box">
										<a href="/Project/MyPage/myPage.jsp"><input type="button" value="목록 보기" class="btnitem"/></a>
										<%-- <a href="AuctionModify.jsp?ano=<%=vo.getAno() %>"> <input type="button" value="물품 수정" class="btnitem"/></a>--%>
										<input type="submit" class="btnitem" value="물품수정" />
										<input type="button" value="물품 삭제" class="btnitem" id="delConfirm"/>
									</div>
								</form>
							</div>
						</li>
					</ul>
				</div>
		</div >
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
	</div>
</body>
</html>