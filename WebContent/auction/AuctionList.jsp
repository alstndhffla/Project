<%@page import="dao.AuctionDAO"%>
<%@page import="vo.AuctionVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
       // 페이징 처리
       
       // 현재 페이지(currentPage) 얻어오기 << 이정보는 브라우저가 가지고 있으니까
       String cp = request.getParameter("cp");
        int mno = Integer.parseInt(session.getAttribute("UserNo").toString());
       int currentPage = 0;
       
       if(cp!=null){
          currentPage = Integer.parseInt(cp);
       }else {
          currentPage = 1;
       }
    
       // 총 게시글 수  << DB에 있음
       AuctionDAO dao = new AuctionDAO();
        int totalCount = dao.getTotalCount(mno);
       
//        // 한 페이지당 레코드 수 : 10
        int recordByPage = 10;
       
//        // 총 페이지 수
        int totalPage = (totalCount%recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;

       
//        // 현재 페이지 - 레코드 시작 번호
       int startNo = (currentPage-1)*recordByPage+1;
       
//        // 현재페이지 - 레코드 끝 번호
       int endNo = currentPage*recordByPage;
    %>

<style type="text/css">
   #contents{
      max-width:1400px;
       margin:0 auto;
       margin-top: 20px;
    }   
       
    #contents [class*="main"] ul{overflow:hidden; margin:0; padding:0;}
   #contents [class*="main"] ul li{float:left; width:calc(100%); list-style:none; box-sizing:border-box;}
   #contents [class*="main"] ul li:not(:last-child){padding-right:15px;}
   #contents [class*="main"] ul li .con{position:relative; width:100%; height: 800px; padding:40px 18px 18px 18px; border:1px solid #d6d6d6; box-sizing:border-box;}
   #contents [class*="main"] h4 {font-size: 30px; margin-bottom: 30px; margin-left: 20px;}
   
   div.item-table table th{
   padding: 8px 0 9px;
    border: 1px solid #ccc;
    color: #666;
    font-size: 20px;
    font-weight: normal;
    text-align: center;
    background: url(//pics.auction.co.kr/sell/basic/bg/bg_btn_box.gif) 0px 0px repeat-x rgb(245, 245, 245);
    font-weight: bold;
   }
   
   tr{
   text-align: center;
   }
   
   td{
   border: 1px solid #ccc;
   border-collapse: collapse;
   padding: 5px;
   }
   
   table{
   width: 100%;
   }
   
   .col1{
   width: 16%;
   }
   
   .col2 {
   width: 15%;
   }
   
   .col4{ 
   width: 10%;
   }
   
   .col3{
   width: 23%;
   }
   
   .col5 .col6{
   width: 18%;
   }
   
   .button{
   overflow: hidden;
    float: right; 
   
   }
   
   .button1{
   width: 135px;
    height: 40px;
    margin-top: 45px;
    font: 14px / 16px "Malgun Gothic", "맑은 고딕", "Nanum Gothic", sans-serif !important;
    
   }
   
   .title-content{
    display: inline-block;
   }
   
   #pagelist{
   text-align: center;
   height: 30px;
   }
   
   
</style>
<form action="/Project/auction/AuctionWriter.jsp">
   <div id="contents" >
      <div class="main" >
         <ul>
            <li>
               <div class="con">
                  <div class="title-content">
                     <h4 class="title">
                     등록 물품 <%=totalCount %>건
                     </h4>
                  </div>
                  <div class="button">
                     <ul>
                        <li>
                           <input type="submit" value="판매물품 등록하기" class="button1"/>
                        </a>
                        </li>
                     </ul>
                  </div>
                  <div class="item-table">
                     <table>
                        <tread>
                           <tr>
                              <th class="col1">물품명</th>
                              <th class="col2">시작 경매가</th>
                              <th class="col3">등록가격(즉시판매가)</th>
                              <th class="col4">판매상태</th>
                              <th class="col5">판매일</th>
                              <th class="col6">종료일</th>
                           </tr>
                        </tread>
                        <%
         
                              ArrayList<AuctionVO> list = dao.getAllData(startNo, endNo, mno);
                        
                              for(AuctionVO vo : list){
                        %>
                           <tr>
                              <td class="col1"><a href="/Project/auction/AuctionDetail.jsp?ano=<%=vo.getAno() %>"><%=vo.getTitle() %></a></td>
                              <td class="col2"><%=vo.getMinprice() %></td>
                              <td class="col3"><%=vo.getMaxprice() %></td>
                              <td class="col4"><%if(vo.getStatus().equals("Y")){ %>삭제<%} %><%else{ %>진행<%} %></td>
                              <td class="col5"><%=vo.getStarttime() %></td>
                              <td class="col6"><%=vo.getEndtime() %></td>
                           </tr>
                           <%
                           }// list() end
                           %>
                           <tr>
                              <td colspan="6" id="pagelist">
                                 <%
                                    for(int i=currentPage-5; i<=currentPage+5; i++){
                                       if(i<=0){
                                          continue; // 읽지못하도록?
                                       }else if(i>totalPage){
                                          break;
                                       }else{
                                          
                                 %>
                                 <a href="/Project/MyPage/myPage.jsp?cp=<%=i %>"><span id="page">[<%=i %>]</span></a>
                                 <%
                                          }//if end
                                       }// for end
                                 %>
                              
                              </td>
                           </tr>
                     </table>
                  </div>
               </div>
            </li>
         </ul>
      </div>
   </div>
</form>   