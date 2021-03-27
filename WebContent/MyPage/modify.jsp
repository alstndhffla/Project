<%@page import="vo.memberVO"%>
<%@page import="dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
	
	memberDAO dao = new memberDAO();
	
	int mno = (int)session.getAttribute("UserNo");
	memberVO vo = dao.getData(mno);
	
	
%>
<link rel="stylesheet" href="../css/modify.css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 비밀번호 수정
		$("#mpw").click(function(){ 
			$("#frm").attr('action', 'modifyPw.jsp');
			$("#frm").submit();
		});
		
		// 이름 수정
		$("#modifyName").click(function(){
			if($("#newName").val() == ""){
				alert("변경할 이름을 입력해주세요.");
				$("#newName").focus;
				return;
			}else if($("#newName").val() == "<%=vo.getName() %>"){
				alert("이름이 같습니다. 다른 이름을 입력해주세요.");
				$("#newName").focus;
				return;
			}
			
			var result = confirm("수정하시겠습니까?");
			
			if(result){
				$("#check").val("name");
				$("form").submit();
				$("#check").val("none");
			}
		});
		
		// 이메일 수정
		$("#modifyEmail").click(function(){
			if($("#newEmail").val() == ""){
				alert("변경할 이메일을 입력해주세요.");
				$("#newEmail").focus;
				return;
			}else if($("#newEmail").val() == "<%=vo.getEmail() %>"){
				alert("이메일이 같습니다. 다른 이메일을 입력해주세요.");
				$("#newEmail").focus;
				return;
			}
			
			var result = confirm("수정하시겠습니까?");
			
			if(result){
				$("#check").val("email");
				$("form").submit();
				$("#check").val("none");
			}
		});
		
		// 주소 수정
		$("#modifyAddress").click(function(){
			
			if($("#postCode").val() == "" || $("#roadAddress").val() == ""){ 
				alert("주소를 입력해주세요");
				$("#postCode").focus();
				return;
			}
			
			var address = "(" + $("#postCode").val() + ") " + $("#roadAddress").val();
			if($("#detailAddress").val() != ""){
				address += " " + $("#detailAddress").val();
			}
			
			if(address.trim() == "<%=vo.getAddress() %>".trim()) {
				alert("주소가 같습니다. 다른 주소를 입력해주세요.");
				return;
			}
			
			var result = confirm("수정하시겠습니까?");
			
			if(result){
				$("#check").val("address");
				$("form").submit();
				$("#check").val("none"); 
			}
		});
		
		// 계좌번호 수정
		$("#modifyAccount").click(function(){
			if($("#newAccount").val() == ""){
				alert("계좌번호를 입력해주세요.");
				return;
			}else if($("#bank").val() == "none"){
				alert("은행을 선택해주세요.");
				return;
			}
			
			var account = $("#newAccount").val() + " " + $("#bank").val();
			
			if(account.trim() == "<%=vo.getAccount() %>".trim()){
				alert("계좌번호가 같습니다. 다른 계좌번호를 입력해주세요.");
				return;
			}
			
			var result = confirm("수정하시겠습니까?");
			
			if(result){
				$("#check").val("account");
				$("form").submit();
				$("#check").val("none"); 
			}
			
		});
		
		// 회원 탈퇴
		$("#delete").click(function(){ 
			var result = confirm("정말 탈퇴하시겠습니까?");
			
			if(result){ // 확인버튼 누르면 탈퇴
				$("#frm").attr('action', 'deleteOk.jsp');
				$("#frm").submit();
			}
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
<div id="container">
	<form method="post" action="modifyInfoOk.jsp" id="frm">
		<input type="hidden" value="none" id="check" name="check" />
		<table>
			<tbody>
				<tr>
					<th scope="row">
						<div class="thcell"><span>사용자 아이디</span></div>
					</th>
					<td>
						<div class="tdcell">
							<p><%=vo.getId() %></p>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<div class="thcell"><span>사용자 비밀번호</span></div>
					</th>
					<td>
						<div class="modifyBtn">
							<input type="button" value="수정" id="mpw"/>
							<input type="hidden" name="nowPw" value="<%=vo.getPw()%>"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<div class="thcell"><span>사용자 이름</span></div>
					</th>
					<td>
						<div class="tdcell">
							<p><%=vo.getName() %></p>
						</div>
						<div class="modifyBtn">
							<input type="text" name="newName" id="newName" maxlength="20"/>
							<input type="button" value="수정" id="modifyName" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<div class="thcell"><span>연락처 이메일</span></div>
					</th>
					<td>
						<div class="tdcell">
							<p><%=vo.getEmail() %></p>
						</div>
						<div class="modifyBtn">
							<input type="text" name="newEmail" id="newEmail" />
							<input type="button" value="수정" id="modifyEmail" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<div class="thcell"><span>사용자 주소</span></div>
					</th>
					<td>
						<div class="tdcell">
							<p><%=vo.getAddress()%></p>
						</div>
						<div class="modifyBtn">
							<input type="text" name="postCode" id="postCode" placeholder="우편번호">
							<input type="button" onclick="daumPost()" value="우편번호 찾기"><br>
							<input type="text" name="roadAddress" id="roadAddress" size="43" placeholder="도로명주소">
							<input type="text" name="detailAddress" id="detailAddress" size="43" placeholder="상세주소">
							<input type="button" value="수정" id="modifyAddress"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<div class="thcell"><span>사용자 계좌</span></div>
					</th>
					<td>
						<div class="tdcell">
							<p><%=vo.getAccount() %></p>
						</div>
						<div class="modifyBtn">
							<input type="text" name="newAccount" id="newAccount" size="30"/>
							<select name="bank" id="bank">
								<option value="none">은행선택</option>
								<option value="국민">국민은행</option>
								<option value="신한">신한은행</option>
								<option value="농협">농협은행</option>
								<option value="하나">하나은행</option>
							</select>	
							<input type="button" value="수정" id="modifyAccount"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<div class="thcell"><span>사용자 가입날짜</span></div>
					</th>
					<td>
						<div class="tdcell">
							<p><%=vo.getRegdate() %></p>
						</div>
						<div class="modifyBtn">
							<input type="button" value="회원탈퇴" id="delete"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>