<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<style type="text/css">
	
	.inp{
		border:1 solid #E2EAFF;
		font-family:"����ü";
		font-size:10pt;
	}
	a, a:link, a:visited, a:active{
		text-decoration: none;
		color: #122293;
	}
	a:hover{
		text-decoration: none;
		font-size: 10pt
	}
	
</style>

<%
	//������ ����, �� �޾ƿ���. �Ķ���� ���� ���ڰ� �ƴϰų� null�̸� ���� �޷� ������.
	GregorianCalendar curDate = new GregorianCalendar();
	int year = 0;
	int month = 0; //���ϴ� ��-1 ��. ��)2�� = 1
			
	try{
		//�Ķ���ͷ� �Ѿ�� �� ����
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		
		
		//�޷� ����
		curDate.set(Calendar.YEAR, year); //������ ���� setting
		curDate.set(Calendar.MONTH, month); //������ �� setting
		curDate.set(Calendar.DAY_OF_MONTH, 1); //���ڴ� 1�Ϸ� ����
	
		
	}catch(NumberFormatException nfe){
		
		//���� ��¥ �⵵ �Էµ�
		year = curDate.get(Calendar.YEAR);
		
		//���� �� �� �Էµ�.
		month = curDate.get(Calendar.MONTH);
	}
	
	//ù ��¥ ���� idx
	int firstDay = new GregorianCalendar(curDate.get(Calendar.YEAR), curDate.get(Calendar.MONTH), 1).get(Calendar.DAY_OF_WEEK); //�ش� ���� �����ϴ� �� idx
	
	
	//�� ���� ��¥ ��
	int lastDay = curDate.getActualMaximum(Calendar.DAY_OF_MONTH); //�ش� ���� ������ ��
	
	//���� ���� ���ϱ�
	
	GregorianCalendar getToday = new GregorianCalendar();
	
	//2017
	int todayYear = getToday.get(Calendar.YEAR);
	
	//3
	int todayMonth = getToday.get(Calendar.MONTH);
	
	//4
	int todayDate = getToday.get(Calendar.DAY_OF_MONTH)+1;
	
	//�� �Ϸ縦 ��������?
	//�޷¿� ǥ���� �� day++�� �ϸ鼭 ���� ���� +1�� ���� ���� ��¥		
	
	
	//�޷� ����
	int row = 7; //��
	int col = 5; //��
	int day = 1;
	out.println("<table class=inp border=1>");
	out.println("	<tr>");
	out.println("		<td colspan="+row+" align=center><a href='"+traverseDate("downYear", year, month)+"'><font style='text-decoration: none;'>��</font></a><font style='font-size: 18'>"+year+"</font>��<a href='"+traverseDate("upYear", year, month)+"'><font style='text-decoration: none;'>��</font></a>&nbsp;<a href='"+traverseDate("downMonth", year, month)+"'><font style='text-decoration: none;'>��</font></a><font style='font-size: 18'>"+(month+1)+"</font>��<a href='"+traverseDate("upMonth", year, month)+"'><font style='text-decoration: none;'>��</font></a>&nbsp;&nbsp;<a href='./JSPCalendar.jsp'><font style='text-decoration: none;'>reset</font></a></td>");
	out.println("	</tr>");
	out.println("	<tr align=left height=30>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><font color='red'><b>��</b></font></td>"); 
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>��</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>ȭ</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>��</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>��</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>��</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><font color='blue'><b>��</b></font></td>");
	out.println("	</tr>");
	
	for(int i = 0; i < col; i++){
		out.println("<tr align=left height=75>");
		for(int j = 0; j < row; j++){
			out.println("<td class=inp width=100 bgcolor='#FCFDFE' valign=top>");
			
			if(day <= lastDay){
				
				//ù �� �����ϴ� �� �������� ��ĭ���� ä���
				if(i == 0 && (j+1) < firstDay){
					out.println("");
					continue;
				}
				
				if(j == 0)	out.println("<font color='red' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
				else if(j == 6)	out.println("<font color='blue' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
				else	out.println("<font color='black' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
			
			}else{
				//������ ��¥�� �Ѿ�ٸ�
				out.println("");
			}
			out.println("</td>");
		}
		out.println("</tr>");

		//�ش� ���� 1���� �ݿ����̳� ����Ϸ� �����ؼ� 5�ٷ� ����� �Ұ����� ��� �� �� �߰�
		if(((i+1) == col) && (lastDay > (day-1))){
			col++;
		}
	}
	out.println("</table>");
%>

<%!
	//����, �� �̵� ���� �޼ҵ�
	private String traverseDate(String type, int year, int month){
		String href = "";
		if(type.equals("upYear")){
			href = "./JSPCalendar.jsp?year=" + (year+1) + "&month=" + month;
		}else if(type.equals("downYear")){
			href = "./JSPCalendar.jsp?year=" + (year-1) + "&month=" + month;
		}else if(type.equals("upMonth")){
			if(month == 11){
				href = "./JSPCalendar.jsp?year=" + (year+1) + "&month=0";
			}else{
				href = "./JSPCalendar.jsp?year=" + year + "&month=" + (month+1);
			}
		}else if(type.equals("downMonth")){
			if(month == 0){
				href = "./JSPCalendar.jsp?year=" + (year-1) + "&month=11";
			}else{
				href = "./JSPCalendar.jsp?year=" + year + "&month=" + (month-1);
			}
		}
		return href;
	}
	
	//���� ���� ��� ���� �޼ҵ�
	private String printToday(int todayYear, int year, int todayMonth, int month, int todayDate, int day){
		
		if((day-1)==6){
			return "&nbsp;<b>�����Դϴ�.</b>";
		}
		
		if((day-1)==13){
			return "&nbsp;<b>�����Դϴ�.</b>";
		}
		
		if((day-1)==17){
			return "&nbsp;<b>�����Դϴ�.</b>";
		}
		
		if((day-1)==20){
			return "&nbsp;<b>�����Դϴ�.</b>";
		}
		
		if((day-1)==27){
			return "&nbsp;<b>�����Դϴ�.</b>";
		}
		
		if(todayYear == year && todayMonth == month && todayDate == day){
			return "&nbsp;<b>Today</b>";
		}
		return "";
	}
	
	
	
	
%>