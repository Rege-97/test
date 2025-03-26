<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%
String savepath = "c:/student_java/uploadTest";
int filesize = 1024 * 1024 * 10;
MultipartRequest mr = new MultipartRequest(request, savepath, filesize,"utf-8");
%>

<script>
alert("업로드 OK");
location.href="fileUploadTest.jsp"
</script>