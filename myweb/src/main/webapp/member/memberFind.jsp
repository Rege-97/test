<%@page import="com.yong.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%
request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<form name="memberFind" method="post" action="memberFind.jsp">
				<h2>회원검색</h2>
				<fieldset>
					<legend>회원검색</legend>
					<table id="search">
						<tr>
							<td>
								<select name="fkey">
									<option value="id">아이디
									<option value="name">이름
								</select>
							</td>
							<td>
								<input type="text" name="fvalue">
							</td>
							<td>
								<input type="submit" value="검색">
							</td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
		<article>
			<fieldset>
				<legend>검색결과</legend>
				<%
				if (request.getMethod().equals("GET")) {
				%>
				<h3>위 검색란에 검색어를 입력해주세요.</h3>
				<%
				} else {
				%>
				<jsp:include page="result.jsp"></jsp:include>
				<%
				}
				%>

			</fieldset>
		</article>
	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>