<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
String crpath = wf.getCrpath();
String name = request.getParameter("name");

String path = request.getRealPath("/webfolder/upload/" + crpath + "/" + name);
wf.addFolder(path);
%>
<script>
	window.alert('폴더 생성 완료!');
	opener.location.href = 'webfolder.jsp?crpath=<%=wf.getCrpath()%>';
	window.self.close();
</script>