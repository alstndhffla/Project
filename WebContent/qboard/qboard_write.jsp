<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String UserId = "";
	int mno = 0;
	
	if(session.getAttribute("UserNo") != null){
		mno = Integer.parseInt(session.getAttribute("UserNo").toString());
		UserId = (String)session.getAttribute("UserId").toString();
	}else{
		%>
			<script>
				alert('로그인을 해주세요.');
				location.href="/Project/Login/login.jsp";
			</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	textarea {
		height : 350px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#write_btn").click(function() {
			if($("#qtitle").val() == "") {
				alert("제목을 입력하세요");
				$("#qtitle").focus();
				return;
			} else if($("#qcontents").val() == "") {
				alert("내용을 입력하세요");
				$("#qcontents").focus();
				return;
			} else {
				$("#writefrm").submit();
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
	     	
	     	location.href="/Project/auction/AuctionSearch.jsp?search=" + search;
	     }
</script>
</head>
<body>
	<jsp:include page="/auction/Header.jsp" />
	<form method="post" id="writefrm" action="qboard_writeOk.jsp">
		<table>
			<tr>
				<td>제목 : </td>
				<td><input type="text" maxlength="50" name="qtitle" id="qtitle" placeholder="제목" /></td>
			</tr>
			<tr>
				<td>작성자 : </td>
				<td><input type="text" name="writer" id="writer" disabled="disabled" value="<%=UserId %>" /></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="qcontents" placeholder="내용" id="qcontents" ></textarea></td>
			</tr>
		</table>
		<a href="qboard_list.jsp"><input type="button" value="목록" /></a></td>
		<input type="button" value="작성하기" id="write_btn" />
		<input type="hidden" name="mno" id="mno" value="<%=mno %>" />
	</form>
	
	<jsp:include page="../auction/footer.jsp"></jsp:include>
	
</body>
</html>