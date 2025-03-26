<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
	function openPopup() {
		window.open('popup.jsp', 'popup', 'width=450 ,height=400');
	}
</script>
<%
String lastDay = "첫 방문이시군요!!";
String popupck = null;
Cookie cks[] = request.getCookies();

if (cks != null) {
	for (int i = 0; i < cks.length; i++) {
		if (cks[i].getName().equals("lastDay")) {
	lastDay = "마지막 접속일 : " + URLDecoder.decode(cks[i].getValue());
		}
		if (cks[i].getName().equals("popupck")) {
	popupck = "on";
		}
	}
}
%>
</head>
<body <%=popupck == null ? "onload='openPopup()'" : ""%>>
	<%@include file="header.jsp"%>
	<!-- 컨텐츠 범위지정 -->
	<section>
		<!-- 컨텐츠 영역 -->
		<article id="mainImg">
			<img src="img/main.jpg" alt="메인이미지">
		</article>
		<!-- 컨텐츠 영역 -->
		<article id="mainSubmenu">


			<h2><%=lastDay%></h2>
			<%
			Calendar now = Calendar.getInstance();

			int y = now.get(Calendar.YEAR);
			int m = now.get(Calendar.MONTH) + 1;
			int d = now.get(Calendar.DATE);
			String now_s = y + "년 " + m + "월 " + d + "일";

			now_s = URLEncoder.encode(now_s);

			Cookie ck = new Cookie("lastDay", now_s);
			ck.setMaxAge(60 * 60 * 24 * 30);

			response.addCookie(ck);
			%>
			<h2>아래에 계속 추가됨</h2>
			<ul>
				<li><a href="formTest.jsp">form테스트</a></li>
				<li><a href="cal.jsp">사칙 계산기</a></li>
				<li><a href="emp.jsp">사원관리프로그램(원시형)</a></li>
				<li><a href="emp/emp2.jsp">사원관리프로그램(Beans형)</a></li>
				<li><a href="member/memberFind.jsp">회원검색</a></li>
				<li><a href="phonebook/phonebookForm.jsp">전화번호부(복습)</a></li>
				<li><a href="fileUploadTest.jsp">파일업로드 테스트</a></li>
				<li><a href="filebbs/fileBbs.jsp">심플 자료실</a></li>
				<li><a href="gallery/imgGallery.jsp">이미지 갤러리</li>
			</ul>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>