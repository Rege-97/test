package com.yong.bbs;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public BbsDAO() {
		// TODO Auto-generated constructor stub
	}

	/** 마지막 ref 구하기 관련 메서드 */
	public int getMaxRef() {
		try {
			String sql = "select max(ref) from jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int ref = 0;
			if (rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 글쓰기 관련 메서드 */
	public int bbsWrite(BbsDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();
			int ref = getMaxRef();

			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,0,0)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, ref + 1);

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

	/** 답변 시 sunbun업데이트 관련 메서드 */
	public void setSunUpdate(int ref, int sun) {
		try {
			String sql = "update jsp_bbs set sunbun=sunbun+1 where ref=? and sunbun>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 답변 글쓰기 관련 메서드 */
	public int bbsReWrite(BbsDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();
			setSunUpdate(dto.getRef(), dto.getSunbun() + 1);
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev() + 1);
			ps.setInt(7, dto.getSunbun() + 1);

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

	/** 총 게시물 수 관련 메서드 */
	public int getTotalCnt() {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "select count(*) from jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			rs.next();

			int count = rs.getInt(1);

			return count == 0 ? 1 : count;

		} catch (Exception e) {
			e.printStackTrace();
			return 1;
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

	/** 목록 관련 메서드 */
	public ArrayList<BbsDTO> bbsList(int cp, int listSize) {
		try {
			conn = com.yong.db.YongDB.getConn();
			int start = (cp - 1) * listSize + 1;
			int end = cp * listSize;
			String sql = "SELECT * FROM " + "(SELECT rownum AS rnum,a.* from "
					+ "(SELECT * FROM jsp_bbs ORDER BY ref DESC,sunbun asc)a)b " + "WHERE rnum >=? AND rnum<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);

			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");

				BbsDTO dto = new BbsDTO(idx, writer, pwd, title, content, writedate, readnum, ref, lev, sunbun);
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

	/** 본문 관련 메서드 */
	public BbsDTO bbsContent(int idx) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "select * from jsp_bbs where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			BbsDTO dto = null;
			rs = ps.executeQuery();
			if (rs.next()) {
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");

				dto = new BbsDTO(idx, writer, pwd, title, content, writedate, readnum, ref, lev, sunbun);
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
}
