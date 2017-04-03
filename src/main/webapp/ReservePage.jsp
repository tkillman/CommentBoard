<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">


var reserveTime= null ;


$(function(){
	  $( "#testDatepicker" ).datepicker({})
	  
	  
	  //시간 입력 단추
	  $('#btn1').on('click',function(){
		  
		  var isHidden = $('#div1').is(":hidden");
			
			if(isHidden){
				$('#div1').show(100); //파라미터는 걸리는 시간.
			}else {
				$('#div1').hide(100);
			}
		  
		  
		  
	  });
	  
	  //시간 입력 단추 중 하나값만 받아오기
	  $('.timeBlock').on('click',function(){
		 
		  $('.timeBlock').css('background', '');
		  
		  $(this).css("background-color","red");
		   reserveTime = $(this).val();
		
	  })
	  
	
	  //sub 단추를 눌렀을 때
	  
	  $('#sub').on('click',function(){
		  
		  checkValue();
	  })
	  
	  
}) 
 
function checkValue(){
	  
	 
	
	 if(reserveTime ==null){
		 alert('시간을 선택해주세요.')
		 return;
	 }
	  
	  if($('#people').val()=='' ){
		 alert('인원을 선택해주세요.')
		 return;
	  }
	  
	
	 $('#reserveData').html('예약 날짜 : '+$( "#testDatepicker" ).val() + '&nbsp;'+ '예약 시간 : '+  reserveTime + '&nbsp;'+' 예약 인원 : ' + $('#people').val()) 
	  
} 

</script>

</head>

<body>

<form action="" method="GET" onsubmit="checkValue();">
<div id="testDatepicker" style="width:20%;"></div>

<input type="button" id="btn1" value="시간을 입력해주세요">
<div id="div1"  style= "display : none;">

Lunch <input type="button" class="timeBlock" value="11:00"><input type="button" class="timeBlock" value="12:00"><input type="button" class="timeBlock" value="01:00"><input type="button" class="timeBlock" value="02:00"><input type="button" class="timeBlock" value="03:00"><br>

--------------------------------------------------------<br>

Dinner <input type="button" class="timeBlock" value="05:00"><input type="button" class="timeBlock" value="06:00"><input type="button" class="timeBlock" value="07:00"><input type="button" class="timeBlock" value="08:00"><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="timeBlock" value="09:00"><input type="button" class="timeBlock" value="10:00">

</div>


<div>
<select id="people">
<option value="">인원을 선택해주세요</option>
<option value="2">2명</option>
<option value="3">3명</option>
<option value="4">4명</option> 
<option value="4">5명</option> 
</select>
</div>


<input type="button" id="sub" value="예약"><br>
<div id="reserveData"></div>


</form>
</body>
</html>