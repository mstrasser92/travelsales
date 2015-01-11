<%@page import="org.ist.OAD14.User.CreatorUser"%>
<%@page import="org.ist.OAD14.User.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%
User user = (User)request.getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>TravelSales</title>
</head>
<body>


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
<p>
Welcome back, <%=user.getUsername() %> - enjoy TravelSales!
</p>


<form name="form1" method="post">
    <input type="hidden" name="buttonName">
    <input type="button" value="Play Game" onclick="button1()"> <br>
	<input type="button" value="Create Game" onclick="button2()"> <br>
	<input type="button" value="Log out" onclick="button3()"> <br>
</form>

<SCRIPT LANGUAGE="JavaScript">
function button1()
{
    document.form1.buttonName.value = "play game"
    form1.submit()
}    
function button2()
{
    document.form1.buttonName.value = "create game"
    form1.submit()
}
function button3()
{
    document.form1.buttonName.value = "logout"
    form1.submit()
}
</SCRIPT>

    </div>
  </div>
  <footer>
    
  </footer>
</div>


</body>
</html>
