<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<!-- 컨텐츠 범위지정 -->
	<section>
		<!-- 컨텐츠 영역 -->
		<article id="mainImg">
			<img src="img/conan.png" alt="자기소개">
		</article>
		<!-- 컨텐츠 영역 -->
		<article id="mainSubmenu">
			<h2>자기소개</h2>
			<ul>
				<li>내 이름은 코난</li>
				<li>탐정이죠</li>
			</ul>
		</article>
	</section>
	<%@include file="footer.jsp"%>

</body>
</html>