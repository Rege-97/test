<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<!-- 상단으로 구분 -->
<script>
	function openLogin() {
		window
				.open('/myweb/member/login.jsp', 'login',
						'width=450 ,height=350');
	}
</script>
<%
String sname = (String) session.getAttribute("sname");
%>
<header>
	<%
	if (sname == null) {
	%>
	<div>
		<a href="javascript:openLogin()">로그인</a>| <a href="/myweb/member/memberJoin.jsp">회원가입</a>
	</div>
	<%
	} else {
	%>
	<div><%=sname%>님 로그인중... | <a href="/myweb/member/logout.jsp">로그아웃</a>
	</div>
	<%
	}
	%>


	<h1>JSP Study Site</h1>
	<!-- 메뉴 영역으로 구분 -->
	<nav>
		<ul>
			<li><a href="/myweb/index.jsp">Home</a></li>
			<li><a href="/myweb/profile.jsp">Profile</a></li>
			<li><a href="/myweb/bbs/bbsList.jsp">자유게시판</a></li>
			<li><a href="/myweb/webfolder/webfolder.jsp">yong드라이브</a></li>
			<li><a href="#">방명록</a></li>
		</ul>
	</nav>
	<hr>
</header>