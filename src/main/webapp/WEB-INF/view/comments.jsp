<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<tr><td>

		<form:form id="formId" commandName="commentCommand">
				<form:hidden path="content_num" value="${article.num}" />
				<form:hidden path="comment_num" value="${comment_num}" />

				<tr bgcolor="${value_c}">
					<td colspan="2">코멘트 작성</td>
					<td><form:textarea path="commentt" rows="6" cols="40" /></td>

					<td align="center">작성자<br> 
					<form:input path="commenter" size="10" /> <br> 비밀번호<br> 
					<form:password path="passwd" size="10" />
						
							<input type="button" id="btn" value="코멘트달기" /></td>
				</tr>

			</form:form>

</td></tr>
<tr><td colspan="5">코멘트 목록(전체 수 : ${commentCount})<br></td></tr>

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
   <c:if test="${startPage > wantPageBlock}">
      
        <a onclick="replyRequest(${startPage - wantPageBlock})">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      
       <a onclick="replyRequest(${i})">
       
       <c:if test="${ i== commentPageNum}">
       <b>[${i}]</b>
       </c:if>
       <c:if test="${ i != commentPageNum}">
       [${i}]
       </c:if>
       
       </a>
   </c:forEach>

   <c:if test="${endPage < blockCount}">
      
        <a onclick="replyRequest(${startPage + wantPageBlock})">[다음]</a>
        
   </c:if>
</td></tr>   
</c:if>
