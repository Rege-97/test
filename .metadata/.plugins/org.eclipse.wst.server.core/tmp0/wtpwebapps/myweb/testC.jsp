<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이것은 html태그에 작성된 문장입니다.</h1>
	<!-- 이것은 html 주석입니다. -->
	<%
	// 이곳은 자바 코드를 작성할 수 있는 영역 
	/*여러줄 주석*/
	/**문서화 주석*/

	System.out.println("이것은 자바 코드로 작성한 문자열~");

	String str = "java"; // 지역 변수

	System.out.println("str = " + str);
	// out : servlet에서 제시한 PrintWriter객체
	// jsp에서 제공되는 기본 객체
	out.println("<h2>이것은 자바 코드로 작성한 문자열~</h2>");
	out.println("<h2>str = " + str + "</h2>");
	%>

	<h2>str = <%= str %></h2>
	
	<%!
	public int getSumNum(int num1,int num2){	// 멤버 메서드
		int result = num1+num2;
		return result;
	}
	
	String str="JSP~";	// 멤버 변수
	%>
	
	<%
	out.println("<h2>3 + 5 = "+getSumNum(3, 5)+"</h2>");
	
	%>
	
	<h2>4 + 6 = <%=getSumNum(4, 6) %></h2>
	<h2>str = <%=this.str %></h2>
	
	<%
	Calendar now=Calendar.getInstance();
	
	int y=now.get(Calendar.YEAR);
	int m=now.get(Calendar.MONDAY)+1;
	int d=now.get(Calendar.DATE);
	
	out.println("<h2>"+y+"년 "+m+"월 "+d+"일</h2>");
	%>
	
	</body>
</html>

