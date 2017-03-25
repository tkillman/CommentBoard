<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="color.jspf"%>

<html>
<head>
<title>게시판</title>
<link href="source/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('#btn').on('click',function() {

			var url = "comment.do";
			var data = $('#formId').serialize();

			$.ajax({
				type : "post",
				url : url,
				data : data,
				
				success : function(arg) {
					//console.log(arg.list);
					$('#commentt').val("");
					$('#commenter').val("");
					$('#passwd').val("");
					$('#tbody tr').remove();
					
					
					$('#tbody').html(arg)
					
					
					
				}

			})

		})

	});
</script>



</style>
</head>

<body bgcolor="${bodyback_c}">
	<center>
		<b>글내용 보기</b> <br>
		<table width="500" border="1" cellspacing="0" cellpadding="0"
			align="center">
		
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">글번호</td>
				<td align="center" width="125" align="center">${article.num}</td>
				<td align="center" width="125" bgcolor="${value_c}">조회수</td>
				<td align="center" width="125" align="center">${article.readcount}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">작성자</td>
				<td align="center" width="125" align="center">${article.writer}</td>
				<td align="center" width="125" bgcolor="${value_c}">작성일</td>
				<td align="center" width="125" align="center"><fmt:formatDate
						value="${article.reg_date}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="${value_c}">글제목</td>
				<td align="center" width="375" align="center" colspan="3">${article.subject}</td>
			</tr>
			<tr>
				<td align="center" width="125" bgcolor="${value_c}">글내용</td>
				<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" bgcolor="${value_c}" align="right"><input
					type="button" value="글수정"
					onclick="document.location.href='/MVC_board/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
					onclick="document.location.href='/MVC_board/MVC/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
					onclick="document.location.href='/MVC_board/MVC/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
					onclick="document.location.href='list.do?pageNum=${pageNum}'">
				</td>
			</tr>


			<form:form id="formId" commandName="commentCommand">
				<form:hidden path="content_num" value="${article.num}" />
				<form:hidden path="comment_num" value="${comment_num}" />

				<tr bgcolor="${value_c}">
					<td colspan="2">코멘트 작성</td>
					<td><form:textarea path="commentt" rows="6" cols="40" /></td>

					<td align="center">작성자<br> <form:input
							path="commenter" size="10" /> <br> 비밀번호<br> <form:password
							path="passwd" size="10" />
						
							<input type="button" id="btn" value="코멘트달기" /></td>
				</tr>

			</form:form>
			
		
			
			<tr><td colspan="5">코멘트 목록<br></td></tr>
			<tbody id='tbody'>
			<c:forEach var="co" items="${commentCommands}">
			<tr>
			<td colspan='2'>작성자 : ${co.commenter}</td><td colspan='3' style="text-align: 'right';"> 아이피 : ${co.ip}</td>
			</tr>
			<tr><td colspan='5'> 코멘트 내용 : ${co.commentt}</td></tr>
			</c:forEach>			
			</tbody>
			
		</table>	

</center>		
</body>
</html>
