<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<form class="my-form" method="post" style="background-color:#E6E6FA">
<table class="table">
<Tr>
<td>
	flatno
	</td>
	<td>
	<input type="text" name="txtflatno" class="form-control">
	</td>
	</Tr>
	<Tr>
<td>
	Building Name
	</td>
	<td>
	<input type="text" name="txtbuildname" class="form-control">
	</td>
	</Tr>
<tr>
<tD>
Nearby
</tD>
<td>
<textarea name="txtnearby" class="form-control"></textarea>

</td>
</tr>
<Tr>
<td>
	Pincode
	</td>
	<td>
	<input type="text" name="txtpincode" class="form-control">
	</td>
	</Tr>
<tR>
<tD>
<input type="submit" name="btnaddaddress" value="Add Address" class="btn btn-success">
</tD>
</tR>
</table>
</form>
<style>
.my-form{
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
<%
if(request.getParameter("btnaddaddress")!=null){
	String fno=request.getParameter("txtflatno");
	String building=request.getParameter("txtbuildname");
	String nearby=request.getParameter("txtnearby");
	String pincode=request.getParameter("txtpincode");
	Mylib l1=new Mylib();
	l1.dml("insert into tbladdress(flatno,buildname,nearby,pincode,uid)values('"+fno+"','"+building+"','"+nearby+"','"+pincode+"','"+session.getAttribute("uid")+"')");
	%>
	<script>
	alert("Address Added Successfully");
	window.location.href="address.jsp";
	</script>
	<%
}
%>
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