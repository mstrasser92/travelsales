<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Registration</title>
</head>
<body>

<% if(errorMessage != null && !errorMessage.equalsIgnoreCase("")){ %>
<p class="errorMessage">ERROR: <%=errorMessage%></p>
<% } %>

<div id="wrapper">
  <header>
    <a href="index.jsp" title="Travel Sales">
      <div id="logo">
        <img src="img/logo.png" alt="Logo" />
      </div>
    </a>
    <nav>
      <ul>
        <li>
          <a href="#" title="Help">
            <img src="img/help_btn.png" alt="Help" />
          </a>
        </li>
      </ul>
    </nav>
  </header>
  <div id="content">
    <div id="register">
      
      <a href="Login" title="Login">
        <img src="img/login_tsr.png" alt="Logo" />
      </a>
      <form method="post">
        <p>
          <label>Username</label>
          <input name="username" type="text" maxlength="50" />
        </p>
        <p>
          <label>Password</label>
          <input name="password1" type="password" maxlength="50" />
        </p>
        <p>
          <label>Repeat Password</label>
          <input name="password2" type="password" maxlength="50" />
        </p>
        <p>
          <label>E-Mail</label>
          <input name="mail" type="text" maxlength="100" />
        </p>
        <input type="submit" value="">
      </form>
    </div>
  </div>
  <footer>
    
  </footer>
</div>
</body>
</html>