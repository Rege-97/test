<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.yong.bbs.*"%>
<jsp:useBean id="bdao" class="com.yong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}
int idx = Integer.parseInt(idx_s);

BbsDTO dto = bdao.bbsContent(idx);

if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = "bbsList.jsp";
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
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>자유게시판 본문보기</h2>
			<fieldset>
				<legend>본문내용</legend>
				<table width="550" border="1" cellspacing="0">
					<tr>
						<th>번호</th>
						<td><%=dto.getIdx()%></td>
						<th>작성날짜</th>
						<td><%=dto.getWritedate()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=dto.getWriter()%></td>
						<th>조회수</th>
						<td><%=dto.getReadnum()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><%=dto.getTitle()%></td>
					</tr>
					<tr height="150">
						<td colspan="4" align="left" valign="top"><%=dto.getContent().replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<td colspan="4" align="center">목록으로 | <a href="bbsReWrite.jsp?title=<%=dto.getTitle()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답글쓰기</a></td>
					</tr>
				</table>
			</fieldset>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>