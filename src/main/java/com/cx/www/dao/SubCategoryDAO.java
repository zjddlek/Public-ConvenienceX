package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.SubCategorySalesVO;
import com.cx.www.vo.SubCategoryVO;
 
public class SubCategoryDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public SubCategoryDAO() {
		conn = DBConnection.getConnection();
	}
	
	// 총 거래처 수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM SUB_CATEGORY");
		
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
	
	public ArrayList<SubCategoryVO> getAll() {
		ArrayList<SubCategoryVO> list = new ArrayList<SubCategoryVO>();
		
		sb.setLength(0);
		sb.append("SELECT SCNO, MCNO, SCNAME FROM SUB_CATEGORY ORDER BY LENGTH(SCNO), SCNO");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String scNo = rs.getString("SCNO");
				String mcNo = rs.getString("MCNO");
				String scName = rs.getString("SCNAME");
				
				SubCategoryVO vo = new SubCategoryVO(scNo, mcNo, scName);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public SubCategoryVO getOne(String scNo) {
		SubCategoryVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT SCNO, MCNO, SCNAME FROM SUB_CATEGORY WHERE SCNO=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, scNo);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String mcNo = rs.getString("MCNO");
				String scName = rs.getString("SCNAME");
				
				vo = new SubCategoryVO(scNo, mcNo, scName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public void addOne(SubCategoryVO vo) {
		
		sb.setLength(0);
		sb.append("SELECT SCNO FROM SUB_CATEGORY ORDER BY LENGTH(SCNO) DESC, SCNO DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String scNo = rs.getString("SCNO");
				int scNoSeq = Integer.parseInt(scNo.substring(2));
				scNoSeq++;
				scNo = "SC" + scNoSeq;
				
				sb.setLength(0);
				sb.append("INSERT INTO SUB_CATEGORY VALUES (?,?,?)");
				
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, scNo);
					pstmt.setString(2, vo.getMcNo());
					pstmt.setString(3, vo.getScName());
				pstmt.executeUpdate();	
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String scNo) {
		sb.setLength(0);
		sb.append("DELETE FROM SUB_CATEGORY WHERE SCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, scNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateName(SubCategoryVO vo) {
		sb.setLength(0);
		sb.append("UPDATE SUB_CATEGORY SET SCNAME=? WHERE SCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getScName());
				pstmt.setString(2, vo.getScNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 
	// 재고리스트용 추가	
	public ArrayList<SubCategoryVO> GetAll(String mcno) {
		ArrayList<SubCategoryVO> list = new ArrayList<SubCategoryVO>();
		
		sb.setLength(0);
		
		sb.append("SELECT SCNO, MCNO, SCNAME ");
		sb.append("FROM SUB_CATEGORY ");
		sb.append("WHERE MCNO = ? ");
		sb.append("ORDER BY LENGTH(SCNO), SCNO ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, mcno);
			
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String scNo = rs.getString("SCNO");
				String scName = rs.getString("SCNAME");
				
				SubCategoryVO vo = new SubCategoryVO(scNo, mcno, scName);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
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
	
	public ArrayList<SubCategorySalesVO> getAllTop(String sno) {
		ArrayList<SubCategorySalesVO> list = new ArrayList<SubCategorySalesVO>();
		
		sb.setLength(0);
		sb.append("SELECT SC.SCNAME, SC.SCNO, SUM(AA.CNT * P.PRICE_CONSUMER) TOTAL, S.SNO "
				+ "FROM (SELECT STOCKNO, SUM(CNT) CNT "
				+ "FROM SALES NATURAL JOIN SALES_DETAIL "
				+ "WHERE SALEDATE > DATE_SUB(NOW(), INTERVAL 30 DAY) "
				+ "GROUP BY STOCKNO) AA NATURAL JOIN STOCK NATURAL JOIN PRODUCT_INFO PI NATURAL JOIN PRODUCT P NATURAL JOIN PRODUCT_ACCOUNT PA LEFT JOIN SUB_CATEGORY SC ON P.SCNO = SC.SCNO  JOIN ORDERS O ON O.PNO_INFO = PI.PNO_INFO JOIN SHOP S ON S.SNO=O.SNO "
				+ "WHERE S.SNO = ? "
				+ "GROUP BY SC.SCNO "
				+ "ORDER BY TOTAL DESC LIMIT 5 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String scName = rs.getString("SC.SCNAME");
				int sum = rs.getInt("TOTAL");
				
				SubCategorySalesVO vo = new SubCategorySalesVO(scName, sum);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
