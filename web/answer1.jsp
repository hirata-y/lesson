<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%	
	String namaeStr = request.getParameter("namae");
	String yuubinStr = request.getParameter("yuubin");
	String addressStr = request.getParameter("address");
	String phone_numStr = request.getParameter("phone_num");
	String sexStr = request.getParameter("sex");
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	String dayStr = request.getParameter("day");
	int year = Integer.parseInt(yearStr);
	int month = Integer.parseInt(monthStr);
	int day = Integer.parseInt(dayStr);
	int birth = year * 10000 + month * 100 + day;
	int sex1 = Integer.parseInt(sexStr);
	
/*
	day_of_week tmp_num = new day_of_week();
	int week_num = tmp_num.weeknum(year, month, day);
	day_of_week tmp_str = new day_of_week();
	String week_str = tmp_str.weekstr(week_num);
	
	day_of_week tmp_num1 = new day_of_week();
	int day_sum = tmp_num1.daysum(year, month, day);
*/

	Date today = new Date();	
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	int now_year = cal.get(Calendar.YEAR);
	int now_month = cal.get(Calendar.MONTH);
	int now_day = cal.get(Calendar.DATE);
	int now = now_year * 10000 + (now_month+1) * 100 + now_day;

	String sex;
	if(sex1 == 1){
		sex = "男性";
	}else{
		sex = "女性";
	}
	
/*
	toshi tmp_num2 = new toshi();
	int age = tmp_num2.nenrei(year, month, day);
*/

%>
<html>

	<head>
		<title>
			アンケート画面
		</title>
		<meta HTTP-EQUIV="content-type" content="text/html;charset=UTF-8">
	</head>
	
	<body>
		
		 <center>
		 	
		 	<h1>アンケート画面</h1>
		 	<table border="1">
		 	
			 	<tr>
			 		<th>項目</th><th>内容</th>
			 	</tr>
			 	<tr>
			 		<td>お名前</td>
			 		<td><%= namaeStr%></td>
			 	</tr>
			 	<tr>
			 		<td>郵便番号</td>
			 		<td><%= yuubinStr%></td>
			 	</tr>
			 	<tr>
			 		<td>住所</td>
			 		<td><%= addressStr%></td>
			 	</tr>
			 	<tr>
			 		<td>電話番号</td>
			 		<td><%= phone_numStr%></td>
			 	</tr>
			 	<tr>
			 		<td>性別</td>
			 		<td><%= sex%></td>
			 	</tr>
			 	<tr>
			 		<td>生年月日</td>
<%--
			 		<td><%= yearStr%>年<%= monthStr%>月<%= dayStr%>日(<%= week_str %>)</td>
--%>
			 	</tr>
			 	<tr>
			 		<td>年齢</td>
			 		<td><%--<%= age %>--%>歳</td>
			 	</tr>
			 	<tr>
			 		<td>誕生日の曜日</td>
<%--
			 		<td><%= week_str %></td>
--%>
			 	</tr>
			 	<tr>
			 		<td>誕生日までの日付</td>
<%--
			 		<td><%= day_sum %></td>
--%>
			 	</tr>
			 	<tr>
					<td colspan="2" align="center"><a href="question1.jsp">戻る</a></td>
			 	</tr>
			 	
			 </table>
			 
		 </center>
		
		<hr>
	
	</body>
	
</html>