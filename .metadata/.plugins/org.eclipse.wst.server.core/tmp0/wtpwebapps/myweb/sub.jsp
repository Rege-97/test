<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sub.jsp</h1>
	<h3 style="color: red">sub.jsp에서 출력한 문장A</h3>
	<%
	String str2 = "JSP";
	String str = request.getParameter("str");
	String str3 = request.getParameter("test");
	%>
	<h3 style="color: red">
		sub.jsp에서 출력한 str2의 값 :
		<%=str2%></h3>

	<h3 style="color: green">
		super에서 가져온 str :
		<%=str%></h3>

	<h3 style="color: red">
		sub.jsp의 test파라미터 값 :
		<%=str3%></h3>

	<h3 style="color: red">sub.jsp에서 출력한 문장B</h3>

</body>
</html>