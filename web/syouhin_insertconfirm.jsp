<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//入力データ受信
	String syou_nameStr  = request.getParameter("syouhin_name");
	String syou_preStr  = request.getParameter("syouhin_pre");
	String syou_msgStr  = request.getParameter("syouhin_msg");
	String syou_iconStr  = request.getParameter("syouhin_icon");

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
		SQL.append("select pre_name from ken_tbl where pre_no = ");
		SQL.append(syou_preStr);

		//SQL文の発行（選択クエリ）
		rs = stmt.executeQuery(SQL.toString());

		//抽出したデータを繰り返し処理で表示する。
		while(rs.next()){
		    //DBのデータをHashMapへ格納する
			map = new HashMap<String,String>();
			map.put("pre_name",rs.getString("pre_name"));

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
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>追加確認画面</title>
  </head>
  <body>
    <h1>追加確認</h1><br>
    以下の内容で登録します <br>
    <form action="syouhin_insertout.jsp" method="post">
			<input type="hidden" name="syouhin_name" value="<%= syou_nameStr %>">
			<input type="hidden" name="syouhin_pre" value="<%= syou_preStr %>">
			<input type="hidden" name="syouhin_msg" value="<%= syou_msgStr %>">
			<input type="hidden" name="syouhin_icon" value="<%= syou_iconStr %>">

      <table border="1">
        <tr>
          <td>商品名:</td><td><%= syou_nameStr %></td>
        </tr>
        <tr>
          <td>生産地:</td><td><%= list.get(0).get("pre_name") %></td>
        </tr>
        <tr>
          <td>コメント:</td><td><%= syou_msgStr %></td>
        </tr>
        <tr>
          <td>アイコン:</td><td><img src="image/<%= syou_iconStr %>.png" height="70px" width="70px" /></td>
        </tr>
      </table>
      <br>
				<input type="submit" value="登録">
    </form>
    <form action="syouhin_insertin.jsp" method="post">
			<input type="submit" value="入力に戻る">
		</form>

		<form method="post" action="syouhin_index.jsp">
			<input type="hidden" name="logout" value="logout">
			<input type="submit" value="ログアウト">
		</form>
  </body>
</html>
