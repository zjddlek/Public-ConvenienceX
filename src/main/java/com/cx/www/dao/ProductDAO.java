package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.ProductVO;

public class ProductDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public ProductDAO() {
		conn = DBConnection.getConnection();
	}
	
	// 총 거래처 수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM PRODUCT");
		
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
	
	public ArrayList<ProductVO> getAll() {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT PNO, REGDATE, PRICE_CONSUMER, PNO_ACCOUNT, SCNO, MCNO FROM PRODUCT ORDER BY LENGTH(PNO), PNO");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String pNo = rs.getString("PNO");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pNoAccount = rs.getString("PNO_ACCOUNT");
				String scNo = rs.getString("SCNO");
				String mcNo = rs.getString("MCNO");
				
				ProductVO vo = new ProductVO(pNo, regdate, priceConsumer, pNoAccount, scNo, mcNo);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<ProductVO> getAll(int startNo, int count) {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT PNO, REGDATE, PRICE_CONSUMER, PNO_ACCOUNT, SCNO, MCNO FROM PRODUCT ORDER BY LENGTH(PNO), PNO LIMIT ?, ?");
		// 1행이 0, startN0 행부터 count개
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String pNo = rs.getString("PNO");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pNoAccount = rs.getString("PNO_ACCOUNT");
				String scNo = rs.getString("SCNO");
				String mcNo = rs.getString("MCNO");
				
				ProductVO vo = new ProductVO(pNo, regdate, priceConsumer, pNoAccount, scNo, mcNo);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ProductVO getOne(String pNo) {
		ProductVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT PNO, REGDATE, PRICE_CONSUMER, PNO_ACCOUNT, SCNO, MCNO FROM PRODUCT WHERE PNO=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, pNo);
			if ( rs.next() ) {
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pNoAccount = rs.getString("PNO_ACCOUNT");
				String scNo = rs.getString("SCNO");
				String mcNo = rs.getString("MCNO");
				
				vo = new ProductVO(pNo, regdate, priceConsumer, pNoAccount, scNo, mcNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public void addOne(ProductVO vo) {
		
		sb.setLength(0);
		sb.append("SELECT PNO FROM PRODUCT ORDER BY LENGTH(PNO) DESC, PNO DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String pno = rs.getString("PNO");
				int pnoSeq = Integer.parseInt(pno.substring(2));
				pnoSeq++;
				pno = "CX" + pnoSeq;
				
				sb.setLength(0);
				sb.append("INSERT INTO PRODUCT VALUES (?,?,?,?,?,?)");
				
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, pno);
					pstmt.setString(2, vo.getRegdate());
					pstmt.setInt(3, vo.getPriceConsumer());
					pstmt.setString(4, vo.getPNoAccount());
					pstmt.setString(5, vo.getScNo());
					pstmt.setString(6, vo.getMcNo());
				pstmt.executeUpdate();	
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String pNo) {
		sb.setLength(0);
		sb.append("DELETE FROM PRODUCT WHERE PNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, pNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateRegdate(ProductVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT SET REGDATE=? WHERE PNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getRegdate());
				pstmt.setString(2, vo.getPNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updatePriceConsumer(ProductVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT SET PRICE_CONSUMER=? WHERE PNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getPriceConsumer());
				pstmt.setString(2, vo.getPNo());
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
