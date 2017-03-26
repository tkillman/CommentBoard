<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="color.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="source/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="script.js"></script>

</head>
<body bgcolor="${bodyback_c}"> 
<center><b>글쓰기</b>
<br>

<form:form commandName="writeFormCommand" onsubmit="return writeSave()">

<form:hidden path="num" value="0"/>
<form:hidden path="ref" value="0"/>
<form:hidden path="re_step" value="0"/>
<form:hidden path="re_level" value="0"/>

<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="${bodyback_c}"
   align="center">
   <tr>
    <td align="right" colspan="2" bgcolor="${value_c}">
    <a href="list.do"> 글목록</a>
   </td>
   </tr>
   <tr>
    <td  width="70"  bgcolor="${value_c}" align="center">이 름</td>
    <td  width="330">
       <form:input path="writer" size="10" maxlength="10"/></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="${value_c}" align="center" >제 목</td>
    <td  width="330">
    
       <form:input size="40" maxlength="50" path="subject"/></td>
    

  </tr>
  <tr>
    <td  width="70"  bgcolor="${value_c}" align="center">Email</td>
    <td  width="330">
       <form:input path="email" size="40" maxlength="30"/></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="${value_c}" align="center" >내 용</td>
    <td  width="330" >
     <form:textarea path="content" rows="13" cols="40"/></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="${value_c}" align="center" >비밀번호</td>
    <td  width="330" >
     <form:password size="8" maxlength="12" path="passwd"/>
</td>
  </tr>
<tr>     
<td colspan=2 bgcolor="${value_c}" align="center">
  <input type="submit" value="글쓰기" > 
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='list.do'">
</td>
</tr>

</table>   



</form:form>     

</html>