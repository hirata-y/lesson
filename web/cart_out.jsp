<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");

  //入力した数量を格納する配列
  String[] syouhin = new String[3];

  //sessionの数量を格納する配列
  String[] syouhin_count = new String[3];

  //変数取得
  String cart_crea = request.getParameter("crea");
  String cart_crea1 = request.getParameter("crea1");
  String cart_crea2 = request.getParameter("crea2");
  String cart_crea3 = request.getParameter("crea3");
  String var1str = request.getParameter("var1");
  String var2str = request.getParameter("var2");
  String var3str = request.getParameter("var3");
  String syouhin1str = request.getParameter("syouhin1");
  String syouhin2str = request.getParameter("syouhin2");
  String syouhin3str = request.getParameter("syouhin3");

  if (var1str == null) {
    syouhin[0] = syouhin1str;
  }
  else if (var1str != null) {
    syouhin[0] = String.valueOf(Integer.parseInt(var1str));
  }

  if (var2str == null) {
    syouhin[1] = syouhin2str;
  }
  else if (var2str != null) {
    syouhin[1] = String.valueOf(Integer.parseInt(var2str));
  }

  if (var3str == null) {
    syouhin[2] = syouhin3str;
  }
  else if (var3str != null) {
    syouhin[2] = String.valueOf(Integer.parseInt(var3str));
  }

  //sessionより数量の取得
  syouhin_count[0] = (String)session.getAttribute("syouhin1");
  syouhin_count[1] = (String)session.getAttribute("syouhin2");
  syouhin_count[2] = (String)session.getAttribute("syouhin3");

  //合計を加算
  int goukei = 0;
  int flg = 0;
  for (int i=0; i<3; i++) {
    if (syouhin[i] != null) {
      if (syouhin_count[i] != null) {
        goukei = Integer.parseInt(syouhin_count[i]);
      }
      goukei = goukei + Integer.parseInt(syouhin[i]);
      if (goukei <= 0) {
        flg = i + 1;
      }
    }
  }

  //セッションにバインド
  if (syouhin[0] != null) {
    session.setAttribute("syouhin1", new Integer(goukei).toString());
  }
  if (syouhin[1] != null) {
    session.setAttribute("syouhin2", new Integer(goukei).toString());
  }
  if (syouhin[2] != null) {
    session.setAttribute("syouhin3", new Integer(goukei).toString());
  }

  if (flg == 1) {
    cart_crea1 = "crea1";
  }
  else if (flg == 2) {
    cart_crea2 = "crea2";
  }
  else if(flg == 3){
    cart_crea3 = "crea3";
  }

  if(cart_crea != null){
    //セッション変数を削除
    session.removeAttribute("syouhin1");
    session.removeAttribute("syouhin2");
    session.removeAttribute("syouhin3");
  }
  if (cart_crea1 != null) {
    session.removeAttribute("syouhin1");
  }
  if (cart_crea2 != null) {
    session.removeAttribute("syouhin2");
  }
  if (cart_crea3 != null) {
    session.removeAttribute("syouhin3");
  }

  //有効期限30秒
  session.setMaxInactiveInterval(30);
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>ショッピングカート</title>
  </head>
  <body>
    <h2>カートの中には以下の商品が入っています</h2>
    <%
      String count1 = (String)session.getAttribute("syouhin1");
      String count2 = (String)session.getAttribute("syouhin2");
      String count3 = (String)session.getAttribute("syouhin3");
    %>
    <%
      if(count1 != null){
    %>
    <table border="1">
      <tr>
        <td rowspan="3">
          <img src="image/bung1.png" height="32px" width="32px">
        </td>
      </tr>
      <tr>
        <td width="80">商品No.</td>
        <td width="80">商品名</td>
        <td width="80">数量</td>
        <td width="80">増減</td>
        <td rowspan="2">
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="crea1" value="crea1">
            <input type="submit" value="空にする">
          </form>
        </td>
      </tr>
      <tr>
        <td width="80">1</td>
        <td>はさみ</td>
        <td><%= count1 %></td>
        <td>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="var1" value="1">
            <input type="submit" value="+">
          </form>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="var1" value="-1">
            <input type="submit" value="-">
          </form>
        </td>
      </tr>
    </table>
    <%
    }
    %>
    <br>
    <%
      if(count2 != null){
    %>
    <table border="1">
      <tr>
        <td rowspan="3">
          <img src="image/bung2.png" height="32px" width="32px">
        </td>
      </tr>
      <tr>
        <td width="80">商品No.</td>
        <td width="80">商品名</td>
        <td width="80">数量</td>
        <td width="80">増減</td>
        <td rowspan="2">
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="crea2" value="crea2">
            <input type="submit" value="空にする">
          </form>
        </td>
      </tr>
      <tr>
        <td width="80">2</td>
        <td>鉛筆</td>
        <td><%= count2 %></td>
        <td>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="var2" value="1">
            <input type="submit" value="+">
          </form>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="var2" value="-1">
            <input type="submit" value="-">
          </form>
        </td>
      </tr>
    </table>
    <%
    }
    %>
    <br>
    <%
      if(count3 != null){
    %>
    <table border="1">
      <tr>
        <td rowspan="3">
          <img src="image/bung3.png" height="32px" width="32px">
        </td>
      </tr>
      <tr>
        <td width="80">商品No.</td>
        <td width="80">商品名</td>
        <td width="80">数量</td>
        <td width="80">増減</td>
        <td rowspan="2">
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="crea3" value="crea3">
            <input type="submit" value="空にする">
          </form>
        </td>
      </tr>
      <tr>
        <td width="80">3</td>
        <td>ノート</td>
        <td><%= count3 %></td>
        <td>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="var3" value="1">
            <input type="submit" value="+">
          </form>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="var3" value="-1">
            <input type="submit" value="-">
          </form>
        </td>
      </tr>
    </table>
    <%
    }
    %>
    <br>
    <%
      if (count1 == null && count2 == null && count3 == null) {
    %>
    <p>カートの中はありません</p>
    <%
    }
    %>
    <table>
      <tr>
        <td>
          <form method="post" action="cart_in.jsp">
            <input type="submit" value="お買い物を続ける">
          </form>
        </td>
        <td>
          <form method="post" action="cart_out.jsp">
            <input type="hidden" name="crea" value="crea">
            <input type="submit" value="カートを空にする">
          </form>
        </td>
      </tr>
    </table>
  </body>
</html>
