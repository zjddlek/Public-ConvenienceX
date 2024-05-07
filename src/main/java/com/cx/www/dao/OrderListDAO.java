package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.OrderListVO;
 
public class OrderListDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public OrderListDAO() {
		conn = DBConnection.getConnection();
	}
	
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP ");
		
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
	
	public int getTotalYearCount(String yyyy) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP "
				+ "WHERE ORDDATE LIKE ?");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyy);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getTotalMonthCount(String yyyyMM) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP "
				+ "WHERE ORDDATE LIKE ?");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyyMM);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getTotalDayCount(String yyyyMMdd) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP "
				+ "WHERE ORDDATE LIKE ?");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyyMMdd);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getShopCount(String sno) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP SHOP  "
				+ "WHERE SNO = ? ");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getShopYearCount(String sno, String yyyy) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ?");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyy);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getShopMonthCount(String sno, String yyyyMM) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ?");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyyMM);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getShopDayCount(String sno, String yyyyMMdd) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ?");
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyyMMdd);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<OrderListVO> getAll() {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ "PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getAll(int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getYear(String yyyy) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE ORDDATE LIKE ?"
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyy);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getYear(String yyyy, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE ORDDATE LIKE ?"
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyy);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getMonth(String yyyyMM) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE ORDDATE LIKE ?"
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyyMM);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getMonth(String yyyyMM, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE ORDDATE LIKE ?"
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyyMM);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getDay(String yyyyMMdd) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE ORDDATE LIKE ?"
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyyMMdd);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getDay(String yyyyMMdd, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE ORDDATE LIKE ?"
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, yyyyMMdd);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopAll(String sno) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopAll(String sno, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopYear(String sno, String yyyy) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyy);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopYear(String sno, String yyyy, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyy);
				pstmt.setInt(3, startNo);
				pstmt.setInt(4, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopMonth(String sno, String yyyyMM) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyyMM);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopMonth(String sno, String yyyyMM, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyyMM);
				pstmt.setInt(3, startNo);
				pstmt.setInt(4, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopDay(String sno, String yyyyMMdd) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyyMMdd);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderListVO> getShopDay(String sno, String yyyyMMdd, int startNo, int recordPerPage) {
		ArrayList<OrderListVO> list = new ArrayList<OrderListVO>();
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE,  "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER,  "
				+ " PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME  "
				+ "FROM ORDERS  "
				+ "NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "NATURAL JOIN SUB_CATEGORY  "
				+ "NATURAL JOIN MAJOR_CATEGORY  "
				+ "NATURAL JOIN SHOP  "
				+ "WHERE SNO = ? "
				+ "AND ORDDATE LIKE ? "
				+ "ORDER BY ORDDATE DESC, LENGTH(ORDNO) DESC, ORDNO DESC "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
				pstmt.setString(2, yyyyMMdd);
				pstmt.setInt(3, startNo);
				pstmt.setInt(4, recordPerPage);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
				
				OrderListVO vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public OrderListVO getLastOne() {
		OrderListVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT MCNO, SCNO, PNO_ACCOUNT, PNO, PNO_INFO, ORDNO, ORDDATE, "
				+ "ORD_COUNT, SNO, MANUDATE, T_COUNT, REGDATE, PRICE_CONSUMER, "
				+ "PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO, SCNAME, MCNAME, SNAME "
				+ "FROM ORDERS "
				+ "NATURAL JOIN PRODUCT_INFO "
				+ "NATURAL JOIN PRODUCT "
				+ "NATURAL JOIN PRODUCT_ACCOUNT "
				+ "NATURAL JOIN SUB_CATEGORY "
				+ "NATURAL JOIN MAJOR_CATEGORY "
				+ "NATURAL JOIN SHOP "
				+ "ORDER BY orddate DESC, LENGTH(ordno) desc, ordno DESC "
				+ "LIMIT 1");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
				String mcno = rs.getString("MCNO");
				String scno = rs.getString("SCNO");
				String pnoAccount = rs.getString("PNO_ACCOUNT");
				String pno = rs.getString("PNO");
				int pnoInfo = rs.getInt("PNO_INFO");
				String ordno = rs.getString("ORDNO");
				String ordDate = rs.getString("ORDDATE");
				int ordCount = rs.getInt("ORD_COUNT");
				String sno = rs.getString("SNO");
				String manudate = rs.getString("MANUDATE");
				int tCount = rs.getInt("T_COUNT");
				String regdate = rs.getString("REGDATE");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String pname = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accno = rs.getString("ACCNO");
				String scname = rs.getString("SCNAME");
				String mcname = rs.getString("MCNAME");
				String sname = rs.getString("SNAME");
			
			vo = new OrderListVO(mcno, scno, pnoAccount, pno, pnoInfo, ordno, ordDate, ordCount, sno, manudate, tCount, regdate, priceConsumer, pname, priceServer, expirydate, accno, scname, mcname, sname);
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return vo;
	}
	
	public void addOne(OrderListVO vo) {
		sb.setLength(0);
		sb.append("SELECT PNO_INFO  "
				+ "FROM PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT  "
				+ "NATURAL JOIN PRODUCT_ACCOUNT  "
				+ "WHERE PNO = ?  "
				+ "ORDER BY MANUDATE DESC LIMIT 1");
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getPno());
			rs = pstmt.executeQuery();
			rs.next();
			int pnoInfo = rs.getInt("PNO_INFO");
			
			sb.setLength(0);
			sb.append("INSERT INTO ORDERS VALUES ( ?, NOW(), ?, ?, ? )");
			/* 			 ORDNO, ORDDATE, ORD_COUNT, PNO_INFO, SNO */
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, vo.getOrdno());
					pstmt.setInt(2, vo.getOrdCount());
					pstmt.setInt(3, pnoInfo);
					pstmt.setString(4, vo.getSno());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
