<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">

$(function(){
	
	function pay(){
		var IMP = window.IMP; // ��������
		IMP.init('imp99349216');

		
		IMP.request_pay({
		    pg : 'danal', // version 1.1.0���� ����. 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '�ֹ���:�����׽�Ʈ',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '�������̸�',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '����Ư���� ������ �Ｚ��',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'http://www.naver.com'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '������ �Ϸ�Ǿ����ϴ�.';
		        msg += '����ID : ' + rsp.imp_uid;
		        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
		        msg += '���� �ݾ� : ' + rsp.paid_amount;
		        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
		    } else {
		        var msg = '������ �����Ͽ����ϴ�.';
		        msg += '�������� : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	
	}
	
	
	$('#btn1').on('click',function(){
		
		pay();
		
	})
	

	
	
})
	

</script>

</head>

<body>
<input type="button" id="btn1" value="�����Ͻðڽ��ϱ�?">
</body>
</html>