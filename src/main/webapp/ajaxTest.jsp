<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

$(function(){
	
	var data = 23;
	
	$('#btn1').on('click',function(){
		
		
		$.ajax({
			
			type:"GET"
			,url:'test/ajax.do'
			,data:data
			,success(arg){
				
				console.log(arg.data)
			
			}
		})
		
	})
	
	
	
	
})


</script>


</head>
<body>

<input type="button" id="btn1">

<div id="result"></div>


</body>
</html>