<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dao.*,excel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="registerValidation.js"language="javascript"></script>
<link rel="stylesheet" type="text/css" href="one.css" />
<link rel="stylesheet" href="tablelayout.css">
<link href="style.css" rel="stylesheet" type="text/css" />

<%if(session.getAttribute("user")==null){
	String message="your session expired , please login again";
	request.setAttribute("msg", message);
getServletContext().getRequestDispatcher("/login.jsp").include(request, response);	
}else{%>

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
      <li id="active"><a href="adminhome.jsp" id="current">Home</a> </li>
     <li><a href="logout.jsp">Logout</a></li>
 
    </ul>
  </div>
<center></center>
 </div>
 <center>
 <table>
<tr><td> <form action="adminhome.jsp">Faculty:<input type="text" name="fid" required>
<input type="submit" value="search"></form>
</td>
<td> <form action="adminhome.jsp">Student:<input type="text" name="sid" required>
<input type="submit" value="search"></form>
</td></tr>
<tr>
<td><form action="adminhome.jsp">
<input type="hidden" name="fv" value="fv">
<input type="submit" value="get All Details">
</form><form action="adminhome.jsp">
<input type="hidden" name="df" value="df">
<input type="submit" value="Download in Excel">
</form>
</td>
<td><form action="adminhome.jsp">
<input type="hidden" name="sv" value="fs">
<input type="submit" value="get All Details">
</form><form action="adminhome.jsp">
<input type="hidden" name="sf" value="sf">
<input type="submit" value="Download in Excel">
</form>
</td>
</tr>
 </table>
 </center>
 <center>
 <%
 
 if(request.getParameter("fid")!=null){
 Connection  con=DBcon.getCon();
 PreparedStatement ps=con.prepareStatement("select * from faculty where facultyid=?");
 ps.setString(1,request.getParameter("fid"));
 ResultSet rs=ps.executeQuery();
 if(rs.next()){
	 %>
	 <table border='1' >
	 <tr style="color: #000000">
	 <td>Fname</td>
	 <td>Faculty Id</td>
	 <td>Father Name</td>
	 <td>Adress</td>
	 <td>>Phone no</td>
	 <td>Qualification</td>
	 <td>Teach Subject</td>
	 <td>Branch</td>
	 <td>Department</td>
	 <td>Gender</td>
	 </tr>
	 <tr style="color: blue">
	 <td><%=rs.getString(1) %></td>
	 <td><%=rs.getString(2) %></td>
	 <td><%=rs.getString(3) %></td>
	 <td><%=rs.getString(4) %></td>
	 <td><%=rs.getString(5) %></td>
	 <td><%=rs.getString(6) %></td>
	 <td><%=rs.getString(7) %></td>
	 <td><%=rs.getString(8) %></td>
	 <td><%=rs.getString(9) %></td>
	 <td><%=rs.getString(10) %></td>
		 </tr>
	 </table>
	 <%
 }else{
	 out.println("<font color='red'>there is no faculty available with faculty id</font>");
 }
 }
 if(request.getParameter("sid")!=null){
 Connection  con=DBcon.getCon();
 PreparedStatement ps=con.prepareStatement("select * from student where stid=?");
 ps.setString(1,request.getParameter("sid"));
 ResultSet rs=ps.executeQuery();
 if(rs.next()){%>
	 <table border='1' >
	 <tr style="color: #000000">
	 <td>name</td>
	 <td>Id</td>
	 <td>Father Name</td>
	 <td>Adress</td>
	 <td>>Phone no</td>
	 <td>Branch</td>
	 <td>dob</td>
	 <td>section</td>
	 <td>passing year</td>
	 <td>Gender</td>
	 </tr>
	 <tr style="color: blue">
	 <td><%=rs.getString(1) %></td>
	 <td><%=rs.getString(2) %></td>
	 <td><%=rs.getString(3) %></td>
	 <td><%=rs.getString(4) %></td>
	 <td><%=rs.getString(5) %></td>
	 <td><%=rs.getString(6) %></td>
	 <td><%=rs.getString(7) %></td>
	 <td><%=rs.getString(8) %></td>
	 <td><%=rs.getString(9) %></td>
	 <td><%=rs.getString(10) %></td>
		 </tr>
	 </table><%
 }else{
	 out.println("<font color='red'>there is no student exist with this student id</font>");
 }
 }
 if(request.getParameter("fv")!=null){
	 Connection  con=DBcon.getCon();
	 PreparedStatement ps=con.prepareStatement("select * from faculty");
	 ResultSet rs=ps.executeQuery();
	%>		 <table border='1' >
		 <tr style="color: #000000">
		 <td>Fname</td>
		 <td>Faculty Id</td>
		 <td>Father Name</td>
		 <td>Adress</td>
		 <td>>Phone no</td>
		 <td>Qualification</td>
		 <td>Teach Subject</td>
		 <td>Branch</td>
		 <td>Department</td>
		 <td>Gender</td>
		 </tr><%
	 while(rs.next()){
		 %>

		 <tr style="color: blue">
		 <td><%=rs.getString(1) %></td>
		 <td><%=rs.getString(2) %></td>
		 <td><%=rs.getString(3) %></td>
		 <td><%=rs.getString(4) %></td>
		 <td><%=rs.getString(5) %></td>
		 <td><%=rs.getString(6) %></td>
		 <td><%=rs.getString(7) %></td>
		 <td><%=rs.getString(8) %></td>
		 <td><%=rs.getString(9) %></td>
		 <td><%=rs.getString(10) %></td>
			 </tr>
		 
		 <%
	 }%>
	 </table>
	 <% }
 
 if(request.getParameter("sv")!=null){
 Connection  con=DBcon.getCon();
 PreparedStatement ps=con.prepareStatement("select * from student");
 ResultSet rs=ps.executeQuery();%>
 <table border='1' >
 <tr style="color: #000000">
 <td>name</td>
 <td>Id</td>
 <td>Father Name</td>
 <td>Adress</td>
 <td>>Phone no</td>
 <td>Branch</td>
 <td>dob</td>
 <td>section</td>
 <td>passing year</td>
 <td>Gender</td>
 </tr><%
 while(rs.next()){%>

	 <tr style="color: blue">
	 <td><%=rs.getString(1) %></td>
	 <td><%=rs.getString(2) %></td>
	 <td><%=rs.getString(3) %></td>
	 <td><%=rs.getString(4) %></td>
	 <td><%=rs.getString(5) %></td>
	 <td><%=rs.getString(6) %></td>
	 <td><%=rs.getString(7) %></td>
	 <td><%=rs.getString(8) %></td>
	 <td><%=rs.getString(9) %></td>
	 <td><%=rs.getString(10) %></td>
		 </tr>
	 <%
 }%></table><%
 }
 if(request.getParameter("df")!=null){
	 Excel.faculty();
 }
 if(request.getParameter("sf")!=null){
	 CExcel.faculty();
 }
%>
 
 
 </center>
 
 
<div id="container">
  <div id="top"><h1>&nbsp;</h1><br>

  <center>
    <h1>Developed by &ndash;Ranjith kumar</h1></center>
    <div class="search"></div>
  </div></div>
  <%}%>
</body>
</html>