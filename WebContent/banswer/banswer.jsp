<%@page import="vo.AuctionVO"%>
<%@page import="dao.BanswerDAO"%>
<%@page import="vo.QBoardVO"%>
<%@page import="vo.AnswerVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = (String)session.getAttribute("UserId");

	BanswerDAO adao = new BanswerDAO();

	String no = request.getParameter("ano");
	
	int ano = Integer.parseInt(no);
	
	AuctionVO vo = new AuctionVO();
	AnswerVO rvo = new AnswerVO();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <div class="auction_view"> -->
		<form action="/Project/banswer/banswerOk.jsp">
			<table>
				<%
					if(userNo==null) {
				%>
					<tr>
						<th>댓글은 로그인 이후 사용 가능합니다.</th>
					</tr>
				<%		
					} else {
				%>
				<tr>
					<th>질문 작성</th>
					<td>
						<input type="text" name="answer" id="" size="20" />
						<input type="hidden" name="ano" value="<%=ano %>" />
						<input type="submit" value="작성" />
						
					</td>
				</tr>
				<%
					}
				%>
				<%
					
					ArrayList<AnswerVO> list = adao.getAllReply();
					for(AnswerVO revo : list) {
						// System.out.println("answer : " + revo.getAno());
						// System.out.println("Auction : " + vo.getAno());
						if(revo.getAno() == ano){ 
				%>
					<tr> 
						<td colspan="2">
							<textarea disabled="disabled" /><%=revo.getAnswer() %></textarea>
							작성자 : <%=revo.getId() %>
							작성일 : <%=revo.getAdate() %>
						</td>
					</tr>
				<%
						}
					}
				%>
			</table>
		</form>
	<!-- </div> -->
</body>
</html>