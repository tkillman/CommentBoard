<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
function check(){
	var form = document.authenform;
	var authNum = ${authNum};
	
	if(!form.authnum.value){
		alert('������ȣ�� �Է��ϼ���.');
		return false;
		
	}
	
	if(form.authnum.value!=authNum){
		alert('Ʋ�� ������ȣ�Դϴ�. ������ȣ�� �ٽ� �Է����ּ���');
		form.authnum.value=="";
		return false;
	}
	
	if(form.authnum.value==authNum){
		alert('�����Ϸ�');
		opener.document.userinput.mailCheck.value="�����Ϸ�";
		self.close();
	}
	
}

</script>

</head>
<body>

<h5>������ȣ 7�ڸ��� �Է��ϼ���</h5>

<div class="container">
<form method="post" name="authenform" onsubmit="return check();">
<input type="text" name="authnum"><br>
<input type="submit" class="btn btn-info" value="Submit">
</form>

</div>

</body>
</html>