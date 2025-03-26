<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<script>
	function show(imgcomp) {
		var filename = imgcomp.value;
		filename = filename.substring(filename.length - 3);
		if (filename != 'jpg') {
			alert('jpg이미지만 업로드 가능합니다.');
			imgcomp.value = '';
		}
		//alert(filename);
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>이미지 업로드</h2>
			<form name="imgUpload" action="imgUpload_ok.jsp" method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>이미지 업로드</legend>
					<ul>
						<li><label>이미지</label><input type="file" name="imgname" onchange="show(this)"></li>
						<!-- accept=".jpg" 파일 선택할 수 있도록 제한해주는 태그-->
					</ul>
					<div>
						<input type="submit" value="업로드">
					</div>
				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>