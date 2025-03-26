<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 원시형으로 구현  250311 @@
%>
<%@ page import="java.sql.*"%>
<%
//1. 사용자 값 회수

String idx_s = request.getParameter("idx");
if (idx_s.equals("") || idx_s == null) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);

//2. DB연동 (DB에서 가져오기 위한 )
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "mydb";
String pwd = "1234";
Connection conn = DriverManager.getConnection(url, user, pwd);

//3.insert (그럼 쿼리 필요) 폰북에서 갑 가져올건데 순차적으로 증가하는 값,대처되는 값 인파라미터로 대처
String sql = "delete from phonebook where idx=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setInt(1, idx);
int count = ps.executeUpdate();
ps.close();
conn.close();

//4. 결과 사용자에게 응답
//처리한 결과 판단할 수 있어야됨(if, else문도 있고 메세지로 판단 가능함)
//0보다 크면 한번은 수행됨

String msg = count > 0 ? "전화번호삭제완료!" : "전화번호삭제실패";
%>
<script>
window.alert('<%=msg%>');
	//로케이션이 가지고 있는 하이퍼로케이션을 이용해 phoneForm.jsp로 이동할 수 있도록
	location.href = "phonebookForm.jsp";
</script>




