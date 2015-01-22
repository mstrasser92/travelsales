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
  
<title>Login</title>
</head>
<body>

<% if(errorMessage != null && !errorMessage.equalsIgnoreCase("")){ %>
<p class="errorMessage">ERROR: <%=errorMessage%></p>
<% } %>

<div id="sendPassword" class="overlay">
	<p>Alert:</p>
	<p style="font-size: 12;">Your password will be sent to you in<br> plaintext!
	<br>Are you sure? 
	<br>Then enter your Username and click send! </p>
	<form name="sendpwform" action="SendEmail" method="get">
		<input id="username" name="username" type="text">
		<input type="hidden" name="action" value="pwsend"> 
    	<a href="javascript:void(0)" onclick="sendpwform.submit(); document.getElementById('sendPassword').style.display = 'none'; document.getElementById('username').value = ''">
    	<img style="margin-top: 10px; margin-left: 10px" src="img/send_btn.png" alt="Send" height="29" width="171"/></a>
	    	
    <a href="javascript:void(0)" onclick="document.getElementById('sendPassword').style.display = 'none';document.getElementById('username').value = ''">
		<img style="margin-top: 10px; margin-left: 50px;" src="img/back_btn_small.png" alt="Back" height="29" width="171"/></a>
	</form>
</div>

<form action="Login" method="post">

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
      <div id="login">
        <form action="post">
          <p>
            <label>Username</label>
            <input name="username" type="text" />
          </p>
          <p>
            <label>Password</label>
            <input name="password" type="password" />
          </p>
          <input type="submit" value="">
			
        </form>
        <a href="Register" title="Register">
          <img src="img/register_tsr.png" alt="Logo" />
        </a>
        <br>
        <p>
        <a href="javascript:void(0)" onclick="document.getElementById('sendPassword').style.display = 'inline';">Forgot your password?</a>
        </p>
      </div>
       
    </div>
    <footer>
      
    </footer>
  </div>
</body>
</html>