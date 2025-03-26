<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.yong.emp.*"%>
<jsp:useBean id="edao" class="com.yong.emp.EmpDAO"></jsp:useBean>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}
int idx = Integer.parseInt(idx_s);

EmpDTO dto = edao.empUpdateSel(idx);

if (dto == null) {
%>
<script>
	window.alert('잘못된 접근 또는 삭제된 사원입니다.');
	location.href = 'emp2.jsp';
</script>
<%
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
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
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<form name="empUpdate2" action="empUpdate2_ok.jsp">
				<fieldset>
					<legend><%=dto.getIdx()%>사번의 사원 정보수정
					</legend>
					<table>
						<tr>
							<th>사원 번호</th>
							<td><%=dto.getIdx()%></td>
							<td><input type="hidden" name="idx" value=<%=dto.getIdx()%>></td>
						</tr>
						<tr>
							<th>사원 이름</th>
							<td><input type="text" name="name" value=<%=dto.getName()%>></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><input type="text" name="email"
								value=<%=dto.getEmail()%>></td>
						</tr>
						<tr>
							<th>부서명</th>
							<td><input type="text" name="dept" value=<%=dto.getDept()%>></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="정보수정"> <input type="reset" value="취소하기"
								onclick="location.href = 'emp2.jsp'"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
	</section>

	<%@ include file="../footer.jsp"%>

</body>
</html>