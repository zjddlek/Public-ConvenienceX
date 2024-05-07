package com.cx.www.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.ProductAccountVO;

public class ProductAccountDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public ProductAccountDAO() {
		conn = DBConnection.getConnection();
	}
	
	// 총 거래처 수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM PRODUCT_ACCOUNT");
		
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
	
	public ArrayList<ProductAccountVO> getAll() {
		ArrayList<ProductAccountVO> list = new ArrayList<ProductAccountVO>();
		
		sb.setLength(0);
		sb.append("SELECT PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO FROM PRODUCT_ACCOUNT ORDER BY LENGTH(PNO_ACCOUNT), PNO_ACCOUNT");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String pNoAccount = rs.getString("PNO_ACCOUNT");
				String pName = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accNo = rs.getString("ACCNO");
				
				ProductAccountVO vo = new ProductAccountVO(pNoAccount, pName, priceServer, expirydate, accNo);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<ProductAccountVO> getAll(int startNo, int count) {
		ArrayList<ProductAccountVO> list = new ArrayList<ProductAccountVO>();
		
		sb.setLength(0);
		sb.append("SELECT PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO FROM PRODUCT_ACCOUNT ORDER BY LENGTH(PNO_ACCOUNT), PNO_ACCOUNT LIMIT ?, ?");
		// 1행이 0, startN0 행부터 20개
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String pNoAccount = rs.getString("PNO_ACCOUNT");
				String pName = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accNo = rs.getString("ACCNO");
				
				ProductAccountVO vo = new ProductAccountVO(pNoAccount, pName, priceServer, expirydate, accNo);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ProductAccountVO getOne(String pNoAccount) {
		ProductAccountVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT PNO_ACCOUNT, PNAME, PRICE_SERVER, EXPIRYDATE, ACCNO FROM PRODUCT_ACCOUNT WHERE PNO_ACCOUNT=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, pNoAccount);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String pName = rs.getString("PNAME");
				int priceServer = rs.getInt("PRICE_SERVER");
				String expirydate = rs.getString("EXPIRYDATE");
				String accNo = rs.getString("ACCNO");
				
				vo = new ProductAccountVO(pNoAccount, pName, priceServer, expirydate, accNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	public void addOne(ProductAccountVO vo) {
		
		sb.setLength(0);
		sb.append("SELECT PNO_ACCOUNT FROM PRODUCT_ACCOUNT ORDER BY LENGTH(PNO_ACCOUNT) DESC, PNO_ACCOUNT DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String pnoacc = rs.getString("PNO_ACCOUNT");
				int pnoaccSeq = Integer.parseInt(pnoacc.substring(12));
				pnoaccSeq++;
				pnoacc = "PNO_ACCOUNT_" + pnoaccSeq;
				
				sb.setLength(0);
				sb.append("INSERT INTO PRODUCT_ACCOUNT VALUES (?,?,?,?,?)");
				
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, pnoacc);
					pstmt.setString(2, vo.getPName());
					pstmt.setInt(3, vo.getPriceServer());
					pstmt.setString(4, vo.getExpirydate());
					pstmt.setString(5, vo.getAccNo());
				pstmt.executeUpdate();	
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String pNoAccount) {
		sb.setLength(0);
		sb.append("DELETE FROM PRODUCT_ACCOUNT WHERE PNO_ACCOUNT = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, pNoAccount);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateName(ProductAccountVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT_ACCOUNT SET PNAME=? WHERE PNO_ACCOUNT = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getPName());
				pstmt.setString(2, vo.getPNoAccount());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updatePriceServer(ProductAccountVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT_ACCOUNT SET PRICE_SERVER=? WHERE PNO_ACCOUNT = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getPriceServer());
				pstmt.setString(2, vo.getPNoAccount());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateExpirydate(ProductAccountVO vo) {
		sb.setLength(0);
		sb.append("UPDATE PRODUCT_ACCOUNT SET EXPIRYDATE=? WHERE PNO_ACCOUNT = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getExpirydate());
			pstmt.setString(2, vo.getPNoAccount());
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
