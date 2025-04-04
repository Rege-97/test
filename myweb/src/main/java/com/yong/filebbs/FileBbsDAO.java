package com.yong.filebbs;

import java.sql.*;
import java.util.*;

public class FileBbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public FileBbsDAO() {
	}

	/** 파일 정보 등록관련 메서드 */
	public int fileBbsUpload(String filename, String writer) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_filebbs values(jsp_filebbs_idx.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, filename);
			ps.setString(2, writer);
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

	/** 목록 관련 메서드 */
	public ArrayList<FileBbsDTO> fileBbsList() {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "select * from jsp_filebbs order by idx desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<FileBbsDTO> arr = new ArrayList<FileBbsDTO>();
			
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String filename=rs.getString("filename");
				String writer=rs.getString("writer");
				FileBbsDTO dto= new FileBbsDTO(idx, filename, writer);
				
				arr.add(dto);
			}
			
			return arr;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {

			} catch (Exception e2) {
			}
		}

	}
}
