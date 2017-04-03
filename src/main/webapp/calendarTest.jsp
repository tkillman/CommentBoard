<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 

GregorianCalendar calendar = new GregorianCalendar(2017,4,3);

int firstday=calendar.get(Calendar.DAY_OF_WEEK);

int todayDate = calendar.get(Calendar.DAY_OF_MONTH)+1;

System.out.println(todayDate);
//System.out.println(Calendar.DAY_OF_WEEK); // 7일

//System.out.println(firstday);


%>



</body>
</html>