package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
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
	
	
	public void close() {

		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	
	
	
}//class end
