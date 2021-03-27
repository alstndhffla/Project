<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#nav{
	padding-top:20px; 
	border-top:1px solid #cacaca;
	}
	
	#menuwrapper{
		/* border-top:1px solid #064D5F;
		border-bottom:1px solid #064D5F; */
		
    	text-align:center;
	}
	
	#menuwrapper a{
	position:relative; 
	display:inline-block; 
	height:50px; 
	line-height:50px;
	padding:0 20px; 
	text-decoration:none; 
	font-size:24px; 
	color:#000;
	
	}
	
	#menuwrapper a:after{
	content:""; 
	position:absolute; 
	bottom:0; left:50%; 
	width:0; height:3px; 
	background-color:#064D5F;
	transform:translate(-50%);
	transition:all 0.3s ease; -webkit-transition:all 0.3s ease;
	
	}
	
	#menuwrapper a:hover:after{
	width:100%;
	}


</style>

</head>
<body>
	<div id="body">
		 <div id="nav">
			<div id="menuwrapper">
				<a href="#">FOOD</a>
				<a href="#">ELECTRONIC</a>
				<a href="#">CLOTHES</a>
				<a href="#">FREE BOARD</a>
			</div>
		</div>
	</div>

</body>
</html>