<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2 {
	text-align: center;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<article>
			<h2>사칙 연산 결과</h2>
			<%
			String num1_s = request.getParameter("num1");
			if (num1_s == null || num1_s.equals("")) {

			}

			int num1 = Integer.parseInt(num1_s);
			String num2_s = request.getParameter("num2");
			int num2 = Integer.parseInt(num2_s);
			String oper_s = request.getParameter("oper");
			char oper = oper_s.charAt(0);
			int result = 0;

			switch (oper) {
			case '+':
				result = num1 + num2;
				break;
			case '-':
				result = num1 - num2;
				break;
			case '*':
				result = num1 * num2;
				break;
			case '/':
				result = num1 / num2;
				break;
			}
			%>

			<h3><%=num1%>
				<%=oper%>
				<%=num2%>
				=
				<%=result%></h3>
		</article>
	</section>

	<%@include file="footer.jsp"%>
</body>
</html>