<%
if(session.getAttribute("email")==null){
	%>
	<script>window.location.href="login.jsp";</script>
	<%
}
%>