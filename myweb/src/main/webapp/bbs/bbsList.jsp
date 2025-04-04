<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yong.bbs.*"%>
<jsp:useBean id="bdao" class="com.yong.bbs.BbsDAO" scope="session"></jsp:useBean>
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

table {
	width: 550px;
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}

table thead th {
	background-color: skyblue;
}
</style>
</head>
<%
// 총 게시물 수
int totalCnt = bdao.getTotalCnt(); // db로부터 조회

//보여줄 리스트 수
int listSize = 15;

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
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>자유게시판</h2>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="4" align="center">
							<%
							if (userGroup != 0) {
							%>
							<a href="bbsList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
							}
							%>
							<%
							for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
							%>&nbsp;&nbsp; <a href="bbsList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
 if (i == totalPage) {
 	break;
 }
 }
 %>
							<%
							if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
							%>
							<a href="bbsList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
							<%
							}
							%>
						</td>
						<td>
							<a href="bbsWrite.jsp">글쓰기</a>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<%
					ArrayList<BbsDTO> arr = bdao.bbsList(cp, listSize);
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="5" align="center">등록된 게시글이 없습니다.
					</tr>
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td><%=arr.get(i).getIdx()%></td>
						<td>
							<%
							for (int z = 0; z < arr.get(i).getLev(); z++) {
								out.println("&nbsp;&nbsp;");
							}
							%>
							<a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getTitle()%></a>
						</td>
						<td><%=arr.get(i).getWriter()%></td>
						<td><%=arr.get(i).getWritedate()%></td>
						<td><%=arr.get(i).getReadnum()%></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>