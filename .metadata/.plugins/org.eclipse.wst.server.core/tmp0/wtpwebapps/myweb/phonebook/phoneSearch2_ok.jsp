<%@page import="com.yong.phonebook.PhonebookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.yong.phonebook.*"%>
    <jsp:useBean id="pdao" class="com.yong.phonebook.PhonebookDAO"></jsp:useBean>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
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
			<h2>검색한 회원 내역(beans)</h2>
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
					String name=request.getParameter("name");
					ArrayList<PhonebookDTO> arr = pdao.phoneSearch(name);
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="4" align="center">등록된 회원이 없습니다.</td>
					</tr>
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td><%=arr.get(i).getIdx()%></td>
						<td><%=arr.get(i).getName()%></td>
						<td><%=arr.get(i).getTel()%></td>
						<td><%=arr.get(i).getAddr()%></td>
					</tr>

					<%
					}
					}
					%>
				</tbody>
			</table>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>