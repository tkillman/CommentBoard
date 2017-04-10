<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>datepicker</title>
<!--// jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--// jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--// jQuery UI 라이브러리 js파일-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

   
   $(function() {
    
	   $.datepicker.regional['ko'] = {
    		closeText: '닫기'
    		,prevText: '이전달'
    		,nextText: '다음달'
    		,currentText: '오늘'
    		,monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)']
    		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    		,dayNames: ['일','월','화','수','목','금','토']
    		,dayNamesShort: ['일','월','화','수','목','금','토']
    		,dayNamesMin: ['일','월','화','수','목','금','토']
    		,weekHeader: 'Wk'
    		,dateFormat: 'yy-mm-dd',firstDay: 0
    		,isRTL: false
    		,showMonthAfterYear: true
    		,yearSuffix: ''};
    
      
   $.datepicker.setDefaults($.datepicker.regional['ko']);

   
   $('#testDatepicker').datepicker({
	   showOn: 'both'
	   ,buttonText: "달력"
	   ,changeMonth: true
	   ,changeYear: true
	   ,showButtonPanel:true
	   ,yearRange: 'c-99:c+99'
	   ,constrainInput: true
	   ,maxDate: '+1y'
	   ,beforeShowDay: testdatepicker  });

   });
   
   /* 특정날짜들 배열*/
   var disabledDays = ["2017-4-10","2017-4-24"];

   /* 특정일 선택막기 + 이전 날짜 막기*/
   function testdatepicker(date) {
	  
	   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	    
	   if(disabledDays.length != 0){
	          
		   for (i = 0; i < disabledDays.length; i++) {
	        	  console.log(disabledDays[i])
	            if(date < new Date()||$.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
	               return [false];
	            }
	         }
	         return [true];
	       } else if (date < new Date()){
	           return [false];
	        }
	       return [true];
   }
   
</script>
</head>
<body>
   <input type="text" id="testDatepicker">
</body>
</html>