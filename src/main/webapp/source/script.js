function writeSave(){
		
if($('#writer').val()==""){
  alert("작성자를 입력하십시요.");
  $('#writer').focus();
  
  return false;
}

if($('#subject').val()==""){
  alert("제목을 입력하십시요.");
  $('#subject').focus();
  return false;
}

if($('#content').val()==""){
  alert("내용을 입력하십시요.");
  $('#content').focus();
  return false;
}
       
if($('#passwd').val()==""){
  alert(" 비밀번호를 입력하십시요.");
  $('#passwd').focus();
  return false;
}

}   