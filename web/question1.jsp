<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
%>

<html>

	<head>
		<title>
			アンケート画面
		</title>
		<meta HTTP-EQUIV="content-type" content="text/html;charset=UTF-8">
	</head>
	
	<body>
		<form method="post" action="answer1.jsp">
		
		 <center>
		 	
		 	<h1>アンケート画面</h1>
		 	<table border="1">
		 	
			 	<tr>
			 		<th>項目</th><th>内容</th>
			 	</tr>
			 	<tr>
			 		<td>お名前</td>
			 		<td><input name="namae"></td>
			 	</tr>
			 	<tr>
			 		<td>郵便番号</td>
			 		<td><input name="yuubin"></td>
			 	</tr>
			 	<tr>
			 		<td>住所</td>
			 		<td><input name="address"></td>
			 	</tr>
			 	<tr>
			 		<td>電話番号</td>
			 		<td><input name="phone_num"></td>
			 	</tr>
			 	<tr>
			 		<td>性別</td>
			 		<td><input type="radio" name="sex" value="1">男性
			 		    <input type="radio" name="sex" value="2">女性</td>
			 	</tr>
			 	<tr>
			 		<td>生年月日(年)</td>
			 		<td><input name="year"></td>
			 	</tr>
			 	<tr>
			 		<td>生年月日(月)</td>
			 		<td><input name="month"></td>
			 	</tr>
			 	<tr>
			 		<td>生年月日(日)</td>
			 		<td><input name="day"></td>
			 	</tr>
			 	<tr>
			 		<td colspan="2" align="center"><input type="submit" value="送信する"></td>
			 	</tr>
			 	
			 </table>
			 
		 </center>
		 
		</form>
		
		<hr>
	
	</body>
	
</html>