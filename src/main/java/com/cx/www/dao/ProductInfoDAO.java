package com.cx.www.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.ProductInfoVO;

public class ProductInfoDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public ProductInfoDAO() {
		conn = DBConnection.getConnection();
	}
	
	// 총 거래처 수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM PRODUCT_INFO");
		
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
	
	public ArrayList<ProductInfoVO> getAll() {
		ArrayList<ProductInfoVO> list = new ArrayList<ProductInfoVO>();
		
		sb.setLength(0);
		sb.append("SELECT PNO_INFO, PNO, MANUDATE, T_COUNT FROM PRODUCT_INFO ORDER BY PNO_INFO");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				int pNoInfo = rs.getInt("PNO_INFO");
				String pNo = rs.getString("PNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				
				ProductInfoVO vo = new ProductInfoVO(pNoInfo, pNo, manudate, tCount);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<ProductInfoVO> getAll(int startNo, int count) {
		ArrayList<ProductInfoVO> list = new ArrayList<ProductInfoVO>();
		
		sb.setLength(0);
		sb.append("SELECT PNO_INFO, PNO, MANUDATE, T_COUNT FROM PRODUCT_INFO ORDER BY PNO_INFO LIMIT ?, ?");
		// 1행이 0, startN0 행부터 count개
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				int pNoInfo = rs.getInt("PNO_INFO");
				String pNo = rs.getString("PNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				
				ProductInfoVO vo = new ProductInfoVO(pNoInfo, pNo, manudate, tCount);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ProductInfoVO getOne(int pNoInfo) {
		ProductInfoVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT PNO_INFO, PNO, MANUDATE, T_COUNT FROM PRODUCT_INFO WHERE PNO_INFO=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pNoInfo);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String pNo = rs.getString("PNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				
				vo = new ProductInfoVO(pNoInfo, pNo, manudate, tCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public ProductInfoVO getOne(String pno) {
		ProductInfoVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT PNO_INFO, PNO, MANUDATE, T_COUNT FROM PRODUCT_INFO "
				+ "WHERE PNO=? ORDER BY MANUDATE DESC LIMIT 1");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, pno);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				int pNoInfo = rs.getInt("PNO_INFO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				
				vo = new ProductInfoVO(pNoInfo, pno, manudate, tCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public void addOne(ProductInfoVO vo) {
		
		sb.setLength(0);
		sb.append("SELECT PNO_INFO FROM PRODUCT_INFO ORDER BY PNO_INFO DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				int pNoInfo = rs.getInt("PNO_INFO");
				pNoInfo++;
				
				sb.setLength(0);
				sb.append("INSERT INTO PRODUCT_INFO VALUES (?,?,?,?)");
				
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setInt(1, pNoInfo);
					pstmt.setString(2, vo.getPNo());
					pstmt.setString(3, vo.getManudate());
					pstmt.setInt(4, vo.getTCount());
				pstmt.executeUpdate();	
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int pNoInfo) {
		sb.setLength(0);
		sb.append("DELETE FROM PRODUCT_INFO WHERE PNO_INFO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pNoInfo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateManudate(ProductInfoVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT_INFO SET MANUDATE=? WHERE PNO_INFO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getManudate());
				pstmt.setInt(2, vo.getPNoInfo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateTotalCount(ProductInfoVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT_INFO SET T_COUNT=? WHERE PNO_INFO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getTCount());
				pstmt.setInt(2, vo.getPNoInfo());
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
