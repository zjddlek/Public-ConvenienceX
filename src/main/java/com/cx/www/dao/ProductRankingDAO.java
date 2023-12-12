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
		sb.append("SELECT COUNT(*) CNT "
				+ "FROM (SELECT COUNT(*)  "
				+ " FROM SALES SA, SALES_DETAIL SAD, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, SUB_CATEGORY SC, MAJOR_CATEGORY MC, ACCOUNTS AC  "
				+ "	WHERE SA.SALENO = SAD.SALENO  "
				+ "	AND SAD.STOCKNO = ST.STOCKNO  "
				+ "	AND ST.PNO_INFO = PI.PNO_INFO  "
				+ "	AND PI.PNO = P.PNO  "
				+ "	AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT  "
				+ "	AND P.SCNO = SC.SCNO  "
				+ "	AND SC.MCNO = MC.MCNO  "
				+ "	AND AC.ACCNO = PA.ACCNO  "
				+ "	GROUP BY PNAME) AA");
		
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
		sb.append("SELECT AA.MCNAME, AA.SCNAME, AA.ACCNAME, AA.PNO, AA.PNAME, SUM(AA.CNT) TOTAL, AA.PRICE_SERVER, AA.PRICE_CONSUMER, AA.EXPIRYDATE, AA.REGDATE "
				+ "FROM (SELECT MC.MCNAME, SC.SCNAME, AC.ACCNAME, P.PNO,  PA.PNAME, SAD.CNT, PA.PRICE_SERVER, P.PRICE_CONSUMER, PA.EXPIRYDATE, P.REGDATE "
				+ "    FROM SALES SA, SALES_DETAIL SAD, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, SUB_CATEGORY SC, MAJOR_CATEGORY MC, ACCOUNTS AC "
				+ "    WHERE SA.SALENO = SAD.SALENO "
				+ "    AND SAD.STOCKNO = ST.STOCKNO "
				+ "    AND ST.PNO_INFO = PI.PNO_INFO "
				+ "    AND PI.PNO = P.PNO "
				+ "    AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "    AND P.SCNO = SC.SCNO "
				+ "    AND SC.MCNO = MC.MCNO "
				+ "    AND AC.ACCNO = PA.ACCNO) AA "
				+ "GROUP BY AA.PNAME "
				+ "ORDER BY TOTAL DESC, REGDATE DESC ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pNo = rs.getString("PNO");
				String pName = rs.getString("PNAME");
				int total = rs.getInt("TOTAL");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String expirydate = rs.getString("EXPIRYDATE");
				String regdate = rs.getString("REGDATE");
				
				ProductRankingVO vo = new ProductRankingVO(mcName, scName, accName, pNo, pName, total, priceServer, priceConsumer, expirydate, regdate);
				
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
		sb.append("SELECT AA.MCNAME, AA.SCNAME, AA.ACCNAME, AA.PNO, AA.PNAME, SUM(AA.CNT) TOTAL, AA.PRICE_SERVER, AA.PRICE_CONSUMER, AA.EXPIRYDATE, AA.REGDATE "
				+ "FROM (SELECT MC.MCNAME, SC.SCNAME, AC.ACCNAME, P.PNO,  PA.PNAME, SAD.CNT, PA.PRICE_SERVER, P.PRICE_CONSUMER, PA.EXPIRYDATE, P.REGDATE "
				+ "    FROM SALES SA, SALES_DETAIL SAD, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, SUB_CATEGORY SC, MAJOR_CATEGORY MC, ACCOUNTS AC "
				+ "    WHERE SA.SALENO = SAD.SALENO "
				+ "    AND SAD.STOCKNO = ST.STOCKNO "
				+ "    AND ST.PNO_INFO = PI.PNO_INFO "
				+ "    AND PI.PNO = P.PNO "
				+ "    AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "    AND P.SCNO = SC.SCNO "
				+ "    AND SC.MCNO = MC.MCNO "
				+ "    AND AC.ACCNO = PA.ACCNO) AA "
				+ "GROUP BY AA.PNAME "
				+ "ORDER BY TOTAL DESC, REGDATE DESC "
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
				String pNo = rs.getString("PNO");
				String pName = rs.getString("PNAME");
				int total = rs.getInt("TOTAL");
				int priceServer = rs.getInt("PRICE_SERVER");
				int priceConsumer = rs.getInt("PRICE_CONSUMER");
				String expirydate = rs.getString("EXPIRYDATE");
				String regdate = rs.getString("REGDATE");
				
				ProductRankingVO vo = new ProductRankingVO(mcName, scName, accName, pNo, pName, total, priceServer, priceConsumer, expirydate, regdate);
				
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
		sb.append("SELECT AA.MCNAME, AA.SCNAME, AA.ACCNAME, AA.PNAME, SUM(AA.CNT) TOTAL, AA.PRICE_SERVER, AA.PRICE_CONSUMER, AA.EXPIRYDATE, AA.REGDATE "
				+ "FROM (SELECT MC.MCNAME, SC.SCNAME, AC.ACCNAME, PA.PNAME, SAD.CNT, PA.PRICE_SERVER, P.PRICE_CONSUMER, PA.EXPIRYDATE, P.REGDATE "
				+ "    FROM SALES SA, SALES_DETAIL SAD, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, SUB_CATEGORY SC, MAJOR_CATEGORY MC, ACCOUNTS AC "
				+ "    WHERE SA.SALENO = SAD.SALENO "
				+ "    AND SAD.STOCKNO = ST.STOCKNO "
				+ "    AND ST.PNO_INFO = PI.PNO_INFO "
				+ "    AND PI.PNO = P.PNO "
				+ "    AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT "
				+ "    AND P.SCNO = SC.SCNO "
				+ "    AND SC.MCNO = MC.MCNO "
				+ "    AND AC.ACCNO = PA.ACCNO) AA "
				+ "GROUP BY AA.PNAME "
				+ "ORDER BY TOTAL DESC, REGDATE DESC "
				+ "LIMIT 6");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String mcName = rs.getString("MCNAME");
				String scName = rs.getString("SCNAME");
				String accName = rs.getString("ACCNAME");
				String pName = rs.getString("PNAME");
				if ( pName.length() >=8 ) pName = pName.substring(0,8)+"...";
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
