<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="beanTest" action="beanTest_ok.jsp">
		<ul>
			<li><label>이름 </label><input type="text" name="name"></li>
			<li><label>나이 </label><input type="text" name="age"></li>
			<li><label>전화번호 </label><input type="text" name="tel"></li>
			<li><label>주소 </label><input type="text" name="addr"></li>
		</ul>
		<div>
			<input type="submit" value="값 전달하기">
		</div>
	</form>
</body>
</html>