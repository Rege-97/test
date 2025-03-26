<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
}

table {
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
	width: 550px;
}

table th {
	background-color: skyblue;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>검색한 회원 내역</h2>
			<table>
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<%
					String name = request.getParameter("name");
					Class.forName("oracle.jdbc.driver.OracleDriver");
					String url = "jdbc:oracle:thin:@localhost:1521:xe";
					String user = "mydb";
					String pwd = "1234";
					Connection conn = DriverManager.getConnection(url, user, pwd);
					String sql = "Select * from phonebook where name=? order by idx desc";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, name);
					ResultSet rs = ps.executeQuery();
					if (rs.next()) {
						do {
					%>
					<tr>
						<td><%=rs.getInt("idx")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("tel")%></td>
						<td><%=rs.getString("addr")%></td>
					</tr>
					<%
					} while (rs.next());
					} else {
					%>
					<tr>
						<td colspan="4" align="center">등록된 회원이 없습니다.</td>
					</tr>
					<%
					}
					rs.close();
					ps.close();
					conn.close();
					%>
				</tbody>
			</table>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>