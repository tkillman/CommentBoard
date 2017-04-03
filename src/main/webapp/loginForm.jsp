<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<script type="text/javascript">

$(function(){
	
	$('#join').on('click',function(){
		openWin();
		self.close();
		
		
	})
	
})



function openWin(){

	open('joinForm.jsp', '_blank', 'width=500, height=300', true);
	
}



function find(){

	open('findSelect.jsp', '_blank', 'width=500, height=300', true);
	self.close();
}


</script>

<body>



<form>

아이디 : <input type="text"><br>
비밀번호: <input type="password"><br>
<input type="submit" value="Login"><input type="button" value="Find ID/PW" onclick="find();"><br>

<div id="join">아직 회원이 아니신가요? 회원 가입하세요.</div>
</form>



</body>
</html>