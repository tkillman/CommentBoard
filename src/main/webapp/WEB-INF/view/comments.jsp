<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="com" items="${list}">
			<tr>
			<td colspan='2'>작성자 : ${com.commenter}</td>
			<td colspan='3' align="right"> 
			작성일 : <fmt:formatDate value="${com.reg_date}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr><td colspan='5'> 코멘트 내용 : ${com.commentt}</td></tr>
</c:forEach>


<c:if test="${commentCount > 0}">
<tr><td colspan="6" align="center">           
   <c:if test="${commentStartPage > commentPageBlock}">
        <%-- <a href="comment.do?commentPageNum=${commentStartPage - commentPageBlock}">[이전]</a> --%>
        <a onclick="replyRequest(${commentStartPage - commentPageBlock})">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${commentStartPage}" end="${commentEndPage}">
       <%-- <a href="comment.do?commentPageNum=${i}">[${i}]</a> --%>
       <a onclick="replyRequest(${i})">
       
       <c:if test="${ i== commentPageNum}">
       <b>[${i}]</b>
       </c:if>
       <c:if test="${ i != commentPageNum}">
       [${i}]
       </c:if>
       
       </a>
   </c:forEach>

   <c:if test="${commentEndPage < commentPageCount}">
        <%-- <a href="comment.do?commentPageNum=${commentStartPage + commentPageBlock}">[다음]</a> --%>
        <a onclick="replyRequest(${commentStartPage + commentPageBlock})">[다음]</a>
   </c:if>
</td></tr>   
</c:if>
