<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
  String COMPMSG = null;
  String COMPPRO = null;
  boolean flg = true;

  //ログインページからID,PASSの取得
  String cus_id = request.getParameter("id");
  String cus_pas = request.getParameter("pas");

  if (cus_id != "" && cus_pas != "") {
    try{
      // JDBCドライバのロード
  		Class.forName(DRIVER).newInstance();

  		// Connectionオブジェクトの作成
  		con = DriverManager.getConnection(URL,USER,PASSWORD);

  		//Statementオブジェクトの作成
  		stmt = con.createStatement();

      //SQLステートメントの作成（選択クエリ）
      SQL = new StringBuffer();
      SQL.append("select cus_name from cus_tbl ");
      SQL.append("where cus_id = '" + cus_id + "' and cus_pas = '" + cus_pas + "'");

      //SQL文の発行（選択クエリ）
      rs = stmt.executeQuery(SQL.toString());

        //読み込み確認
      if (rs.next() == true) {
        //有効期限30秒
        session.setMaxInactiveInterval(30);

        //セッションにバインド
        session.setAttribute("login_name" , rs.getString("cus_name"));
        //メインページへ遷移
        response.sendRedirect("syouhin_main.jsp");
      }else{
        COMPMSG = "該当レコードは存在しません";
      }
    } //tryブロック終了
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
  }else{
    COMPMSG = "未入力の項目があります";
  }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>認証処理</title>
  </head>
  <body>
    <% if(ERMSG != null){ %>
      予期せぬエラーが発生しました<br>
      <%= ERMSG %>
    <% }else{ %>
      <%= COMPMSG %>
    <% } %>
    <form method="post" action="syouhin_index.jsp">
      <input type="submit" value="戻る">
    </form>
  </body>
</html>
