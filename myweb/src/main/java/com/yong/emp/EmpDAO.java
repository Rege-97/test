package com.yong.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;
import javax.sql.*;
import javax.naming.*;

public class EmpDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public EmpDAO() {
		System.out.println("EmpDAO 객체 생성됨!");
	}

	/** 사원 등록 관련 메서드 */
	public int empAdd(EmpDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "insert into employee values(employee_idx_sq.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
			}
		}

	}

	/** 사원 퇴사 관련 메서드 */
	public int empDel(EmpDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "delete from employee where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());

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

	/** 모든 사원 내역 관련 메서드 1번 */
	public EmpDTO[] empListPart1() {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			Vector<EmpDTO> arr = new Vector<EmpDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				arr.add(dto);
			}

			EmpDTO dtos[] = new EmpDTO[arr.size()];
			arr.copyInto(dtos);

			return dtos;

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

	/** 모든 사원 내역 관련 메서드 2번 */
	public ArrayList<EmpDTO> empListPart2() {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				arr.add(dto);
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

	public String empListPart3() {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			StringBuffer sb = new StringBuffer();

			if (rs.next()) {
				do {
					sb.append("<tr>");
					sb.append("<td>" + rs.getInt("idx") + "</td>");
					sb.append("<td>" + rs.getString("name") + "</td>");
					sb.append("<td>" + rs.getString("email") + "</td>");
					sb.append("<td>" + rs.getString("dept") + "</td>");
					sb.append("</tr>");
				} while (rs.next());
			}

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
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

	/** 사원 검색 관련 메서드 */
	public ArrayList<EmpDTO> empSearch(EmpDTO edto) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select * from employee where name=? order by idx desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, edto.getName());

			rs = ps.executeQuery();
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				arr.add(dto);
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

	/** 수정사원 정보 조회 관련 메서드 */
	public EmpDTO empUpdateSel(int idx) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select * from employee where idx=? order by idx desc";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);

			rs = ps.executeQuery();

			EmpDTO dto = null;
			if (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				dto = new EmpDTO(idx, name, email, dept);
			}

			return dto;

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

	/** 사원 검색 관련 메서드2 */
	public int empUpdate(EmpDTO edto) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "update employee set name=?, email=?, dept=? where idx=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			System.out.println(edto.getName());

			ps.setString(1, edto.getName());
			ps.setString(2, edto.getEmail());
			ps.setString(3, edto.getDept());
			ps.setInt(4, edto.getIdx());

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
}
