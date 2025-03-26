<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style-type: none;
}

label {
	width: 90px;
	float: left;
}

div {
	text-align: right;
}
</style>
<%
String saveid="";

Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
	
}
%>
</head>
<body>
	<form name="login" action="login_ok.jsp" method="post">
		<fieldset>
			<legend>로그인</legend>
			<ul>
				<li><label>ID</label> <input type="text" name="userid" value="<%=saveid %>"></li>
				<li><label>Password</label> <input type="password" name="userpwd"></li>
			</ul>
			<div>
			<input type="checkbox" name="saveid" value="on" <%=saveid.equals("") ?"":"checked"%>>ID 기억하기
				<input type="submit" value="로그인">
			</div>
		</fieldset>

	</form>

</body>
</html>