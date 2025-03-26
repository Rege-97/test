<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.yong.phonebook.*" %>
<jsp:useBean id="pdao" class="com.yong.phonebook.PhonebookDAO"></jsp:useBean>
<%
String idx_s = request.getParameter("idx");
if (idx_s.equals("") || idx_s == null) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);

int result=pdao.phoneDel(idx);
String msg=result>0?"전화번호삭제성공(bean)!":"전화번호삭제실패(bean)";
%>
<script>
window.alert('<%=msg%>');
location.href="phonebookForm.jsp";
</script>