<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");%>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>プルダウン入力</title>
  </head>
  <body>
    <h1>プルダウン入力</h1>
    <form action="pulldown_out.jsp" method="post">
      あなたの出身地はどこですか <br>
      <select size="1" name="pre_no">
        <option value="1">岐阜県</option>
        <option value="2">静岡県</option>
        <option value="3">愛知県</option>
        <option value="4">三重県</option>
      </select>
      <br>
      <input type="submit" value="pulldown_outへ">
    </form>
  </body>
</html>
