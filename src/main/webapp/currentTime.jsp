<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>    
<%@ taglib prefix="fmt3" uri="http://java.sun.com/jstl/fmt_rt"%>    
<jsp:useBean id="today" class="java.util.Date"/>
<jsp:useBean id="sysdate" class="java.util.Date"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<fmt2:formatDate value="${today}" pattern="yyyy-mm-dd" var="today"/>
<fmt2:formatDate value="${sysdate}" pattern="HH" var="sysdate"/>


${today}<br>sadf
${sysdate}

</body>
</html>