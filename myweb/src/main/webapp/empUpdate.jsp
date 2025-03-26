<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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

fieldset {
	width: 400px;
	margin: 0px auto;
}

table {
	margin: 0px auto;
}
</style>
</head>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}
int idx = Integer.parseInt(idx_s);

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "mydb";
String pwd = "1234";
Connection conn = DriverManager.getConnection(url, user, pwd);

String sql = "Select * from employee where idx=?";
PreparedStatement ps = conn.prepareStatement(sql);
String name = "";
String email = "";
String dept = "";
ps.setInt(1, idx);
ResultSet rs = ps.executeQuery();

if (!rs.next()) {
%>
<script>
	window.alert('잘못된 접근 또는 삭제된 사원입니다.');
	location.href = 'emp.jsp';
</script>
<%
return;
}
%>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<article>
			<form name="empUpdate" action="empUpdate_ok.jsp">
				<fieldset>
					<legend><%=idx_s%>사번의 사원 정보수정
					</legend>
					<table>
						<tr>
							<th>사원 번호</th>
							<td><%=idx_s%></td>
							<td><input type="hidden" name="idx"
								value=<%=idx_s%>></td>
						</tr>
						<tr>
							<th>사원 이름</th>
							<td><input type="text" name="name"
								value=<%=rs.getString("name")%>></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><input type="text" name="email"
								value=<%=rs.getString("email")%>></td>
						</tr>
						<tr>
							<th>부서명</th>
							<td><input type="text" name="dept"
								value=<%=rs.getString("dept")%>></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="정보수정"> <input type="reset" value="취소하기"
								onclick="location.href = 'emp.jsp'"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
	</section>

	<%@ include file="footer.jsp"%>

</body>
</html>