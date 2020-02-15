<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>顧客ID入力</TITLE>
<META HTTP-EQUIV="content-type"  CONTENT="text/html;charset=UTF-8">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
customer_selectin.jsp
<BR><Br>
顧客認証
<BR><BR>
<FORM  METHOD="POST" ACTION="/JV16/customer_selectout1.jsp">
	顧客ID <INPUT TYPE="text" NAME="cus_id">　
	顧客PW <INPUT TYPE="text" NAME="cus_pas">
	<BR><BR><HR>
	<INPUT TYPE="SUBMIT" VALUE="送信">
	<INPUT TYPE="RESET" VALUE="入力クリア">
</FORM>
</BODY>
</HTML>