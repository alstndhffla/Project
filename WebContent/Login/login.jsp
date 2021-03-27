<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" href="/Project/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			document.frm.submit(); 
		});
		$("#pw").keydown(function(key) {
	        if (key.keyCode == 13) {
	        		document.frm.submit();
		        }
		    });
	});
</script>
</head>
<body>
<%
	if(session.getAttribute("state") != null){
		%>
		<script>
			alert("아이디와 비밀번호를 확인해주세요.");			
		</script>
		<%
		session.removeAttribute("state");
	}
%>
	<form action="loginOk.jsp" name="frm" method="post">
		<div id="container">
			<div id="logoDiv">
				<a href="/Project/auction/AuctionMain.jsp"><img src="../Images/logo.jpg" alt="logo" /></a>
			</div>
			<div id="inputDiv">
				<input type="text" name="id" id="id" size="30" placeholder="ID"/>
				<input type="password" name="pw" id="pw" size="30"placeholder="PASSWORD" /><br />
				<a href="register.jsp" id="register">회원가입</a>
			</div>
			<div id="btnDiv">
				<input type="button" value="로그인" id="login"  />
			</div>
		</div>
	</form>

</body>
</html>