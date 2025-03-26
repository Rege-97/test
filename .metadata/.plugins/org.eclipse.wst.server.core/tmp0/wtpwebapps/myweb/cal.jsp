<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2 {
	text-align: center;
}

fieldset {
	width: 550px;
	margin: 0px auto;
}

form {
	text-align: center;
}

input[type="text"] {
	width: 80px;
	font-size: 20px;
}

#opers {
	width: 50px;
	text-align: center;
	font-size: 20px;
}
</style>
<script>
	function show() {
		if (document.fm.num1.value == '') {
			window.alert('계산할 숫자를 입력하세요.');
			return false;
		}
	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<article>
			<h2>사 칙 계 산 기</h2>
			<form name="fm" action="cal_ok.jsp">
				<fieldset>
					<legend>사칙계산기</legend>
					<input type="text" name="num1" required="required"> <select name="oper"
						id="opers">
						<option value="+">+</option>
						<option value="-">-</option>
						<option value="*">*</option>
						<option value="/">/</option>
					</select> <input type="text" name="num2" required="required"> &nbsp;&nbsp; =
					&nbsp;&nbsp; <input type="submit" value="계산하기">
				</fieldset>
			</form>

		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>