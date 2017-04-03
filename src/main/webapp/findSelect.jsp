<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

function findId(){
	
	open('findId.jsp', '_blank', 'width=500, height=300', true);
	self.close();
	
}


function findPw(){
	
	open('findPw.jsp', '_blank', 'width=500, height=300', true);
	self.close();
	
}


</script>

<body>

찾으실 것을 선택해주세요.<br>
<input type="button" value="ID 찾기" onclick="findId();"> &nbsp; <input type="button" value="PW 찾기" onclick="findPw();">


</body>
</html>