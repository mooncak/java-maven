<%@ page language="java" %>
<html>
  <head><title>Test.Web</title></head>
  <body>
    <h1><font color="blue">wu'li'ying12345</font></h1>
    <table align="centre" border="1">
      <tr>
        <td>Session ID</td>
    <% session.setAttribute("abc","abc"); %>
        <td><%= session.getId() %></td>
      </tr>
      <tr>
        <td>Created on</td>
        <td><%= session.getCreationTime() %></td>
     </tr>
    </table>
  </body>
</html>

