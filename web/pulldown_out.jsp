<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
  String pre_noStr = request.getParameter("pre_no");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>プルダウン表示</title>
  </head>
  <body>
    <h1>プルダウン表示</h1>
    <form name="form_pulldown" action="pulldown_in.jsp" method="post">
      あなたの出身地はここですね <br>
      <select size="1" name="pre_no">
        <option value="1">岐阜県</option>
        <option value="2">静岡県</option>
        <option value="3">愛知県</option>
        <option value="4">三重県</option>
      </select>
      <script type="text/javascript">
        document.form_pulldown.pre_no.selectedIndex = <%= pre_noStr %> - 1;
      </script>
      <br>
      <input type="submit" value="pulldown_inへ">
    </form>
  </body>
</html>
