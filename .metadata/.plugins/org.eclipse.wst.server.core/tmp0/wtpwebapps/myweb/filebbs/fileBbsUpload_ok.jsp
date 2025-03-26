<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="filedao" class="com.yong.filebbs.FileBbsDAO"></jsp:useBean>
<%
String savepath = "C:/student_java/WebStudy/jspStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/filebbs/files";

MultipartRequest mr = new MultipartRequest(request, savepath, 1024 * 1024 * 10, "utf-8");

String filename = mr.getOriginalFileName("upload");
String writer = (String) session.getAttribute("sid");

int result = filedao.fileBbsUpload(filename, writer);

String msg = result > 0 ? "파일 업로드 성공!" : "업로드 중 오류발생!";
%>
<script>
	window.alert('<%=msg%>');
	location.href = 'fileBbs.jsp';
</script>