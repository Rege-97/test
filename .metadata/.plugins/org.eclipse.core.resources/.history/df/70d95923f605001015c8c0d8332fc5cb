<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
String name = request.getParameter("name");
String path="/webfolder/upload/"+wf.getCrpath()+"/"+name;
String deletepath = request.getRealPath(path);
File f = new File(deletepath);

wf.deleteFile(f);
%>
<script>
	window.alert('파일 삭제 성공!');
	location.href = 'webfolder.jsp?crpath=<%=wf.getCrpath()%>';
	window.self.close();
</script>