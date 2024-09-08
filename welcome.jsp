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
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<form method="post">
<table class="table">
<Tr>
<Td>
Search
</Td>
<td>
<input type="text" name="txtsearch" class="form-control">
</td>

<td>
<input type="submit" name="btnsearch" value="Search">
</td>
</tr>
</table>

</form>
<form method="post">
<table>
<tr>
<Td>
<b>Choose Category</b>
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
rs2=stmt2.executeQuery("select * from tblcategory");
while(rs2.next()){
	%>
	<option value=<%out.println(rs2.getString("cid")); %>><%out.println(rs2.getString("cname")); %></option>
	<%
}
rs2.close();
stmt2.close();
con2.close();

%>
</select>
</tD>

<Td>
&nbsp&nbsp&nbsp<input type="submit" name="btnsearchbycat" Value="Search by category" >
</table>

</form>
<%
String qry=null;
if(request.getParameter("btnsearch")!=null){
	String search=request.getParameter("txtsearch");
 qry="select * from tblproduct where pname like '%"+search+"%'";
}
else if(request.getParameter("btnsearchbycat")!=null){
	String search=request.getParameter("cmbcat");
	 qry="select * from tblproduct where cid = '"+search+"'";
}
else{
 qry="select * from tblproduct";
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
	
	<tD colspan=2 align=center>
	<img height=200px  src="admin/images/<%out.println(rs.getString("pimage")); %>">
	</tD>
	</tr>
	<tr>
	<td>
	Product Name
	</td>
	<tD>
	<%out.println(rs.getString("pname")); %>
	</tD>
	</tr>
	<tr>
	<td>
	Product Price
	</td>
	<tD>
	₹<strike><%out.println(rs.getString("pprice")); %></strike>/-
	</tD>
	
	</tr>
	<tr>
	<td>
	Product Discount Price
	</td>
	<tD>
	₹<%out.println(rs.getString("pdprice")); %>/-
	</tD>
	</tr>
	<tR>
	<tD>
	<a href="viewdetails.jsp?id=<%out.println(rs.getString("pid"));%>"><input type="button" class="btn btn-success" value="View Details"></a>
	</tD>
	</tR>
	</table></div>
	
	<%
}
rs.close();
stmt.close();
con.close();


%>
</div>
<%@include file='footer.jsp' %>
</body>
</html>