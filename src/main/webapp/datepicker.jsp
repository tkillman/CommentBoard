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

</head>
<body>
<script type="text/javascript">

jQuery(function($){

    $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};

    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#date1').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: disableAllTheseDays   });

    $('#date2').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: noBefore  });

    $('#date3').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: noWeekendsOrHolidays  });

    $('#date4').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: noSundays });

});


var disabledDays = ["2013-7-9","2013-7-24","2013-7-26"];


// 주말(토, 일요일) 선택 막기

function noWeekendsOrHolidays(date) {

    var noWeekend = jQuery.datepicker.noWeekends(date);

    return noWeekend[0] ? [true] : noWeekend;

}

 

// 일요일만 선택 막기

function noSundays(date) {

  return [date.getDay() != 0, ''];

}

 

// 이전 날짜들은 선택막기

function noBefore(date){

    if (date < new Date())

        return [false];

    return [true];

}

 

// 특정일 선택막기

function disableAllTheseDays(date) {

    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();

    for (i = 0; i < disabledDays.length; i++) {

        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {

            return [false];

        }

    }

    return [true];

}

$(function() {
    $( "#testDatepicker" ).datepicker({
    });
});
</script>

<input type="text" id="testDatepicker">


<input type="text" id="date1"><br>
<input type="text" id="date2"><br>
<input type="text" id="date3"><br>
<input type="text" id="date4"><br>


</body>
</html>