<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="color.jspf"%>

<html>
<head>
<title>게시판</title>
<link href="source/style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="${bodyback_c}">
<center><b>글목록(전체 글:${count})</b>
<table width="700">
  <tr>
    <td align="right" bgcolor="${value_c}">
       <a href="writeForm.do">글쓰기</a>
    </td>
  </tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">

<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
    <tr height="30" bgcolor="${value_c}">
      <td align="center"  width="50"  >번 호</td>
      <td align="center"  width="250" >제   목</td>
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td>
      <td align="center"  width="50" >조 회</td>
      <td align="center"  width="100" >IP</td>   
    </tr>

   <c:forEach var="article" items="${articleList}">
   <tr height="30">
    <td align="center"  width="50" >
  <c:out value="${number}"/>
  <c:set var="number" value="${number - 1}"/>
</td>
    <td  width="250" >
  
  <c:if test="${article.re_level > 0}">
  <img src="images/level.gif" width="${5 * article.re_level}" height="16">
    <img src="images/re.gif">
  </c:if>
  
  <c:if test="${article.re_level == 0}">
    <img src="images/level.gif" width="${5 * article.re_level}" height="16">
  </c:if>
          
      <a href="content.do?num=${article.num}&pageNum=${pageNum}&searchValue=${searchValue}&selectName=${selectName}">
          ${article.subject}</a>
          <c:if test="${article.readcount >= 20}">
            <img src="images/hot.gif" border="0"  height="16">
  </c:if>
</td>
    <td align="center"  width="100">
       <a href="mailto:${article.email}">${article.writer}</a>
</td>
    <td align="center"  width="150">
    <fmt:formatDate value="${article.reg_date}" pattern="yyyy-MM-dd"/>
</td>
    <td align="center"  width="50">${article.readcount}</td>
    <td align="center" width="100" >${article.ip}</td>
  </tr>
  </c:forEach>
</table>
</c:if>


<c:if test="${count > 0}">
           
   <c:if test="${startPage >wantPageBlock}">
      
        <a href="list.do?pageNum=${startPage - wantPageBlock}">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      
       <a href="list.do?pageNum=${i}">
       
       <c:if test="${ i== pageNum}">
       <b>[${i}]</b>
       </c:if>
       <c:if test="${ i != pageNum}">
       [${i}]
       </c:if>
       
       </a>
   </c:forEach>

   <c:if test="${endPage < blockCount}">
      
        <a href="list.do?pageNum=${startPage + wantPageBlock}">[다음]</a>
        
   </c:if>
</td></tr>   
</c:if>

<form action="" method="get" onsubmit="alert('미구현')">
<select name="selectName">
<option value="subject">제목</option>
<option value="writer">작성자</option>
</select>
<input type="text" name="searchValue">
<input type="submit" value="제출">
</form>
</center>
</body>
</html>
