<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2 {
	text-align: center;
	color: skyblue;
}

section li {
	list-style-type: none;
}

section label {
	width: 120px;
	float: left;
}

table {
	width: 550px;
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}

table th {
	background-color: skyblue;
}

meter {
	width: 200px;
}
</style>
<script>
	function openUpload() {
		window.open('upload.jsp', 'upload', 'width=500, height=250');
	}
	function openAddFolder() {
		window.open('addFolder.jsp', 'upload', 'width=500, height=250');
	}
</script>
</head>
<%
String sid = (String) session.getAttribute("sid");
if (sid == null) {
%>
<script>
	window.alert('로그인 후 이용가능한 서비스입니다.');
	location.href = '/myweb';
</script>
<%
return;
}
%>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
wf.setBasepath(request.getRealPath("/webfolder/upload"));
wf.setUserid(sid);
wf.userFolderExists();

String crpath = request.getParameter("crpath");
if (crpath == null || crpath.equals("")) {
	crpath = sid;
}

wf.setCrpath(crpath);
%>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>Y 드라이브</h2>
			<fieldset>
				<legend>사용정보</legend>
				<ul>
					<li><label>총용량 : </label> <meter max="<%=wf.getTotalsize()%>" min="0" value="<%=wf.getTotalsize()%>"></meter><%=wf.getTotalsize()%>(byte)</li>
					<li><label>사용용량 : </label> <meter max="<%=wf.getTotalsize()%>" min="0" value="<%=wf.getUsedsize()%>"></meter><%=wf.getUsedsize()%>(byte)</li>
					<li><label>남은용량 : </label> <meter max="<%=wf.getTotalsize()%>" min="0" value="<%=wf.getFreesize()%>"></meter><%=wf.getFreesize()%>(byte)</li>
				</ul>
			</fieldset>
		</article>
		<article>
			<div>
				<input type="button" value="파일올리기" onclick="openUpload();"> <input type="button" value="폴더만들기" onclick="openAddFolder();">
			</div>
			<fieldset>
				<legend>탐색기</legend>
				<table>
					<thead>
						<tr>
							<th>구분</th>
							<th>파일 및 폴더명</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (!wf.getCrpath().equals(wf.getUserid())) {
							int endpoint = wf.getCrpath().lastIndexOf("/");
							String up_cr = wf.getCrpath().substring(0, endpoint);
						%>
						<tr>
							<td colspan="3" align="center">
								<a href="webfolder.jsp?crpath=<%=up_cr%>">상위폴더로...</a>
							</td>
						</tr>
						<%
						}
						%>

						<%
						File f = new File(wf.getBasepath() + "/" + wf.getCrpath());
						File files[] = f.listFiles();

						if (files == null || files.length == 0) {
						%>
						<tr>
							<td colspan="3" align="center">등록된 파일 및 폴더가 없습니다.</td>
						</tr>
						<%
						} else {
						for (int i = 0; i < files.length; i++) {
						%>
						<tr>
							<td><%=files[i].isFile() ? "[FILE]" : "[DIR]"%></td>
							<td>
								<%
								if (files[i].isFile()) {
								%><a href="/myweb/webfolder/upload/<%=wf.getCrpath() + "/" + files[i].getName()%>"><%=files[i].getName()%></a>
								<%
								} else {
								%><a href="webfolder.jsp?crpath=<%=wf.getCrpath()%>/<%=files[i].getName()%>"><%=files[i].getName()%></a>
								<%
								}
								%>
							</td>
							<td><a href="deleteFile.jsp?name=<%=files[i].getName()%>">삭제</a></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</fieldset>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>