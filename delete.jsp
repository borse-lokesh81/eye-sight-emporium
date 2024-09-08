<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Mylib l1=new Mylib();
l1.dml("delete from tblcart where cartid='"+request.getParameter("id")+"'");

%>
<script>
window.location.href="viewcart.jsp";
</script>
</body>
</html>