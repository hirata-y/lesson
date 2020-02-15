<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//入力データ受信
	String cus_idStr  = request.getParameter("cus_id");
	String cus_pasStr  = request.getParameter("cus_pas");
	String cus_nameStr  = request.getParameter("cus_name");

%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>入力確認ページ</title>
  </head>
  <body>
    <form action="customer_insertout.jsp" method="post">
			<input type="hidden" name="cus_id" value="<%= cus_idStr %>">
			<input type="hidden" name="cus_pas" value="<%= cus_pasStr %>">
			<input type="hidden" name="cus_name" value="<%= cus_nameStr %>">

			入力確認
			<br>
			以下の内容で登録します。
			<br>
			顧客ID: <%= cus_idStr %> <br>
			顧客PW: <%= cus_pasStr %> <br>
			顧客名: <%= cus_nameStr %> <br>
			<br>
				<input type="submit" value="登録">
    </form>
		<form action="customer_insertin.jsp" method="post">
			<input type="submit" value="入力に戻る">
		</form>
  </body>
</html>
