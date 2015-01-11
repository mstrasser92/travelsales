<%@ page language="java" contentType="text/html; charset=UFT-8"
    pageEncoding="UTF-8"%>
    
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset password</title>
</head>
<body>


<form action="ResetPassword" method="post">

<h3>Reset your password here</h3>

<% if(errorMessage != null && !errorMessage.equalsIgnoreCase("")){ %>
<p class="errorMessage">ERROR: <%=errorMessage%></p>
<% } %>

<table>
<tr>
  <td>Username</td>
  <td><input type="text" name="username" maxlength="50" size="20"> </td>
</tr>

<tr>
  <td>New Password</td>
  <td><input type="password" name="password1" maxlength="50" size="20"> </td>
</tr>

<tr>
  <td>Retype new Password</td>
  <td><input type="password" name="password2" maxlength="50" size="20"> </td>
</tr>

<tr>
  <td><input type="submit" value="Reset Password"> </td>
  <td></td>
</tr>
</table>
</form>
</body>
</html>