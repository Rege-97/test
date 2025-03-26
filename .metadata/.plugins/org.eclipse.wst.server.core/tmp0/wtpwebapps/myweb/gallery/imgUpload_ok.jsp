<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="idao" class="com.yong.gallery.GalleryDAO"></jsp:useBean>

<%
String savepath = request.getRealPath("/gallery/imgs");//저장경로를 손쉽게 얻어오는 법

MultipartRequest mr = new MultipartRequest(request, savepath, 1024 * 1024 * 10, "utf-8", new DefaultFileRenamePolicy());

String writer = (String) session.getAttribute("sid");
int result = idao.imgAdd(writer, mr);
String msg = result > 0 ? "이미지 업로드 완료!" : "이미지 업로드 실패!";
%>
<script>
window.alert('<%=msg%>');
	location.href = 'imgGallery.jsp';
</script>



