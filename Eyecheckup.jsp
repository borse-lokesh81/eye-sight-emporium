<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eyesight Emporium</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<%
if(request.getParameter("btnsave")!=null){
	String ename=request.getParameter("txtname");
	String price=request.getParameter("cmbprice");
	String bookslot=request.getParameter("cmbbook");
	String city=request.getParameter("cmbcity");
	String eaddress=request.getParameter("txtaddress");
	Mylib l1=new Mylib();
	l1.dml("insert into tbleyecheck(ename,eprice,bookslot,city,eaddress,uid)values('"+ename+"','"+price+"','"+bookslot+"','"+city+"','"+eaddress+"','"+session.getAttribute("uid")+"')");
	%>
	<script>
	alert("Thank you!!!Your Eye-Check slot is book");
	window.location.href="welcome.jsp";
	</script>
	<%
}

%>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form method="post" style="background-color:#E6E6FA" >
<style>
form{
display:flex;
flex-direction: column;
gap: 10px;
border: 1px solid #ccc;
border-radius: 10px;
padding: 20px;
width: 600px;
margin: 0 auto;
}
</style>
<table class="table">
<tr>
<td>
Eye-test Name
</td>
<td>
<input type="text" name="txtname"  required class="form-control">
</td>
</tr>
<tr>
<td>
Price
</td>
	<td>
	<select name="cmbprice" class="form-control">
	<option value="Free">Free</option>
	</select>
	</td>
	</tr>
<tr>
<td>
book slot
</td>
<td>
	<select name="cmbbook" class="form-control">
	<option value="9am-11am">9am-11am</option>
	<option value="12pm-2pm">12am-2am</option>
	<option value="4pm-6pm">4pm-6pm</option>
	</select>
	</td>
	</tr>
<tr>
<td>
city
</td>
<td>
<select name="cmbcity" class="form-control">
	<option value="delhi">Delhi</option>
	<option value="Mumbai">Mumbai</option>
	<option value="Pune">Pune</option>
	<option value="Hyderabad">Hyderabad</option>
	<option value="Banglore">Banglore</option>
</td>
</tr>
<tr>
<td>
Address
</td>
<td>
<input type="text" name="txtaddress"  required class="form-control">
</td>
</tr>
<tr>
<td colspan=2 align="center" >
<input type="submit" name="btnsave" value="Submit" class="btn btn-success">
</td>
</tr>
</table>
</form>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file='footer.jsp' %>
</body>
</html>