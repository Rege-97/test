<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// 총 게시물 수
int totalCnt = 56; // db로부터 조회

//보여줄 리스트 수
int listSize = 5;

//보여줄 페이지 수
int pageSize = 5;

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

// 총 페이지 수
int totalPage = (totalCnt / listSize) + 1;
if (totalCnt % listSize == 0)
	totalPage--;

int userGroup = cp / pageSize;
if (cp % pageSize == 0)
	userGroup--;
%>
<body>
	<h1>pageTest.jsp</h1>
	<h3>총 게시물 수 : <%=totalCnt%></h3>
	<h3>보여줄 리스트 수 : <%=listSize%></h3>
	<h3>총 페이지 수 : <%=totalPage%></h3>
	<h3>보여줄 페이지 수 : <%=pageSize%></h3>
	<h3>사용자의 현재 위치 : <%=cp%></h3>
	<hr>
	<%
	if (userGroup != 0) {
	%>
	<a href="pageTest.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize %>">&lt;&lt;</a>
	<%
	}
	%>
	<%
	for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
	%>&nbsp;&nbsp;
	<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
	if (i == totalPage) {
		break;
	}
	}
	%>
	<%
	if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
	%>
	<a href="pageTest.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
	<%
	}
	%>
</body>
</html>