<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yong.gallery.*"%>
<jsp:useBean id="idao" class="com.yong.gallery.GalleryDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
img {
	width: 90px;
	height: 90px;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>이미지 갤러리</h2>
			<div>
				<%
				if (sname != null) {
				%>
				<input type="button" value="이미지 올리기" onclick="location.href='imgUpload.jsp'">
				<%
				}
				%>
			</div>
			<fieldset>
				<legend>이미지 목록</legend>
				<table>
					<tr>
						<%
						ArrayList<GalleryDTO> arr = idao.imgList();
						if (arr == null || arr.size() == 0) {
						%>
						<td colspan="4" align="center">아직 등록된 이미지가 없습니다.</td>
						<%
						} else {
						for (int i = 0; i < arr.size(); i++) {
							if (i % 4 == 0 && i != 0) {
						%>
					</tr>
					<tr>
						<%
						}
						%>
						<td>
							<img src="imgs/<%=arr.get(i).getSystemname()%>"> <br><%=arr.get(i).getWriter()%>
						</td>
						<%
						}
						}
						%>
					</tr>
				</table>
			</fieldset>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>