<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="com" items="${list}">
			<tr>
			<td colspan='2'>작성자 : ${com.commenter}</td><td colspan='3' style="text-align: 'right';"> 아이피 : ${com.ip}</td>
			</tr>
			<tr><td colspan='5'> 코멘트 내용 : ${com.commentt}</td></tr>
</c:forEach>
