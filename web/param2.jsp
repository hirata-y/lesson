<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String namaeStr = request.getParameter("namae");
	String seibetsuStr = request.getParameter("seibetsu");
	String toshiStr = request.getParameter("toshi");
	String address1Str = request.getParameter("address1");
	
	String sei;
	
	if(seibetsuStr.equals("1")){
		sei = "男性";
	}else{
		sei = "女性";
	}
	
%>
<html>

	<head>
		<title>param2.jsp</title>
	</head>
	
	<body>
	
		param2.jsp
		<center>
			<h1>
				HTMLさんから届きました
				<br>
				あなたは
				<br>
				<font color='gray'>
					<%= address1Str %>
				</font>
				にお住いの
				<font color='green'>
					<%= namaeStr %>
				</font>
				さんですね
				<br>
				ほいでもって
				<br>
				<font color='blue'>
					<%= toshiStr %>
				</font>
				歳の
				<font color='gray'>
					<%= sei %>
				</font>
				なんですね
				
			</h1>
		</center>
		<hr>
		<a href="param2.html">戻る</a>
	
	</body>

</html>