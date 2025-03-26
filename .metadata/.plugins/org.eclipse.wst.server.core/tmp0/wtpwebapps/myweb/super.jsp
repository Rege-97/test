<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>super.jsp</h1>
	<h3 style="color: blue">super.jsp에서 출력한 문장A</h3>
	<%
	String str = "java";
	String str3 = request.getParameter("test");
	%>
	<h3 style="color: blue">
		super.jsp에서 출력한 str의 값 :
		<%=str%></h3>

	<h3 style="color: blue">
		super.jsp에서 test 파라미터 값 :
		<%=str3%></h3>

	<jsp:include page="sub.jsp">
		<jsp:param value="<%=str%>" name="str" />
	</jsp:include>

	<h3 style="color: blue">super.jsp에서 출력한 문장B</h3>
</body>
</html>