<%@page import="org.ist.OAD14.User.CreatorUser"%>
<%@page import="org.ist.OAD14.User.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%
User users = (User)request.getAttribute("users");
%>
<%
 String errorMessage = (String)request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <link rel="stylesheet" type="text/css" href="Stylesheets/layout.css" />
  <link href="Stylesheets/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="js/jquery.ui.position.js" type="text/javascript"></script>
  <script src="js/jquery.contextMenu.js" type="text/javascript"></script>
  <script src="js/main.js" type="text/javascript"></script>
  
  <title>User</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
  

</body>
</html> 


