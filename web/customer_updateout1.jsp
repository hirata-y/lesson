<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	//文字コードの指定
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	//入力データ受信
	String cus_noStr  = request.getParameter("cus_no");

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
	
	//ヒットフラグ
	int hit_flag = 0;
	
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

		//SQL文の構築（選択クエリ）
		SQL.append("select * from cus_tbl where cus_no = ");
		SQL.append(cus_noStr);
//      System.out.println(SQL.toString());

		//SQL文の実行（選択クエリ）
		rs = stmt.executeQuery(SQL.toString());

		//入力したデータがデータベースに存在するか調べる
		if(rs.next()){  //存在する
			//ヒットフラグON
			hit_flag = 1;
			
		    //検索データをHashMapへ格納する
		    map = new HashMap<String,String>();
			map.put("cus_no",rs.getString("cus_no"));
			map.put("cus_id",rs.getString("cus_id"));
			map.put("cus_pas",rs.getString("cus_pas"));
			map.put("cus_name",rs.getString("cus_name"));
			
			//1件分のデータ(HashMap)をArrayListへ追加
			list.add(map);
		}else{  //存在しない
			//ヒットフラグOFF
			hit_flag = 0;
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
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>顧客変更</TITLE>
<META HTTP-EQUIV="content-type"  CONTENT="text/html;charset=UTF-8">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
customer_insertin.jsp
<BR><BR>
顧客変更
<BR><BR>
<FORM  METHOD="POST" ACTION="/JV16/customer_updateout2.jsp">
<input type="hidden" name="cus_no" value="<%= list.get(0).get("cus_no") %>">
<table border="1">
<tr>
	<th>項目名</th><th>内容</th>
</tr>
<tr>
	<td>顧客ID</td>
	<td>
		<input type="text" name="cus_id" size="40" maxlength="20"
		  value="<%= list.get(0).get("cus_id") %>">
	</td>
</tr>
<tr>
	<td>パスワード</td>
	<td>
		<input type="text" name="cus_pas" size="41" maxlength="20"
		  value="<%= list.get(0).get("cus_pas") %>">
	</td>
</tr>
<tr>
	<td>氏名</td>
	<td>
		<input type="text" name="cus_name" size="40" maxlength="20"
		  value="<%= list.get(0).get("cus_name") %>">
	</td>
</tr>
</table>
	<BR><BR><HR>
	<INPUT TYPE="SUBMIT" VALUE="変更">
	<INPUT TYPE="RESET" VALUE="入力クリア">
</FORM>
</BODY>
</HTML>