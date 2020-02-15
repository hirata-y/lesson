<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%

	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String session_name = (String)session.getAttribute("login_name");

	if(session_name == null) {
		response.sendRedirect("syouhin_index.jsp");
	}

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

	//HashMap（1件分のデータを格納する連想配列）
	HashMap<String,String> map = null;

	//ArrayList（すべての件数を格納する配列）
	ArrayList<HashMap> list = null;
	list = new ArrayList<HashMap>();

	try{	// ロードに失敗したときのための例外処理
		// JDBCドライバのロード
		Class.forName(DRIVER).newInstance();

		// Connectionオブジェクトの作成
		con = DriverManager.getConnection(URL,USER,PASSWORD);

		//Statementオブジェクトの作成
		stmt = con.createStatement();

    	//SQLステートメントの作成（選択クエリ）
    	SQL = new StringBuffer();

		//SQL文の発行（選択クエリ）
		SQL.append("select syou_no,syou_name,syou_pre,syou_msg,syou_icon,pre_name from syou_tbl,ken_tbl where syou_pre = pre_no order by syou_no");

		//SQL文の発行（選択クエリ）
		rs = stmt.executeQuery(SQL.toString());

		//抽出したデータを繰り返し処理で表示する。
		while(rs.next()){
		    //DBのデータをHashMapへ格納する
			map = new HashMap<String,String>();
			map.put("syou_no",rs.getString("syou_no"));
			map.put("syou_name",rs.getString("syou_name"));
			map.put("pre_name",rs.getString("pre_name"));
			map.put("syou_msg",rs.getString("syou_msg"));
			map.put("syou_icon",rs.getString("syou_icon"));

			//1件分のデータ(HashMap)をArrayListへ追加
			list.add(map);
		}
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
<title>商品管理　全件検索</title>
</head>
<% if(ERMSG != null){ %>
予期せぬエラーが発生しました<br />
<%= ERMSG %>
<% } %>
<body>

<h1>商品一覧</h1>
sessionID:<%= session.getId() %><br>
<h2>ようこそ <%= session_name %> さん</h2><br>
<br>
	<%= list.get(0).get("pre_name") %><br>
	<%
		for(int i = 0; i < list.size(); i++){
	%>
		<table border="1">
		<tr>
			<td rowspan="5">
				<img src="image/<%= list.get(i).get("syou_icon") %>.png" height="70px" width="70px" />
			</td>
		</tr>
		<tr>
			<td>
				商品No.
			</td>
			<td  width="300">
				<%= list.get(i).get("syou_no") %>
			</td>
		</tr>
		<tr>
			<td>
				商品名
			</td>
			<td  width="300">
				<%= list.get(i).get("syou_name") %>
			</td>
		</tr>
		<tr>
			<td>
				産地
			</td>
			<td  width="300">
				<%= list.get(i).get("pre_name") %>
			</td>
		</tr>
		<tr>
			<td>
				コメント
			</td>
			<td  width="300">
				<%= list.get(i).get("syou_msg") %>
			</td>
		</tr>
		<tr>
			<td>
				<a href="syouhin_updatein.jsp?syou_no=<%= list.get(i).get("syou_no") %>">[編集]</a>
				<a href="syouhin_deleteconfirm.jsp?syou_no=<%= list.get(i).get("syou_no") %>">[削除]</a>
			</td>
		</tr>
		</table>
		<br />
	<%
		}
	%>
	<form method="post" action="syouhin_insertin.jsp">
		<input type="submit" value="商品登録">
	</form>
	<form method="post" action="syouhin_index.jsp">
		<input type="hidden" name="logout" value="logout">
		<input type="submit" value="ログアウト">
	</form>
  </body>
</html>
