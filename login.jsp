<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="registerValidation.js"language="javascript"></script>
<link rel="stylesheet" type="text/css" href="one.css" />
<link rel="stylesheet" href="tablelayout.css">
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body onload="document.form1.fname.focus()">
<div id="container">
  <div id="top"><h1>&nbsp;</h1><br>
  
  <center>
    <h1>E maintance of &ndash; Department cell</h1></center>
    <div class="search"></div>
  </div>
  <div id="navcontainer">
    <ul id="navlist">
      <li id="active"><a href="login.jsp" id="current">Admin Login</a> </li>
     <li><a href="register.jsp">Faculty Registration</a></li>
     <li><a href="sregister.jsp">Student Registration</a></li>
    </ul>
  </div>
<center>
 </div>
  <form action="LoginServlet" method="post"name="form1">
<center>

<table class="tablelayout curve"><caption>Admin Log In</caption><tr><td><strong><label>User name :</label></strong></td><td><input type="text" name="usename" placeholder="enter user name"></td></tr>
<tr><td><strong><label>Password :</label></strong></td><td><input type="password" name="password" placeholder="password"></td></tr>
<tr><td></td><td><input type="submit" value=" login ">
<input type="reset" value=" refresh " ></td></tr></table>
<h4>${msg}</h4><br>
</center></form></center>
<div id="container">
  <div id="top"><h1>&nbsp;</h1><br>
  
  <center>
    <h1>Developed by &ndash;Ranjith kumar</h1></center>
    <div class="search"></div>
  </div>
</body>
</html>