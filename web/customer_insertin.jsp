<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>顧客登録</TITLE>
<META HTTP-EQUIV="content-type"  CONTENT="text/html;charset=UTF-8">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
customer_insertin.jsp
<BR><BR>
顧客登録
<BR><BR>
<FORM  METHOD="POST" ACTION="/JV16/customer_insertout1.jsp">
<table border="1">
<tr>
	<th>項目名</th><th>内容</th>
</tr>
<tr>
	<td>顧客ID</td>
	<td>
		<input type="text" name="cus_id" size="40" maxlength="20">
	</td>
</tr>
<tr>
	<td>パスワード</td>
	<td>
		<input type="password" name="cus_pas" size="41" maxlength="20">
	</td>
</tr>
<tr>
	<td>氏名</td>
	<td>
		<input type="text" name="cus_name" size="40" maxlength="20">
	</td>
</tr>
</table>
	<BR><BR><HR>
	<INPUT TYPE="SUBMIT" VALUE="送信">
	<INPUT TYPE="RESET" VALUE="入力クリア">
</FORM>
</BODY>
</HTML>
