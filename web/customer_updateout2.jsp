<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//入力データ受信
	String cus_noStr   = request.getParameter("cus_no");
	String cus_idStr   = request.getParameter("cus_id");
	String cus_pasStr  = request.getParameter("cus_pas");
	String cus_nameStr = request.getParameter("cus_name");

	//データベースに接続するために使用する変数宣言
	Connection con = null;
	Statement stmt = null;
	StringBuffer SQL = null;
	ResultSet rs = null;

	//ローカルのMySQLに接続する設定
	String USER ="root";
	String PASSWORD = "";
	String URL ="jdbc:mysql://localhost/nhs90664db";

	//サーバーのMySQLに接続する設定
//	String USER = "nhs90664";
//	String PASSWORD = "b19960620";
//  String URL ="jdbc:mysql://192.168.121.16/nhs90664db";

	String DRIVER = "com.mysql.jdbc.Driver";

	//確認メッセージ
	StringBuffer ERMSG = null;

	//更新件数
	int upd_count = 0;

	try{	// ロードに失敗したときのための例外処理
		// JDBCドライバのロード
		Class.forName(DRIVER).newInstance();

		// Connectionオブジェクトの作成
		con = DriverManager.getConnection(URL,USER,PASSWORD);

		//Statementオブジェクトの作成
		stmt = con.createStatement();

		//SQLステートメントの作成（選択クエリ）
		SQL = new StringBuffer();

		//SQL文の構築（DB更新）
		SQL.append("update cus_tbl set cus_id = '");
		SQL.append(cus_idStr);
		SQL.append("',cus_pas ='");
		SQL.append(cus_pasStr);
		SQL.append("',cus_name = '");
		SQL.append(cus_nameStr);
		SQL.append("' where cus_no =");
		SQL.append(cus_noStr);

      System.out.println(SQL.toString());
		upd_count = stmt.executeUpdate(SQL.toString());

	}	//tryブロック終了
	catch(ClassNotFoundException e){
		ERMSG = new StringBuffer();
		ERMSG.append(e.getMessage());
	}
	catch(SQLException e){
		ERMSG = new StringBuffer();
		ERMSG.append(e.getMessage());
	}
	catch(Exception e){
		ERMSG = new StringBuffer();
		ERMSG.append(e.getMessage());
	}

	finally{
		//各種オブジェクトクローズ
	    try{
	    	if(rs != null){
	    		rs.close();
	    	}
	    	if(stmt != null){
	    		stmt.close();
			}
	    	if(con != null){
	    		con.close();
			}
	    }
		catch(SQLException e){
		ERMSG = new StringBuffer();
		ERMSG.append(e.getMessage());
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>『顧客テーブルのレコードを更新するプログラム』</title>
</head>
<body>
<%
	if(upd_count == 0){  //更新処理失敗
%>
	更新NG<br>
	  <%= "更新処理が失敗しました" %>
<%
	}else{  //更新OK
%>
	更新OK<br>
	  <%= upd_count + "件　更新が完了しました" %>
<%
	}
%>
<br><br>
<% if(ERMSG != null){ %>
予期せぬエラーが発生しました<br />
<%= ERMSG %>
<% }else{ %>
※エラーは発生しませんでした<br/>
<% } %>

</body>
</html>
