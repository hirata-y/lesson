<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//入力データ受信
	String syou_noStr  = request.getParameter("syou_no");

	//データベースに接続するために使用する変数宣言
	Connection con = null;
	Statement stmt = null;
	StringBuffer SQL = null;
	ResultSet rs = null;

	//ローカルのMySQLに接続する設定
	// String USER ="root";
	// String PASSWORD = "";
	// String URL ="jdbc:mysql://localhost/nhs90664db";

	//サーバーのMySQLに接続する設定
	String USER = "nhs90664";
	String PASSWORD = "b19960620";
 String URL ="jdbc:mysql://192.168.121.16/nhs90664db";

	String DRIVER = "com.mysql.jdbc.Driver";

	//確認メッセージ
	StringBuffer ERMSG = null;

	//削除件数
	int del_count = 0;

	try{	// ロードに失敗したときのための例外処理
		// JDBCドライバのロード
		Class.forName(DRIVER).newInstance();

		// Connectionオブジェクトの作成
		con = DriverManager.getConnection(URL,USER,PASSWORD);

		//Statementオブジェクトの作成
		stmt = con.createStatement();

		//SQLステートメントの作成（選択クエリ）
		SQL = new StringBuffer();

		//SQL文の構築（DB削除）
		SQL.append("delete from syou_tbl where syou_no = ");
		SQL.append(syou_noStr);

    //System.out.println(SQL.toString());
		del_count = stmt.executeUpdate(SQL.toString());

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

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>削除完了</title>
</head>
<body>
<%
	if(del_count == 0){  //追加処理失敗
%>
	削除NG<br>
	  <%= "削除処理が失敗しました" %><br>
		<a href="syouhin_main.jsp">商品一覧に戻る</a>

		<form method="post" action="syouhin_index.jsp">
			<input type="hidden" name="logout" value="logout">
			<input type="submit" value="ログアウト">
		</form>
<%
	}else{  //削除OK
%>
	削除OK<br>
	  <%= del_count + "件　削除が完了しました" %><br>
		<a href="syouhin_main.jsp">商品一覧に戻る</a>

		<form method="post" action="syouhin_index.jsp">
			<input type="hidden" name="logout" value="logout">
			<input type="submit" value="ログアウト">
		</form>
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
