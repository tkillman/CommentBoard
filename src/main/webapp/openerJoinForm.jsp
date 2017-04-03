<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>

var win;


function openWin(){

	win=open('loginForm.jsp', '_blank', 'width=300, height=300', true);
	
}


</script>

</head>
<body>

    
    <form>
       
        <button onclick="openWin()">로그인 버튼 </button>
	
		
	</form>
	
</body>
</html>