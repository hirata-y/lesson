<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String namaeStr = request.getParameter("namae");
	String gakunenStr = request.getParameter("gakunen");
	String gozenStr = request.getParameter("gozen");
	String gogoStr = request.getParameter("gogo");
	
	int gozen = Integer.parseInt(gozenStr);
	int gogo = Integer.parseInt(gogoStr);
	int goukei = gozen + gogo;
	
	String hantei;
	
	if(goukei >= 140 && gozen >= 65 && gogo >= 65){
		hantei = "合格";
	}else{
		hantei = "不合格";
	}
	
%>
<html>

	<head>
		<title>kokushi.jsp</title>
	</head>
	
	<body>
	
		kokushi2.jsp
		<center>
			<h1>
				国家試験判定
				<br>
				<font color='gray'>
					<%= gakunenStr %>
				</font>
				の
				<font color='gray'>
					<%= namaeStr %>
				</font>
				さん
				<br>
				あなたの得点は
				<br>
				午前
				<font color='green'>
					<%= gozen %>
				</font>
				午後
				<font color='green'>
					<%= gogo %>
				</font>
				合計
				<font color='red'>
					<%= goukei %>
				</font>
				<br>
				判定結果は
				<font color='blue'>
					<%= hantei %>
				</font>
				です
			</h1>
		</center>
		<hr>
		<a href="kokushi2.html">戻る</a>
	
	</body>

</html>