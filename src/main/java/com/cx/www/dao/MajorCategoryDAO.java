package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.MajorCategoryVO;

public class MajorCategoryDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public MajorCategoryDAO() {
		conn = DBConnection.getConnection();
	}
	
	// 총 거래처 수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM MAJOR_CATEGORY");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<MajorCategoryVO> getAll() {
		ArrayList<MajorCategoryVO> list = new ArrayList<MajorCategoryVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, MCNAME FROM MAJOR_CATEGORY ORDER BY LENGTH(MCNO), MCNO");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcNo = rs.getString("MCNO");
				String mcName = rs.getString("MCNAME");
				
				MajorCategoryVO vo = new MajorCategoryVO(mcNo, mcName);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<MajorCategoryVO> getAll(int startNo, int count) {
		ArrayList<MajorCategoryVO> list = new ArrayList<MajorCategoryVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, MCNAME FROM MAJOR_CATEGORY ORDER BY LENGTH(MCNO), MCNO LIMIT ?, ?");
		// 1행이 0, startN0 행부터 20개
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcNo = rs.getString("MCNO");
				String mcName = rs.getString("MCNAME");
				
				MajorCategoryVO vo = new MajorCategoryVO(mcNo, mcName);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public MajorCategoryVO getOne(String mcNo) {
		MajorCategoryVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT MCNO, MCNAME FROM MAJOR_CATEGORY WHERE MCNO=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, mcNo);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				
				vo = new MajorCategoryVO(mcNo, mcName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public void addOne(MajorCategoryVO vo) {
		
		sb.setLength(0);
		sb.append("SELECT MCNO FROM MAJOR_CATEGORY ORDER BY LENGTH(MCNO) DESC, MCNO DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String mcNo = rs.getString("MCNO");
				int mcNoSeq = Integer.parseInt(mcNo.substring(2));
				mcNoSeq++;
				mcNo = "MC" + mcNoSeq;
				
				sb.setLength(0);
				sb.append("INSERT INTO MAJOR_CATEGORY VALUES (?,?)");
				
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, mcNo);
					pstmt.setString(2, vo.getMcName());
				pstmt.executeUpdate();	
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String mcNo) {
		sb.setLength(0);
		sb.append("DELETE FROM MAJOR_CATEGORY WHERE MCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, mcNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateName(MajorCategoryVO vo) {
		sb.setLength(0);
		sb.append("UPDATE MAJOR_CATEGORY SET MCNAME=? WHERE MCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getMcName());
				pstmt.setString(2, vo.getMcNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if ( rs != null ) rs.close();
			if ( pstmt != null ) pstmt.close();
			if ( conn != null ) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
