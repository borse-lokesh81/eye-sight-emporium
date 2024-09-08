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
<button class="btn btn-primary"  type="button"><a href="addaddress.jsp">Add Address</a></button>
<table class="table">
<tr>
<TD>
Address
</TD>

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
	rs=stmt.executeQuery("select * from tbladdress where uid="+session.getAttribute("uid"));
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("flatno")+","+rs.getString("buildname")+","+rs.getString("nearby")+","+rs.getString("pincode"));%></tD>
		<td><a href="bill.jsp?id=<%out.println(rs.getString("addressid"));%>">Choose address</a></td>
		</tr>
		
		<%
		
	}
	%>
	</table>
	<%

}
catch(Exception ex){
	
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