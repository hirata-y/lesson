<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>『顧客テーブルの内容を読み込みそのまま表示するプログラム』</title>
</head>
<body>
<table border="1">
	<tr><th>顧客No.</th><th>顧客ＩＤ</th><th>パスワード</th><th>氏名</th></tr>
<%
	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//データベースに接続するために使用する変数宣言
	Connection con = null;
	Statement stmt = null;
	StringBuffer SQL = null;
	ResultSet rs = null;

	//ローカルのMySQLに接続する設定
//	String USER ="root";
//	String PASSWORD = "";
//	String URL ="jdbc:mysql://localhost/nhs90664db";

	//サーバーのMySQLに接続する設定
	String USER = "nhs90664";
	String PASSWORD = "b19960620";
  String URL ="jdbc:mysql://192.168.121.16/nhs90664db";

	String DRIVER = "com.mysql.jdbc.Driver";

	// JDBCドライバのロード
	Class.forName(DRIVER).newInstance();

	// Connectionオブジェクトの作成
	con = DriverManager.getConnection(URL,USER,PASSWORD);

	//Statementオブジェクトの作成
	stmt = con.createStatement();

	//SQLステートメントの作成（選択クエリ）
	SQL = new StringBuffer();

	//SQL文の発行（選択クエリ）
	SQL.append("select * from cus_tbl");

	//SQL文の発行（選択クエリ）
	rs = stmt.executeQuery(SQL.toString());

	//抽出したデータを繰り返し処理で表示する。
	while(rs.next()){
    	//顧客ＮＯ（自動生成）
    	out.println("<tr><td>" + rs.getString("cus_no") + "</td>");
    	//顧客ＩＤ（ログインＩＤ）
    	out.println("<td>" + rs.getString("cus_id") + "</td>");
    	//顧客ＰＷ（ログインパスワード）
    	out.println("<td>" + rs.getString("cus_pas") + "</td>");
    	//ハンドルネーム
    	out.println("<td>" + rs.getString("cus_name") + "</td></tr>");
	}
	rs.close();
	stmt.close();
	con.close();
%>
</table>
</body>
</html>
