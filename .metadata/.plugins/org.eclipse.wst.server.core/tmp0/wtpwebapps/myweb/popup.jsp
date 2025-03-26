<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="border: 2px solid gray; width: 300px; height: 250px; margin: 0px auto;">
		<h1 style="text-align: center;">공 지 사 항</h1>
		<h3>1.지각을 하지 맙시다.</h3>
		<h3>2.결석을 하지 맙시다.</h3>
		<h3>3.건강관리를 유의합시다.</h3>
		<h3>4.복습을 철저히 합시다.</h3>
		<form name="fm" action="popup_ok.jsp">
			<input type="checkbox" name="popupck" value="on">오늘 하루 안보기
			<input type="submit" value="닫기">
		</form>
	</div>

</body>
</html>