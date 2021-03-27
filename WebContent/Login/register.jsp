<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/register2.css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#register").click(function(){
			
			// 유효성 검사
			if($("#id").val() == ""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return;
			}else if($("#check").val() == "false"){
				alert("아이디 중복검사 해주세요");
				$("#id").focus();
				return;
			}else if($("#pw").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pw").focus();
				return;
			}else if($("#rpw").val() != $("#pw").val()){
				alert("비밀번호가 같지 않습니다.");
				$("#rpw").focus();
				return;
			}else if($("#name").val() == ""){
				alert("이름을 입력해주세요");
				$("#name").focus();
				return;
			}else if($("#email").val() == ""){
				alert("이메일을 입력해주세요");
				$("#email").focus();
				return;
			}else if($("#postCode").val() == "" || $("#roadAddress").val() == ""){ 
				alert("주소를 입력해주세요");
				$("#postCode").focus();
				return;
			}else if($("#account").val() == ""){
				alert("계좌를 입력해주세요");
				$("#account").focus();
				return;
			}else if($("#bank").val() == "none"){
				alert("은행을 선택해주세요");
				return;
			}
			
			document.frm.submit();
			
		});
		
		$("#dup").click(function(){ // id 중복 검사
			console.log($("#id").val());
			$.ajax({
				type: 'POST',
				url: 'idCheck.jsp',
				data:{
					"id" : $("#id").val()
				},
				success: function(data){
					if($.trim(data) == 'false'){
						$("#check").val('true');
						$("#checkMsg").html('<p style="color:blue">사용 가능</p>');
					}else{
						$("#checkMsg").html('<p style="color:red">사용 불가능</p>');
					}
				}
			});
		});
		
		
	});
	function daumPost(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	document.getElementById("postCode").value = data.zonecode;
                document.getElementById("roadAddress").value = data.roadAddress;
	        }
	    }).open();
	}	
	
	
</script>
<title>register.jsp</title>
</head>
<body>
	<form action="registerOk.jsp" method="post" name="frm">
		<div id="container">
			<div class="dImg">
				<a href="/Project/auction/AuctionMain.jsp"><img alt="logo" src="../Images/logo.jpg"></a>
			</div>
			<div class="inputfrm">
				<label for="id"><b>아이디</b></label><br />
				<input type="text" name="id" id="id" maxlength="20" size="30" />
				<input type="button" value="중복확인" id="dup"/>
				<input type="hidden" id="check" value="false" />
				<div id="checkMsg"></div>
			</div>
			<div class="inputfrm">
				<label for="pw"><b>비밀번호</b></label><br />
				<input type="password" name="pw" id="pw" maxlength="20" size="45" />
			</div>
			<div class="inputfrm">
				<label for="rpw"><b>비밀번호 재확인</b></label><br />
				<input type="password" name="rpw" id="rpw" maxlength="20" size="45" />	
			</div>
			<div class="inputfrm">
				<label for="name"><b>이름</b></label><br />
				<input type="text" name="name" id="name" size="45"/>
			</div>
			<div class="inputfrm">
				<label for="email"><b>이메일</b></label><br />
				<input type="text" name="email" id="email" size="45"/>
			</div>
			<div class="inputfrm">
				<label for="address"><b>주소</b></label><br />
				<input type="text" name="postCode" id="postCode" size="29" placeholder="우편번호">
				<input type="button" onclick="daumPost()" value="우편번호 찾기" id="search"><br>
				<input type="text" name="roadAddress" id="roadAddress" size="45" placeholder="도로명주소">
				<input type="text" name="detailAddress" id="detailAddress" size="45" placeholder="상세주소">
			</div>
			<div class="inputfrm">
				<label for="account"><b>계좌 번호</b>(숫자만 입력)</label><br />
				<input type="text" name="account" id="account" size="30"/>
				<select name="bank" id="bank">
					<option value="none">은행선택</option>
					<option value="국민">국민은행</option>
					<option value="신한">신한은행</option>
					<option value="농협">농협은행</option>
					<option value="하나">하나은행</option>
				</select>	
			</div>
			<div class="inputfrm">
				<input type="button" value="가입" id="register" />
			</div>
		</div>
	</form>
</body>
</html>