package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.AllProductVO;

public class AllProductDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public AllProductDAO() {
		conn = DBConnection.getConnection();
	}
	
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO ");
		
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
	
	public int getNewCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO "
				+ "AND P.REGDATE >= DATE_SUB(NOW(), INTERVAL 180 DAY)");
		
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
	
	public ArrayList<AllProductVO> getAll() {
		ArrayList<AllProductVO> list = new ArrayList<AllProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT MC.MCNAME, SC.SCNAME, A.ACCNAME, PA.PNAME, PA.EXPIRYDATE, PA.PRICE_SERVER, P.PRICE_CONSUMER, P.REGDATE "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO "
				+ "ORDER BY P.REGDATE DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				String expirydate = rs.getString("EXPIRYDATE");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String regdate = rs.getString("REGDATE");
				
				AllProductVO vo = new AllProductVO(mcName, scName, accName, pName, expirydate, priceServer, priceConsumer, regdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	public ArrayList<AllProductVO> getNewAll() {
		ArrayList<AllProductVO> list = new ArrayList<AllProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT MC.MCNAME, SC.SCNAME, A.ACCNAME, PA.PNAME, PA.EXPIRYDATE, PA.PRICE_SERVER, P.PRICE_CONSUMER, P.REGDATE "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO "
				+ "AND P.REGDATE >= DATE_SUB(NOW(), INTERVAL 180 DAY)"
				+ "ORDER BY P.REGDATE DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				String expirydate = rs.getString("EXPIRYDATE");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String regdate = rs.getString("REGDATE");
				
				AllProductVO vo = new AllProductVO(mcName, scName, accName, pName, expirydate, priceServer, priceConsumer, regdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<AllProductVO> getSix() {
		ArrayList<AllProductVO> list = new ArrayList<AllProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT MC.MCNAME, SC.SCNAME, A.ACCNAME, PA.PNAME, PA.EXPIRYDATE, PA.PRICE_SERVER, P.PRICE_CONSUMER, P.REGDATE "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO "
				+ "AND P.REGDATE >= DATE_SUB(NOW(), INTERVAL 180 DAY)"
				+ "ORDER BY P.REGDATE DESC "
				+ "LIMIT 6");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				String expirydate = rs.getString("EXPIRYDATE");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String regdate = rs.getString("REGDATE");
				
				AllProductVO vo = new AllProductVO(mcName, scName, accName, pName, expirydate, priceServer, priceConsumer, regdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public ArrayList<AllProductVO> getAll(int startNo, int recordPerPage) {
		ArrayList<AllProductVO> list = new ArrayList<AllProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT MC.MCNAME, SC.SCNAME, A.ACCNAME, PA.PNAME, PA.EXPIRYDATE, PA.PRICE_SERVER, P.PRICE_CONSUMER, P.REGDATE "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO "
				+ "ORDER BY P.REGDATE DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				String expirydate = rs.getString("EXPIRYDATE");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String regdate = rs.getString("REGDATE");
				
				AllProductVO vo = new AllProductVO(mcName, scName, accName, pName, expirydate, priceServer, priceConsumer, regdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<AllProductVO> getNewAll(int startNo, int recordPerPage) {
		ArrayList<AllProductVO> list = new ArrayList<AllProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT MC.MCNAME, SC.SCNAME, A.ACCNAME, PA.PNAME, PA.EXPIRYDATE, PA.PRICE_SERVER, P.PRICE_CONSUMER, P.REGDATE "
				+ "FROM MAJOR_CATEGORY MC, SUB_CATEGORY SC, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A "
				+ "WHERE MC.MCNO = SC.MCNO "
				+ "AND SC.SCNO = P.SCNO "
				+ "AND PA.PNO_ACCOUNT = P.PNO_ACCOUNT "
				+ "AND PA.ACCNO = A.ACCNO "
				+ "AND P.REGDATE >= DATE_SUB(NOW(), INTERVAL 180 DAY)"
				+ "ORDER BY P.REGDATE DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				String expirydate = rs.getString("EXPIRYDATE");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String regdate = rs.getString("REGDATE");
				
				AllProductVO vo = new AllProductVO(mcName, scName, accName, pName, expirydate, priceServer, priceConsumer, regdate);
				
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

}
