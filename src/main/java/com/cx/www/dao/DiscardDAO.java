package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.DiscardMonthVO;
import com.cx.www.vo.DiscardVO;

public class DiscardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public DiscardDAO() {
		conn = DBConnection.getConnection();
		 System.out.println("conn : " +conn);
	}
	
	public ArrayList<DiscardVO> getOneday(String discardDate, String sno) {
		ArrayList<DiscardVO> list = new ArrayList<DiscardVO>();
		DiscardVO vo = null;
		sb.setLength(0);
		sb.append("select DISCARD.DISCARDNO, STOCK.STOCKNO, SUBSTRING(STOCK.STOCKNO,1,5) AS SNO, DISCARD.DISCARD_DATE, PRODUCT_INFO.MANUDATE, PRODUCT_ACCOUNT.PNAME, ACCOUNTS.ACCNAME, DISCARD.DISCARD_COUNT, PRODUCT_ACCOUNT.PRICE_SERVER, DISCARD.DISCARD_COUNT * PRODUCT_ACCOUNT.PRICE_SERVER as sum "
				+ "from STOCK join DISCARD on STOCK.STOCKNO = DISCARD.STOCKNO "
				+ "join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO "
				+ "join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO "
				+ "join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT "
				+ "join ACCOUNTS on PRODUCT_ACCOUNT.ACCNO = ACCOUNTS.ACCNO "
				+ "where DISCARD_DATE = ? AND SUBSTRING(STOCK.STOCKNO,1,5) = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, discardDate);
			pstmt.setString(2, sno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String discardNo = rs.getString("DISCARDNO");
				String stockNO = rs.getString("STOCKNO");
				String manuDate = rs.getString("MANUDATE");
				String pname = rs.getString("PNAME");
				String accName = rs.getString("ACCNAME");
				int discardCount = rs.getInt("DISCARD_COUNT");
				int priceServer = rs.getInt("PRICE_SERVER");
				int sum = rs.getInt("sum");
				
				vo = new DiscardVO(discardNo, stockNO, sno, discardDate, manuDate, pname, accName, discardCount, priceServer, sum);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	public ArrayList<DiscardMonthVO> getOneMonth(String date, String sno){
		
		ArrayList<DiscardMonthVO> listMonth = new ArrayList<DiscardMonthVO>();
		DiscardMonthVO vo = null;
		
		date += "%"; 
		sb.setLength(0);
		
		sb.append("SELECT LEFT(DISCARD.DISCARD_DATE, 10) AS DISCARD_DATE, SUM(DISCARD_COUNT) AS SUM, SUM(PRODUCT_ACCOUNT.PRICE_SERVER * DISCARD.DISCARD_COUNT) AS TOTALSUM, SUBSTRING(STOCK.STOCKNO,1,5) AS SNO FROM DISCARD "
				+ "join STOCK ON STOCK.STOCKNO = DISCARD.STOCKNO "
				+ "join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO "
				+ "join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO "
				+ "join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT "
				+ "where DISCARD.DISCARD_DATE like ? and SUBSTRING(STOCK.STOCKNO,1,5) = ? "
				+ "GROUP BY DISCARD.DISCARD_DATE ORDER BY DISCARD.DISCARD_DATE");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, date);
			pstmt.setString(2, sno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String discardDate = rs.getString("DISCARD_DATE");
				int sum = rs.getInt("sum");
				int totalsum = rs.getInt("totalsum");
				
				vo = new DiscardMonthVO(discardDate, sum, totalsum);
				listMonth.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return listMonth;
	}
	
	public void close() {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}	
	
}//class end
