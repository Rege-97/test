package com.yong.gallery;

import java.sql.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class GalleryDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public GalleryDAO() {
		// TODO Auto-generated constructor stub
	}

	/** 이미지 등록 관련 메서드 */
	// request를 multipart가 먹었기 때문에 카트로 사용할 수도 있음

	public int imgAdd(String writer, MultipartRequest mr) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_imggallery values(jsp_imggallery_idx.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, writer);
			String originname = mr.getOriginalFileName("imgname");// 매개값은 폼에 있는 file타입 이름
			String systemname = mr.getFilesystemName("imgname");
			ps.setString(2, originname);
			ps.setString(3, systemname);
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

	public ArrayList<GalleryDTO> imgList() {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "select * from jsp_imggallery order by idx desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<GalleryDTO> arr = new ArrayList<GalleryDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String originname = rs.getString("originname");
				String systemname = rs.getString("systemname");
				GalleryDTO dto = new GalleryDTO(idx, writer, originname, systemname);
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

}
