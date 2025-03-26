<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>requestTest.jsp</h1>
<h3>사용자 IP : <%=request.getRemoteAddr() %></h3>
<h3>사용자 포트 : <%=request.getRemotePort() %></h3>
<h3>사용 프로토콜 : <%=request.getProtocol() %></h3>
<h3>접속 방식 : <%=request.getMethod() %></h3>
<h3>서버 서비스 IP : <%=request.getServerName() %></h3>
<h3>서버 서비스 포트 : <%=request.getServerPort() %></h3>
<h3>서비스 프로젝트명 : <%=request.getContextPath() %></h3>
<h3>사용자 접속페이지 : <%=request.getRequestURI() %></h3>
<h3>프로젝트 절대(실제)경로 : <%=request.getRealPath("/") %></h3>
</body>
</html>