<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mainview.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
        $(document).ready(function() {
            $("#text_box").keydown(function(key) {
                if (key.keyCode == 13) {
                	var search = $("#text_box").val();
                	console.log(search);
                	location.href="AuctionSearch.jsp?search=" + search;
                }
            });
        });      
 
    </script>
<style type="text/css">
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

.nav_bar {
    float: right;
    margin:5px 10px 0 0;
}

.nav_text_box {
    height: 30px;
    display: inline-block;
    position: relative;
    padding-left: 12px;

}
.nav_text_box a{
	font-size:15px;
	color:#2f2f2f;
}

.search_bar {

    width: 300px;
    height: 100px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    text-align: center;
}

.search_button {

    border: 1px solid #FFFFFF;
    font-size: 13px;
    font-weight: bold;
    padding: 10px 18px 10px 18px;
    background-color: #efefef;
    color: #727272;
    display: inline-block;    

}

.search_button:hover {

    color: black;
    border: 1px solid #999999;    

}

.footer {
    width: 100%;
    height: 60px;
    position: absolute;
    bottom: 0px;
    background-color: #Eeeeee;
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

#header {
    width: 100%;
    height: 70px;
}

#body {
    width: 100%;
    min-height: 100vh;
    position: relative;
}

#logo {

    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 120px; 
}

#text_box {
    width: 570px;
    height: 50px;
    border: 1px solid #DDDDDD;
    font-size: 17px;
    padding:0 50px 0 20px;
    display: block;
    margin-right: auto;
    margin-left: auto;
    margin-top: 20px;
    border-radius : 30px;
	background:url(../Images/search_ico.png) no-repeat right 15px center;
	box-sizing:border-box;
}

#text_box:hover {
    border-color: #999999;
}
.login_area{position:absolute; top:62px; right:160px; display:inline-block; height:42px; line-height:42px; text-align:right; vertical-align:middle;}
	.login_area .login_text_box{display: inline-block; margin-left:12px;}
	.login_area .login_text_box a{color:#2f2f2f;}

</style>
</head>
<body>
	<div id="header">
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
	                				<a href="/Project/MyPage/myPage.jsp" class="login_text_box"><%=id %>님 로그인 하셨습니다.</a>
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
        </div>
        <div id="body">
            <img id="logo" src="../Images/hammer.PNG">
            <input id="text_box" type="text">           
            <div class="search_bar">
                <a href="AuctionMain.jsp"><input class="search_button" type="submit" value=" '조'장이 '조를' '조'졌네"></a>
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
        </div>
</body>
</html>