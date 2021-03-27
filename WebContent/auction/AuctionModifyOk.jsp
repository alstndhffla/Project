<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="vo.AuctionVO"%>
<%@page import="dao.AuctionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modifyOk.jsp -->

<%
String dir = "C:\\Users\\alstn\\Desktop\\Project\\Project\\WebContent\\upload";

MultipartRequest multi =new MultipartRequest(request, 
		   dir, //파일을 저장할 디렉토리
		   1024*1024*5, //최대 업로드 크기 5MB
		   "utf-8", //파일 전송 정보 인코딩 설정
		   new DefaultFileRenamePolicy());



try{
	// name값으로 넘김
			String category = multi.getParameter("category");
			String title = multi.getParameter("title");
			int minprice = Integer.parseInt(multi.getParameter("minprice"));
			int maxprice = Integer.parseInt(multi.getParameter("maxprice"));
			int amount = Integer.parseInt(multi.getParameter("amount"));
			String contents = multi.getParameter("contents");
			String startYear = multi.getParameter("startYear");
			String startMonth = multi.getParameter("startMonth");
			String startDay = multi.getParameter("startDay");
			String startTime = multi.getParameter("startTime"); 
			String startMinute = multi.getParameter("startMinute");
			String endYear = multi.getParameter("endYear");
			String endMonth = multi.getParameter("endMonth");
			String endDay = multi.getParameter("endDay");
			String endTime = multi.getParameter("endTime");
			String endMinute = multi.getParameter("endMinute");
			int mno = Integer.parseInt(multi.getParameter("mno"));
			int ano = Integer.parseInt(multi.getParameter("ano"));
			String oldPhoto = multi.getParameter("oldPhoto");
			
			AuctionDAO dao = new AuctionDAO();
			AuctionVO vo = new AuctionVO();
			vo.setCategory(category);
			vo.setTitle(title);
			vo.setMinprice(minprice);
			vo.setMaxprice(maxprice);
			vo.setAmount(amount);
			String start = startYear + "-" + startMonth + "-" + startDay +" " + startTime + ":" + startMinute;
			vo.setStarttime(start);
			String end = endYear + "-" + endMonth + "-" + endDay +" " + endTime + ":" + endMinute;
			vo.setEndtime(end);
			vo.setContents(contents);
			vo.setMno(mno);
			vo.setAno(ano);
		

		
			/* int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한 */

			
		    String fileName ="";// 중복처리된 이름
		    String originalName ="";// 중복 처리전 실제 원본 이름
		    long fileSize =0;// 파일 사이즈
		    String fileType ="";// 파일 타입
		     
		    /* multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy()); */
		    
		    Enumeration files = multi.getFileNames();

		    while(files.hasMoreElements()){
	            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	            String file = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
	            // 그에 해당하는 실재 파일 이름을 가져옴
	            originalName = multi.getOriginalFileName(file);
	            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	            fileName = multi.getFilesystemName(file);
	            // 파일 타입 정보를 가져옴
	            fileType = multi.getContentType(file);
	            // input file name에 해당하는 실재 파일을 가져옴
	            File file1 = multi.getFile(file);
	            // 그 파일 객체의 크기를 알아냄
	            fileSize = file.length();
	            
	            
	            if(originalName != null){
	            	vo.setImgpath(originalName);
	            }else{
	            	vo.setImgpath(oldPhoto);
	            }
	            
	         
	        }
		    
		    // 파일 insert
		    dao.updateData(vo);
		    
			}catch(Exception e){
				e.printStackTrace();
			}

%>
	<script>
		location.href="/Project/MyPage/myPage.jsp"
	</script>
