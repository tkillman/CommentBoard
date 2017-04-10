<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jquery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
     <script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   


<script type="text/javascript">
alert('12')

$(function(){ // 날짜 입력

	var today = new Date();

	var dd = today.getDate();

	var mm = today.getMonth()+1;

	var yyyy = today.getFullYear();



	today = yyyy+'-'+mm+'-'+dd;     //오늘날짜 ex. 2016/11/12

	var todaydate = [today];        //배열에 넣음
	
	$("#date1").datepicker({ 

		changeMonth: true, 

		changeYear: true, 

		dateFormat: "yymmdd", 						

	        minDate: 0,

	        maxDate: '+1Y+6M',

		showButtonPanel: true,

		

		beforeShowDay: function(dateStr){



			var dd = dateStr.getDate();

			var mm = dateStr.getMonth()+1;

			var yyyy = dateStr.getFullYear();
			
			if(dd < 10){

				dd = '0'+dd

			}

			if(mm < 10){

				mm = '0'+mm

			}


			date = yyyy+'-'+mm+'-'+dd;        //jquery 달력의 날짜를 yyyy/mm/dd 형태로 만듬.							

			
			console.log(todaydate)
			
			if ($.inArray(date, todaydate) >= 0) {    //jquery달력의 날짜가 오늘날짜와 같다면

				return [true, "Highlighted"];    //스타일 적용

			}else{

				return [true, '', ''];

			}

		},


	});

});

</script>


<style type="text/css">
.Highlighted a{

   background-color : red !important;

   background-image :none !important;

   color: white !important;

   font-weight:bold !important;

   font-size: 12px;

}


</style>

</head>
<body>

<input type="text" name="date1" value="" readonly id="date1" required size="9" maxlength="8" placeholder="날짜선택"> 




</body>
</html>