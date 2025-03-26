package com.yong.phonebook;

//DB연동처리 주처리
import java.sql.*;
import java.util.*;

public class PhonebookDAO {

//반복적으로 사용되는 것 멤버변수 선언
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public PhonebookDAO() {

	}

	/** 전화번호 등록 과련 메서드 */ // 실행횟수 반환되는 녀석(나를 호출했던 녀석에게 돌려주도록 토스하도록 만듦 int
	public int phoneAdd(PhonebookDTO dto) {
		// 카트가 있어야 짐을 가져옴 = 매개값으로 받음
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 메모리에 로딩
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "mydb";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, user, pwd);
			String sql = "insert into phonebook values(phonebook_idx.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTel());
			ps.setString(3, dto.getAddr());
			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			// 양수보다 작은값 -2도 상관없음
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}

			// ps로 sql셋팅
		}
	}

	/** 모든 전화번호 내역 */
	public ArrayList<PhonebookDTO> phoneListPart1() {
		try {
			conn = com.yong.db.YongDB.getConn(); // 커넥션 할당 //드라이버 로딩
			String sql = "select * from phonebook order by idx desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<PhonebookDTO> arr = new ArrayList<PhonebookDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr"); // 여기까지만 하면 담고 데이터 사라짐
				PhonebookDTO dto = new PhonebookDTO(idx, name, tel, addr); // 카트에 담음
				arr.add(dto);// 카트를 트럭에 담음
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}

		}

	}

	public int phoneDel(int idx) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "delete from phonebook where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();

			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
			}
		}

	}
	/** 모든 전화번호 내역 */
	public ArrayList<PhonebookDTO> phoneSearch(String name) {
		try {
			conn = com.yong.db.YongDB.getConn(); // 커넥션 할당 //드라이버 로딩
			String sql = "select * from phonebook where name=? order by idx desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			ArrayList<PhonebookDTO> arr = new ArrayList<PhonebookDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr"); // 여기까지만 하면 담고 데이터 사라짐
				PhonebookDTO dto = new PhonebookDTO(idx, name, tel, addr); // 카트에 담음
				arr.add(dto);// 카트를 트럭에 담음
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}

		}

	}

}
