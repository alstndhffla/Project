<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String now = request.getParameter("nowPw");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/modifyPw.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#conf").click(function(){ // 확인 버튼
			
			// 확인버튼 누르면 빈칸 체크하고 비밀번호 변경
			if($("#now").val() == ""){
				alert("현재 비밀번호를 입력하세요");
				$("#now").focus();
				return;
			}else if($("#now").val() != "<%=now %>"){
				alert("현재 비밀번호가 맞지않습니다.");
				$("#now").focus();
				return;
			}else if($("#new").val() == ""){
				alert("새로운 비밀번호를 입력하세요");
				$("#new").focus();
				return;
			}else if($("#rnew").val() == ""){
				alert("새로운 비밀번호를 한번더 입력하세요");
				$("#rnew").focus();
				return;
			}else if($("#new").val() != $("#rnew").val()){
				alert("새로운 비밀번호가 맞지 않습니다.");
				$("#rnew").focus();
				return;
			}
		
			var result = confirm("변경하시겠습니까?");
			if(result){
				document.frm.submit();
			}
			
		});
		
		$("#del").click(function(){ // 취소 버튼
			location.href="myPage.jsp?name=modify";
		});
	});
</script>
</head>
<body>
	<!-- <div id="header">
		<a href="../Login/main.jsp"><img src="../image/logo.JPG" alt="logo" /></a>
		<span>정보 수정</span>
	</div> -->
	<form action="modifyPwOk.jsp" method="post" name="frm">
		<div id="container">
			<div class="title">
				<h1>비밀번호 변경</h1>
				<p>
					<span style="color: blue">안전한 비밀번호로 내 정보를 보호</span>하세요<br />
					<span style="color: red">다른 아이디/사이트에서 사용한 적 없는 비밀번호<br />
					이전에 사용한 적 없는 비밀번호</span>가 안전합니다.
				</p>
			</div>
			<div class="input">
				<div class="nowDiv">
					<input type="password" name="now" id="now"  maxlength="20" placeholder="현재 비밀번호"/>
				</div>
				<div class="newDiv">
					<input type="password" name="new" id="new" maxlength="20" placeholder="새 비밀번호"/><br />
					<input type="password" name="rnew" id="rnew" maxlength="20" placeholder="새 비밀번호 확인"/>
				</div>
			</div>
			<div class="confirm">
				<input type="button" value="확인" id="conf"/>
			</div>
			<div class="delete">
				<input type="button" value="취소" id="del"/>
			</div>
		</div>
	</form>
</body>
</html>