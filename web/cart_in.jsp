<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>ショッピングカート</title>
  </head>
  <body>
    <h1>商品一覧</h1>
    <form action="cart_out.jsp" method="post">
      <table border="1">
        <tr>
          <td rowspan="4">
            <img src="image/bung1.png" height="64px" width="64px">
          </td>
        </tr>
        <tr>
          <td>商品No.</td><td width="100">はさみ</td>
        </tr>
        <tr>
          <td>数量</td>
          <td width="100">
            <select name="syouhin1">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><input type="submit" value="カートに入れる"></td>
        </tr>
      </table>
    </form>
    <br>

    <form action="cart_out.jsp" method="post">
      <table border="1">
        <tr>
          <td rowspan="4">
            <img src="image/bung2.png" height="64px" width="64px">
          </td>
        </tr>
        <tr>
          <td>商品No.</td><td width="100">鉛筆</td>
        </tr>
        <tr>
          <td>数量</td>
          <td width="100">
            <select name="syouhin2">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><input type="submit" value="カートに入れる"></td>
        </tr>
      </table>
    </form>
    <br>

    <form action="cart_out.jsp" method="post">
      <table border="1">
        <tr>
          <td rowspan="4">
            <img src="image/bung3.png" height="64px" width="64px">
          </td>
        </tr>
        <tr>
          <td>商品No.</td><td width="100">ノート</td>
        </tr>
        <tr>
          <td>数量</td>
          <td width="100">
            <select name="syouhin3">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><input type="submit" value="カートに入れる"></td>
        </tr>
      </table>
    </form>
    <br>
      <form method="post" action="cart_out.jsp">
        <input type="submit" value="カートの中を見る">
      </form>
  </body>
</html>
