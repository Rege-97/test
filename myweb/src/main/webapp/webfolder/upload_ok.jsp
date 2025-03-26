<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
String savepath = wf.getBasepath() + "/" + wf.getCrpath();
MultipartRequest mr = new MultipartRequest(request, savepath, (int) wf.getFreesize(), "utf-8");
%>
<script>
	window.alert('파일 업로드 성공!');
	opener.location.href = 'webfolder.jsp?crpath=<%=wf.getCrpath()%>';
	window.self.close();
</script>