package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.AllProductVO;
import com.cx.www.vo.ProductRankingVO;

public class ProductRankingDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public ProductRankingDAO() {
		conn = DBConnection.getConnection();
	}
	
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM (SELECT R.MCNAME, R.SCNAME, R.ACCNAME, R.PNAME, SUM(R.CNT) TOTAL, R.PRICE_SERVER, R.PRICE_CONSUMER, R.EXPIRYDATE, R.REGDATE "
				+ "FROM (SELECT SAD.DETAILNO, SAD.SALENO, SAD.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE, SA.STOCKNO, ST.STOCK_COUNT, PI.PNO, PI.MANUDATE,  "
				+ "PI.T_COUNT, P.REGDATE, P.PRICE_CONSUMER, P.PNO_ACCOUNT, P.SCNO, P.MCNO, SC.SCNAME, MC.MCNAME, PA.PNAME, PA.PRICE_SERVER, PA.EXPIRYDATE, "
				+ "A.ACCNAME, A.ACCCEO, A.ACCCEOPHONE, A.ACCHEAD, A.ACCHEADPHONE, A.ACCLOC, A.ACCSTORAGELOC "
				+ "	FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A, SUB_CATEGORY SC, MAJOR_CATEGORY MC "
				+ "	WHERE SAD.SALENO = SA.SALENO "
				+ "	AND SA.STOCKNO = ST.STOCKNO "
				+ "	AND ST.PNO_INFO = PI.PNO_INFO "
				+ "	AND PI.PNO = P.PNO "
				+ "	AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "	AND PA.ACCNO = A.ACCNO "
				+ "	AND MC.MCNO = SC.MCNO "
				+ "	AND SC.SCNO = P.SCNO) R "
				+ "GROUP BY R.PNAME "
				+ "ORDER BY SUM(R.CNT) DESC) TC");
		
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
	
	public ArrayList<ProductRankingVO> getAll() {
		ArrayList<ProductRankingVO> list = new ArrayList<ProductRankingVO>();
		
		sb.setLength(0);
		sb.append("SELECT R.MCNAME, R.SCNAME, R.ACCNAME, R.PNAME, SUM(R.CNT) TOTAL, R.PRICE_SERVER, R.PRICE_CONSUMER, R.EXPIRYDATE, R.REGDATE "
				+ "FROM (SELECT SAD.DETAILNO, SAD.SALENO, SAD.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE, SA.STOCKNO, ST.STOCK_COUNT, PI.PNO, PI.MANUDATE,  "
				+ "PI.T_COUNT, P.REGDATE, P.PRICE_CONSUMER, P.PNO_ACCOUNT, P.SCNO, P.MCNO, SC.SCNAME, MC.MCNAME, PA.PNAME, PA.PRICE_SERVER, PA.EXPIRYDATE, "
				+ "A.ACCNAME, A.ACCCEO, A.ACCCEOPHONE, A.ACCHEAD, A.ACCHEADPHONE, A.ACCLOC, A.ACCSTORAGELOC "
				+ "	FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A, SUB_CATEGORY SC, MAJOR_CATEGORY MC "
				+ "	WHERE SAD.SALENO = SA.SALENO "
				+ "	AND SA.STOCKNO = ST.STOCKNO "
				+ "	AND ST.PNO_INFO = PI.PNO_INFO "
				+ "	AND PI.PNO = P.PNO "
				+ "	AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "	AND PA.ACCNO = A.ACCNO "
				+ "	AND MC.MCNO = SC.MCNO "
				+ "	AND SC.SCNO = P.SCNO) R "
				+ "GROUP BY R.PNAME "
				+ "ORDER BY SUM(R.CNT) DESC ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				int total = rs.getInt("TOTAL");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String expirydate = rs.getString("EXPIRYDATE");
				String regdate = rs.getString("REGDATE");
				
				ProductRankingVO vo = new ProductRankingVO(mcName, scName, accName, pName, total, priceServer, priceConsumer, expirydate, regdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<ProductRankingVO> getAll(int startNo, int recordPerPage) {
		ArrayList<ProductRankingVO> list = new ArrayList<ProductRankingVO>();
		
		sb.setLength(0);
		sb.append("SELECT R.MCNAME, R.SCNAME, R.ACCNAME, R.PNAME, SUM(R.CNT) TOTAL, R.PRICE_SERVER, R.PRICE_CONSUMER, R.EXPIRYDATE, R.REGDATE "
				+ "FROM (SELECT SAD.DETAILNO, SAD.SALENO, SAD.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE, SA.STOCKNO, ST.STOCK_COUNT, PI.PNO, PI.MANUDATE,  "
				+ "PI.T_COUNT, P.REGDATE, P.PRICE_CONSUMER, P.PNO_ACCOUNT, P.SCNO, P.MCNO, SC.SCNAME, MC.MCNAME, PA.PNAME, PA.PRICE_SERVER, PA.EXPIRYDATE, "
				+ "A.ACCNAME, A.ACCCEO, A.ACCCEOPHONE, A.ACCHEAD, A.ACCHEADPHONE, A.ACCLOC, A.ACCSTORAGELOC "
				+ "	FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A, SUB_CATEGORY SC, MAJOR_CATEGORY MC "
				+ "	WHERE SAD.SALENO = SA.SALENO "
				+ "	AND SA.STOCKNO = ST.STOCKNO "
				+ "	AND ST.PNO_INFO = PI.PNO_INFO "
				+ "	AND PI.PNO = P.PNO "
				+ "	AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "	AND PA.ACCNO = A.ACCNO "
				+ "	AND MC.MCNO = SC.MCNO "
				+ "	AND SC.SCNO = P.SCNO) R "
				+ "GROUP BY R.PNAME "
				+ "ORDER BY SUM(R.CNT) DESC "
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
				int total = rs.getInt("TOTAL");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String expirydate = rs.getString("EXPIRYDATE");
				String regdate = rs.getString("REGDATE");
				
				ProductRankingVO vo = new ProductRankingVO(mcName, scName, accName, pName, total, priceServer, priceConsumer, expirydate, regdate);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<ProductRankingVO> getSix() {
		ArrayList<ProductRankingVO> list = new ArrayList<ProductRankingVO>();
		
		sb.setLength(0);
		sb.append("SELECT R.MCNAME, R.SCNAME, R.ACCNAME, R.PNAME, SUM(R.CNT) TOTAL, R.PRICE_SERVER, R.PRICE_CONSUMER, R.EXPIRYDATE, R.REGDATE "
				+ "FROM (SELECT SAD.DETAILNO, SAD.SALENO, SAD.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE, SA.STOCKNO, ST.STOCK_COUNT, PI.PNO, PI.MANUDATE,  "
				+ "PI.T_COUNT, P.REGDATE, P.PRICE_CONSUMER, P.PNO_ACCOUNT, P.SCNO, P.MCNO, SC.SCNAME, MC.MCNAME, PA.PNAME, PA.PRICE_SERVER, PA.EXPIRYDATE, "
				+ "A.ACCNAME, A.ACCCEO, A.ACCCEOPHONE, A.ACCHEAD, A.ACCHEADPHONE, A.ACCLOC, A.ACCSTORAGELOC "
				+ "	FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A, SUB_CATEGORY SC, MAJOR_CATEGORY MC "
				+ "	WHERE SAD.SALENO = SA.SALENO "
				+ "	AND SA.STOCKNO = ST.STOCKNO "
				+ "	AND ST.PNO_INFO = PI.PNO_INFO "
				+ "	AND PI.PNO = P.PNO "
				+ "	AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "	AND PA.ACCNO = A.ACCNO "
				+ "	AND MC.MCNO = SC.MCNO "
				+ "	AND SC.SCNO = P.SCNO) R "
				+ "GROUP BY R.PNAME "
				+ "ORDER BY SUM(R.CNT) DESC "
				+ "LIMIT 6");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				int total = rs.getInt("TOTAL");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String expirydate = rs.getString("EXPIRYDATE");
				String regdate = rs.getString("REGDATE");
				
				ProductRankingVO vo = new ProductRankingVO(mcName, scName, accName, pName, total, priceServer, priceConsumer, expirydate, regdate);
				
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
