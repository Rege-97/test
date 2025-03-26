<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>
	<%
	// 1.쿠키들 가져오기(배열)
	Cookie cks[] = request.getCookies();
	// 2.쿠키 요소에 접근하여 키값 확인
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			String key = cks[i].getName();
			// 3.값 취득
			String value = URLDecoder.decode(cks[i].getValue());

			out.println("<h3>key : " + key + " / value : " + value);
		}
	}
	%>

	<%
	String str="홍 길동";
	
	str = URLEncoder.encode(str);
	
	// 1.쿠키 객체 생성
	Cookie ck = new Cookie("username", str);
	// 2.쿠키 나이 지정
	ck.setMaxAge(60 * 3);
	// 3.사용자에게 심기
	response.addCookie(ck);

	Cookie ck2 = new Cookie("userage", "20");
	ck2.setMaxAge(60 * 3);
	response.addCookie(ck2);
	%>
</body>
</html>