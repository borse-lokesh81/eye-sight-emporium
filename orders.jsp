<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eyesight Emporium</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>

<table class="table">
<tr>
<TD>
Product Id
</TD>
<td>
Product Name
</td>
<Td>
Product Price
</Td>
<tD>
Quantity
</tD>
<td>
Right eye power
</td>
<td>
left eye power
</td>
<td>
Size
</td>
<td>
Total
</td>
<td>
Status
</td>
</tr>

<%
try{
	Double totalamt=0.0;
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	Mylib l1=new Mylib();
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tblcart,tblproduct where tblcart.pid=tblproduct.pid and tblcart.uid="+session.getAttribute("uid")+" and status>=1");
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("pid"));%></tD>
		<tD><%out.println(rs.getString("pname"));%></tD>
		<tD><%out.println(rs.getString("pdprice"));%></tD>
		<tD><%out.println(rs.getString("qty"));%></tD>
		<tD><%out.println(rs.getString("reye"));%></tD>
		<tD><%out.println(rs.getString("leye"));%></tD>
		<tD><%out.println(rs.getString("size"));%></tD>
		
		
		<td>
		<%
		Double d1=Double.parseDouble(rs.getString("pdprice"));
		Double d2=Double.parseDouble(rs.getString("qty"));
		out.println(d1*d2);
		totalamt=totalamt+(d1*d2);
		%>
		</td>
		<tD><%if(rs.getInt("status")==2){
			out.println("Dispatched");
			}
		else if(rs.getInt("status")==3){
			out.println("Arriving Soon");
			}else if(rs.getInt("status")==4){
				out.println("Arriving Today");
				}else if(rs.getInt("status")==5){
					out.println("Delivered");
				}
				else{
					out.println("Canceled");
				}
			
			
			%></tD>
		
		
		</tr>
		
		<%
		
	}
	%>
	<tR>
	<tD>
	Total
	</tD>
	<td>
	<% out.println(totalamt+""); %>
	</td>
	</tR>
	<tr>
	<td>
</td>
	</tr>
	<%

}
catch(Exception ex){
	
}

%>

</table>
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