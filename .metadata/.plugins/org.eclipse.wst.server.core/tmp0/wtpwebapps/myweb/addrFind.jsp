<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function autoWrite() {
		// 1.사용자값 회수
		var fulladdr = document.fm.address.value;
		// 2.값 분리
		var zip = fulladdr.substring(1, 6);
		var addr = fulladdr.substring(8);
		// 3.본 페이지를 연 부모페이지 전달
		opener.document.join.zip.value = zip;
		opener.document.join.addr1.value = addr;
		
		window.self.close();
	}
</script>
</head>
<body>
	<form name="fm">
		<fieldset>
			<legend>주소검색</legend>
			<label>주소</label> <input type="text" name="address" size="35">
			<input type="button" value="주소확인" onclick="autoWrite();">
		</fieldset>
	</form>

</body>
</html>