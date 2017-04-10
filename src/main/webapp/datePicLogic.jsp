<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>datepicker</title>

<style>
.Highlighted a{

   background-color : red !important;

   background-image :none !important;

   color: White !important;

   font-weight:bold !important;

   font-size: 12px;

}



출처: http://ellordnet.tistory.com/130 [IT in MT]
</style>



<!--// jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--// jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--// jQuery UI 라이브러리 js파일-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

   
   
   
   $(function() {
	   
	   alert('aafd');
	   
	var today = new Date();

	var dd = today.getDate();

	var mm = today.getMonth()+1;

	var yyyy = today.getFullYear();

	if(dd < 10){
		dd = '0'+dd
	}

	if(mm < 10){

		mm = '0'+mm

	}

	today = yyyy+'/'+mm+'/'+dd;     //오늘날짜 ex. 2016/11/12

	var todaydate = [today];        //배열에 넣음

	$("#date1").datepicker({ 


		dateFormat: "yymmdd", 						

		changeYear: false,
		changeMonth: false, 
	        minDate: 0,

	        maxDate: '+1M',

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

			date = yyyy+'/'+mm+'/'+dd;        //jquery 달력의 날짜를 yyyy/mm/dd 형태로 만듬.							

			var Highlight = todaydate[date];    //스타일을 적용할 날짜


			if ($.inArray(date, todaydate) >= 0) {    //jquery달력의 날짜가 오늘날짜와 같다면

				return [true, "Highlighted", Highlight];    //스타일 적용

			}else{

				return [true, '', ''];

			}

		},

				

	    

	    

	});

   });
   
   
   
   var arrDays = ["2017-4-11","2017-4-12","2017-4-13"];
   $(document).on('click','#btn1',function(){
	  alert('asf');
	   var url="arr.do";
	   var query="arrDays="+arrDays;
	   
	   
	   $.ajax({
		  	 type:"GET"
			,url:url
			,data:query
		    ,success(arg){
				console.log(arg)
			}
		    ,error(arg1){
		    	console.log(arg1)
		    }
		 
	   })
	   
	   
   })
   
   
   
   
</script>
</head>
<body>
   
   
   <input type="text" id="date1">
   
   <input type="button" id="btn1" value="저장">
   
   
   
   
   
   
</body>
</html>