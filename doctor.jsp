<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eyesight Emporium</title>
<%@include file='head.jsp' %>
<%@include file='loginrestrict.jsp' %>
</head>
<body>
 <!--  <style>
body {
background-image: url("images/banner_img.png");
background-repeat: no-repeat;
background-size: cover;
height: 500px;
width: 500px;
}
</style>-->
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<form method="post">
<table>
<tr>
<Td>
<b>Choose disease</b>
</Td>
<tD>
<select name="cmbcat" class="form-control">
<%
Statement stmt2=null;
Connection con2=null;
ResultSet rs2=null;
Class.forName("org.postgresql.Driver");
Mylib l1=new Mylib();
con2=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt2=con2.createStatement();
rs2=stmt2.executeQuery("select * from tbldisease");
while(rs2.next()){
	%>
	<option value=<%out.println(rs2.getString("did")); %>><%out.println(rs2.getString("dname")); %></option>
	<%
}
rs2.close();
stmt2.close();
con2.close();

%>
</select>
</tD>

<Td>
<input type="submit" name="btnsearchbycat" Value="Search">
</table>

</form>
<%
String qry=null;
if(request.getParameter("btnsearch")!=null){
	String search=request.getParameter("txtsearch");
 qry="select * from tbldoctors where doname like '%"+search+"%'";
}
else if(request.getParameter("btnsearchbycat")!=null){
	String search=request.getParameter("cmbcat");
	 qry="select * from tbldoctors where did = '"+search+"'";
}
else{
 qry="select * from tbldoctors";
}
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery(qry);
%>
<div class="row">
<%
while(rs.next()){
	%>
	<div class="col-md-4">
	<table class="table">
	<tr>
	<td>
	doctor Name
	</td>
	<tD>
	<%out.println(rs.getString("doname")); %>
	</tD>
	</tr>
	<tr>
	<td>
	doctor fee
	</td>
	<tD>
	₹<strike><%out.println(rs.getString("dfee")); %></strike>/-
	</tD>
	
	</tr>
	<tr>
	<td>
	address
	</td>
	<tD>
	<%out.println(rs.getString("daddress")); %>
	</tD>
	</tr>
	</table></div>
	
	<%
}
rs.close();
stmt.close();
con.close();


%>
</div>
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