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
	String sex;
	
	Date today = new Date();	
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	int now_year = cal.get(Calendar.YEAR);
	int now_month = cal.get(Calendar.MONTH);
	int now_day = cal.get(Calendar.DATE);
	int now = now_year * 10000 + (now_month+1) * 100 + now_day;
	int age = 0;
	
	if(sex1 == 1){
		sex = "男性";
	}else{
		sex = "女性";
	}
	
	for(int i = birth; i <= now; i++){	
		if((i%10000) == (birth%10000) && (i%100) == (birth%100)){
				age = age + 1;
		}
	}
	
	age = age - 1;
	
	
	int flg = 0;
	double num = 10;
	int lottery_num = 10;
	while(flg == 0){
		if(lottery_num >= 7){
			num = Math.floor(Math.random() * 10);
			lottery_num = (int)num;
		}else{
			flg = flg + 1;	
		}
	}
	
	String[] array_lottery = {"大吉","中吉","小吉","吉","末吉","凶","大凶"};
	String lottery = array_lottery[lottery_num];
	
	char[] pass = new char[6];
	flg = 0;
	int pass_num = 0;
	int j = 0;
	while(flg == 0){
		while(j == 0){
			if((pass_num >= 65 && pass_num <= 90) || (pass_num >= 97 && pass_num <= 122)){
				pass[j] = (char)pass_num;
				j = j + 1;
			}
			pass_num = (int)(Math.random() * 128);
		}
		if((pass_num >= 65 && pass_num <= 90) || (pass_num >= 97 && pass_num <= 122) || (pass_num >= 48 && pass_num <= 57)){
			pass[j] = (char)pass_num;
			j = j + 1;
		}
		if(j >= 6){
			flg = flg + 1;
		}
		pass_num = (int)(Math.random() * 128);
	}
	
	String passStr = new String(pass); 

/*
	temp num0 = new temp();
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
			 		<td><%= yearStr%>年<%= monthStr%>月<%= dayStr%>日</td>
			 	</tr>
			 	<tr>
			 		<td>年齢</td>
			 		<td><%= age %>歳</td>
			 	</tr>
			 	<tr>
			 		<td>今日の運勢</td>
			 		<td><%= lottery %></td>
			 	</tr>
			 	<tr>
			 		<td>パスワード</td>
			 		<td><%= passStr %></td>
			 	</tr>
			 	<tr>
			 		<td>test</td>
<%--
			 		<td><%= num0.num_tmp %></td>
--%>
			 	</tr>
			 	<tr>
					<td colspan="2" align="center"><a href="test0.jsp">戻る</a></td>
			 	</tr>
			 	
			 </table>
			 
		 </center>
		
		<hr>
	
	</body>
	
</html>