<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp로 만든 구구단</h1>
	<table border="1" cellspacing="0" width="900" height="300">
		<%
		for (int i = 2; i <= 9; i++) {
			out.println("<tr align ='center'>");
			out.println("<td width='50'><b>" + i + "단</b></td>");
			for (int j = 1; j <= 9; j++) {
				out.println("<td>" + i + " * " + j + " = " + (i * j) + "</td>");
			}
			out.println("</tr>");
		}
		%>
	</table>
	<hr>
	<table border="1" cellspacing="0" width="900" height="300">
		<%for(int i=1;i<=9;i++){ %>
		<tr align ="center">
			<%for(int j=2;j<=9;j++){ %>
			<td><%=i %> * <%=j %> = <%=i*j %></td>
			<%} %>
		</tr>
		<%} %>
	</table>
</body>
</html>