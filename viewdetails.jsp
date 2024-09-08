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
<style>

        body {
 
            font-family: Arial, sans-serif;
 
            background-color: #f5f5f5;
 
            margin: 0;
 
            padding: 0;
 
        }
 
        .container {
 
            max-width: 1000px;
 
            margin: 0 auto;
 
            padding: 20px;
 
        }
 
        .product {
 
            background-color: #fff;
 
            padding: 70px;
 
            border-radius: 20px;
 
            box-shadow: 0 0 40px rgba(100, 100, 100, 100);
 
        }
 
        .product img {
 
            max-width: 50%;
 
            height: auto;
 
            border-radius: 8px;
 
        }
 
        .product table {
 
            width: 100%;
 
            border-collapse: collapse;
 
        }
 
        .product table td {
 
            padding: 10px 0;
 
            border-bottom: 1px solid #ddd;
 
        }
 
        .product table td:first-child {
 
            font-weight: bold;
 
            width: 40%;
 
        }
 
        .product form {
 
            margin-top: 20px;
 
        }
 
        .product form select {
 
            width: 100px;
 
            padding: 8px;
 
            border: 1px solid #ddd;
 
            border-radius: 4px;
 
            background-color: #f9f9f9;
 
        }
 
 
    </style>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<div class="container">

<%
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
Mylib l1=new Mylib();
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblproduct where pid="+request.getParameter("id"));
%>
<div class="product">
<%
while(rs.next()){
	%>
	<div class="col-md-10">
	<table class="table" >
	<tr>
	
	<tD colspan=2 align=center>
	<img height=200px src="admin/images/<%out.println(rs.getString("pimage")); %>">
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
	<tr>
	<td>
	Product Description
	</td>
	<tD>
	<%out.println(rs.getString("pdesc")); %>
	</tD>
	</tr>
    <form method="post">
	<tr>
	<tD>
	Quantity
	</tD>
	<td>
	<select name="cmbqty" class="form-control">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	</select>
	</td>
	</tr>
	<tr>
	<tD>
	Select Size
	</tD>
	<td>
	<select name="cmbsize" class="form-control">
	<option value="Small">Small</option>
	<option value="Medium">Medium</option>
	<option value="Large">Large</option>
	</td>
	</tr>
	<tr>
	<tD>
	select Right Eye Power
	</tD>
	<td>
	<input type="text" name="txtreye"  required class="form-control">
	</td>
	</tr>
	<tr>
	<tD>
	select Left Eye Power
	</tD>
	<td>
	<input type="text" name="txtleye" required class="form-control">
	</td>
	</tr>
	<tr>
	<td colspan=40 align=center>
	<input type="submit" name="btnaddcart" value="Add to &#128722"  class="btn btn-warning">
	</td>
	</tr>	
	</form>
	</table></div>
	
	<%
}
rs.close();
stmt.close();
con.close();

if(request.getParameter("btnaddcart")!=null){
	String size=request.getParameter("cmbsize");
	int qty=Integer.parseInt(request.getParameter("cmbqty"));
	int reye=Integer.parseInt(request.getParameter("txtreye"));
	int leye=Integer.parseInt(request.getParameter("txtleye"));
	Statement stmt1=null;
	Connection con1=null;
	ResultSet rs1=null;
	Class.forName("org.postgresql.Driver");
	con1=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
	stmt1=con1.createStatement();
	rs1=stmt1.executeQuery("select * from tblproduct where pid="+request.getParameter("id"));
	
	if(rs1.next()){
		if(rs1.getInt("pstock")>=qty){
			l1.dml("insert into tblcart(uid,pid,qty,reye,leye,size,status) values('"+session.getAttribute("uid")+"','"+request.getParameter("id")+"','"+qty+"','"+reye+"','"+leye+"','"+size+"','0')");
			int total=rs1.getInt("pstock")-qty;
			l1.dml("update tblproduct set pstock='"+total+"' where pid='"+request.getParameter("id")+"'");
			%>
			<script>
			alert("Added to Cart");
			window.location.href="welcome.jsp";
			</script>
			<%
		}
		else{
			%>
			<script>
			alert("Out Of Stock");
			</script>
			<%
		}
	}
	rs.close();
	stmt.close();
	con.close();

	
	
}
%>
</div>

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file='footer.jsp' %>
</body>
</html>