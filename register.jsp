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
<form action="RegisterServlet" method="post" name="form1" onsubmit="return formValidation()">
<h4>${msg}</h4>
<table class="tablelayout curve"><caption>Faculty Register</caption><br>
<tr><td><label><strong>Faculty name : </strong></label></td><td><input type="text" name="fname" placeholder="first name"><br><br>
</td></tr>
<tr><td><label><strong>Faculty ID : </strong></label></td><td><input type="text" name="fid" placeholder="faculty id"><br><br>
</td></tr>
<tr><td><label><strong>Father name : </strong></label></td><td><input type="text" name="fathername" placeholder="father name"><br><br>
</td></tr><tr><td><label><strong>Phone no : </strong></label></td><td><input type="text" name="phno" pattern="[0-9]{1,10}" placeholder="ph.no"><br><br>
</td></tr><tr><td><label><strong>Address : </strong></label></td><td><input type="text" name="address" placeholder="address"><br><br>
</td></tr><tr><td><label><strong>Gender : </strong></label></td><td><input type="radio" name="gender" value="male" checked="checked">male &emsp; 
<input type="radio" name="gender" value="female">female<br><br>

</td></tr>
<tr><td><label><strong>Qualification : </strong></label></td><td>
<select name="q">
<option value="btech">BTECH</option>
<option value="mtech">MTECH</option>
<option  value="phd">PHD</option>
<option value="mpharm">MPHARM</option>
</select>
<br><br></td></tr>
<tr><td><label><strong>Teach Subject : </strong></label></td><td><input type="text" name="ts" placeholder="teach subject"><br><br>
</td></tr>
<tr><td><label><strong>Branch : </strong></label></td><td><input type="text" name="branch" placeholder="branch"><br><br>
</td></tr>
<tr><td><label><strong>Department : </strong></label></td><td><input type="text" name="department" placeholder="department"><br><br>
</td></tr>

<tr><td></td><td><input type="submit" value=" register "> <input type="reset" value=" cancel "></td></tr></table>
</form></center>
<div id="container">
  <div id="top"><h1>&nbsp;</h1><br>
  
  <center>
    <h1>Developed by &ndash;Ranjith kumar</h1></center>
    <div class="search"></div>
  </div>
</body>
</html>