<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show() {
		window.open('addrFind.jsp', 'addrFind', 'width=450, height=300');
	}
</script>
</head>
<body>
	<h1>회원가입 흉내~</h1>
	<form name="join">
		<label>우편번호</label> <input type="text" name="zip" size="10" readonly>
		<input type="button" value="주소검색" onclick="show();"><br>
		<label>기본주소</label> <input type="text" name="addr1" size="45" readonly><br>
		<label>상세주소</label> <input type="text" name="addr2" size="45"><br>
	</form>
</body>
</html>