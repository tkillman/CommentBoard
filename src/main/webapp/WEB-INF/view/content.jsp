<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="color.jspf"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link href="source/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

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
				<td align="center" width="125" align="center">
				<fmt:formatDate value="${article.reg_date}" pattern="yyyy-MM-dd" /></td>
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
				<td colspan="4" bgcolor="${value_c}" align="right">
				<input type="button" value="글수정"
					onclick="alert('미구현')">
					&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" value="글삭제"onclick="alert('미구현')">
					&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" value="답글쓰기"
					onclick="alert('미구현')">
					&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" value="글목록"
					onclick="document.location.href='list.do?pageNum=${pageNum}'">
				</td>
			</tr>
			
			<tbody id='tbody'></tbody>
			
		</table>	

</center>		
</body>
</html>



<script type="text/javascript">

	$(function() {
		//처음 로드될 때 ajax로 보여줄 페이지
		replyRequest(1);
		
		//이벤트 등록
		$(document).on('click','#btn',function() {
			
			insertReply();
		})
	
		function replyRequest(commentPageNum){
			
			var url = "comment.do";
			var data ='commentPageNum='+commentPageNum+'&content_num='+${article.num};
			
			$.ajax({
				type : "GET",
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
			
		} //replyRequest(commentPageNum)	

		function insertReply(){
			
			if($('#commentt').val() == ""){
				alert('코멘트를 입력해주세요.')
				return false;
			}
			
			if($('#commenter').val() == ""){
				alert('작성자를 입력해주세요.')
				return false;
			}
			
			if($('#passwd').val() == ""){
				alert('비밀번호를 입력해주세요.')
				return false;
			}
			
			var url = "comment.do";
			var data = 'commentt='+$('#commentt').val()+
					   '&commenter='+$('#commenter').val()+	
						'&passwd='+$('#passwd').val()+
						'&commentPageNum='+'1'+
						'&content_num='+${article.num}

			$.ajax({
				type : "POST",
				url : url,
				data : data,
				success : function(arg) {
					//console.log(arg.list);
					$('#commentt').val("");
					$('#commenter').val("");
					$('#passwd').val("");
					$('#tbody tr').remove();
					replyRequest(1);
				}
			})
		}	//insertReply()
	
	});
	


</script>