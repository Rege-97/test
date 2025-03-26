package com.yong.member;

import java.util.*;

import com.yong.emp.EmpDTO;

import java.sql.*;
import java.sql.Date;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;

	public MemberDAO() {

	}

	/** 회원가입 관련 메서드 */
	public int memberJoin(MemberDTO mdto) {

		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_member values(jsp_member_idx.nextval," + "?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getId()); // dto로부터 getId가져옴
			ps.setString(2, mdto.getPwd());
			ps.setString(3, mdto.getName());
			ps.setString(4, mdto.getEmail());
			ps.setString(5, mdto.getTel());
			ps.setString(6, mdto.getAddr());
			int count = ps.executeUpdate(); // 결과 리턴해주면 비즈니스 로직 끝
			return count; // 리턴

		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 무언가가 잘못됐을 경우 양수만 아니면 되므로 -1 넣어서 무언가 잘못됐다고 알려줌
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

	/** 아이디 중복검사 관련 메서드 */
	public boolean idCheck(String userid) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = " select * from jsp_member where id=?"; // 조회된 데이터가 있냐 없냐가 중요
			// id로 검색(검사)아이디 가져올거임

			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery(); // 있냐 ,없냐 판단하므로 데이터 가져올 필요없음//result에 물어보기만 하먄됨
			return rs.next(); // 데이터 있냐 있으면 true, 없으면 false가 자동으로 돌아감
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 중복검사했을 때 통과될 수 있도록 false로 함
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

	/** 회원 검색 관련 메서드 */
	public ArrayList<MemberDTO> memberFind(String fkey, String fvalue) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select * from jsp_member where " + fkey + "=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs = ps.executeQuery();

			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				Date joindate = rs.getDate("joindate");

				MemberDTO dto = new MemberDTO(idx, id, pwd, name, email, tel, addr, joindate);
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

	public int loginCheck(String userid, String userpwd) {

		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "Select pwd from jsp_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();

			if (rs.next()) {
				String dbpwd = rs.getString("pwd");
				if (dbpwd.equals(userpwd)) {
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}
			} else {
				return NOT_ID;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
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

	public String getUserInfo(String userid) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "Select name from jsp_member where id=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userid);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString(1);
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
