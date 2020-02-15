<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String logout = request.getParameter("logout");
  if(logout != null){
    //セッション変数を削除
    session.removeAttribute("login_name");
  }
  String session_name = (String)session.getAttribute("login_name");
  if(session_name != null){
    response.sendRedirect("syouhin_main.jsp");
  }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>ログインページ</title>
  </head>
  <body>
    <form method="post" action="syouhin_index_action.jsp">
      <table border="1">
        <tr>
          <td>会員ID</td>
          <td>
            <input type="text" name="id" size="50" maxlength="20">
          </td>
        </tr>
          <tr>
            <td>パスワード</td>
            <td>
              <input type="text" name="pas" size="50" maxlength="20">
            </td>
          </tr>
          <tr>
            <td>
              <input type="submit" value="ログイン">
            </td>
          </tr>
      </table>
    </form>
  </body>
</html>
