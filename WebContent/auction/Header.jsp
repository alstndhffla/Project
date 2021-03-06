<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	/* position: relative; */
    width: 100%;
    margin: 0;
    text-align:center;
    background: white;
    position: fixed;
    z-index: 1;
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
	padding-top:200px; 
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
	}
	#contents h2{margin:55px 0 12px; font-size:30px;}
	#contents.fire h2:before{content:""; display:inline-block; width:60px; height:55px; background:url(../Images/hot.jpg) no-repeat; background-size:60px;}
	
	#contents [class*="main"] ul{overflow:hidden; margin:0; padding:0;}
	#contents [class*="main"] ul li{float:left; width:calc(100% / 4); list-style:none; box-sizing:border-box;}
	#contents [class*="main"] ul li:not(:last-child){padding-right:15px;}
	#contents [class*="main"] ul li .con{position:relative; width:100%; padding:198px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
	#contents [class*="main"] ul li .con strong{display:block; margin-bottom:10px; font-size:25px; font-weight:400;}
	#contents [class*="main"] ul li .con .imgs{overflow:hidden; position:absolute; top:0; left:0; height:180px;}
	#contents [class*="main"] ul li .con .imgs a{display:block; width:100%; height:100%;}
	#contents [class*="main"] ul li .con .imgs img{
		width:100%; height:100%;
		transition:all 0.3s ease; -webkit-transition:all 0.3s ease;
	}
	#contents [class*="main"] ul li .con .imgs a:hover img{transform:scale(1.15);}
	#contents [class*="main"] ul li .con a{color:#2f2f2f;}
	#contents [class*="main"] ul li .con span{display:block; margin-top:5px; font-size:14px;}

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
					<input type="button" id="btn" value="??????" onclick="search();" >	
					<a href="AuctionWriter.jsp" class="pro">????????????</a>
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
	                				<a href="/Project/MyPage/myPage.jsp" class="login_text_box"><%=id %>???</a>
	                				<a href="/Project/Login/logout.jsp">
				                    	????????????
				                    </a>
	                			<%
	                		}else{
	                			%>
	                				<a href="/Project/Login/login.jsp">
				                    	?????????
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
	                    	????????????
	                   	</a>
	                </div>
	                <%} %>	                
	                <div class="login_text_box">
	                    <a href="/Project/qboard/qboard_list.jsp">
	                    	????????????
	                    </a> 
	                </div>
	            </div>
            </div>
			</div>
            <div id="nav">
				<div id="menuwrapper">
					<a href="FoodPage.jsp">FOOD</a>
					<a href="ElectronicPage.jsp">ELECTRONIC</a>
					<a href="ClothesPage.jsp">CLOTHES</a>
				</div>
			</div>
		</div>