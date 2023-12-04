	package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.SalesVO;

public class SalesDAO{
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	ArrayList<SalesVO> list = new ArrayList<SalesVO>();
	SalesVO vo = null;
	
	public SalesDAO() {
		Context initCtx;
		
		// conn을 DBConnection의 getConnection()으로 지정 ---> DBConnection을 만들었으니까 가져다 쓰기!
		conn = DBConnection.getConnection();
		System.out.println("conn : " + conn);
	}
	
	// 전체조회 - 페이징처리 o
	public ArrayList<SalesVO> getAll(int starNO, int endNO){
		sb.setLength(0);
		
		sb.append(" select SALENO, SALEDATE, STOCKNO ");
		sb.append(" from SALES ORDERS LIMIT ? OFFSET ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			// 1번이 끝번호 2번이 시작번호 
			pstmt.setInt(1, endNO);
			pstmt.setInt(2, starNO);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String saleno = rs.getString("saleno");
				String date = rs.getString("SALEDATE");
				String stockno = rs.getString("stockno");
				
				String salesdate = date.substring(0, 10);
				
				SalesVO vo = new SalesVO(saleno, salesdate, stockno);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 거래일자로 검색하기
	public ArrayList<SalesVO> getSalesList(String saleno, String salesdate){
		
		//System.out.println("dao : " +saleno);
		//System.out.println("dao : " +salesdate);
		
		//salesdate += "%";
		
		System.out.println("dao1 : " +salesdate);
		
		sb.setLength(0);
		sb.append(" select sd.DETAILNO, sd.SALENO, sd.PNO_INFO, sd.CNT, sd.ISREFUND, sd.DEALNO, s.SALEDATE ");
		sb.append(" from SALES_DETAIL sd ");
		sb.append(" RIGHT JOIN SALES s ");
		sb.append(" ON sd.? = s.? ");
		sb.append(" WHERE s.SALEDATE LIKE = ? ");
		
		/*
  	    -- 거래일자로 검색하기 ( sql에서 검색은 됨... 여기서는 계속 에러뜸 )
  	    SELECT * 
		FROM SALES_DETAIL SD
		RIGHT JOIN SALES S
		ON SD.SALENO = S.SALENO
		WHERE S.SALEDATE LIKE '2023-07%';
		*/
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, saleno);
			pstmt.setString(2, saleno);
			pstmt.setString(3, salesdate);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockno = rs.getString("stockno");
				int dealno = rs.getInt("dealno");
				int pno_info = rs.getInt("PNO_INFO");
				int detailno = rs.getInt("DETAILNO");
				String isrefund = rs.getString("isrefund");
				int cnt = rs.getInt("cnt");
				
				salesdate.substring(0,9);
				System.out.println("subString : " + salesdate);
				
				vo = new SalesVO(saleno, salesdate, stockno, dealno, pno_info, detailno, isrefund, cnt);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//거래번호로 검색하기
	public SalesVO getSalesDetail(String saleno){
		SalesVO vo = null;
		
		//salesdate += "%";
		
		sb.setLength(0);
		sb.append(" select sd.DETAILNO, sd.SALENO, sd.PNO_INFO, sd.CNT, sd.ISREFUND, sd.DEALNO, s.SALEDATE ");
		sb.append(" from SALES_DETAIL sd ");
		sb.append(" RIGHT JOIN SALES s ");
		sb.append(" ON sd.? = s.? ");
		sb.append(" WHERE s.SALEDATE LIKE = ? ");
		
		/*
  	    -- 거래번호로 검색하기 ( 
  	    select SALES_DETAIL.DETAILNO, SALES.SALENO, SALES_DETAIL.PNO_INFO, SALES_DETAIL.CNT, SALES_DETAIL.ISREFUND, SALES_DETAIL.DEALNO,
        PRODUCT_ACCOUNT.PNAME, PRODUCT_ACCOUNT.PRICE_SERVER
		from SALES_DETAIL 
		JOIN SALES ON SALES_DETAIL.SALENO = SALES.SALENO
		join STOCK on STOCK.STOCKNO = SALES.STOCKNO
		join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO
		join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO 
		join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT 
		join ACCOUNTS on PRODUCT_ACCOUNT.ACCNO = ACCOUNTS.ACCNO
		where SALES_DETAIL.SALENO = '23110501'; 
		*/
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, saleno);
			pstmt.setString(2, saleno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockno = rs.getString("stockno");
				int dealno = rs.getInt("dealno");
				int pno_info = rs.getInt("PNO_INFO");
				int detailno = rs.getInt("DETAILNO");
				String isrefund = rs.getString("isrefund");
				int cnt = rs.getInt("cnt");
				String salesdate = rs.getString("salesdate");
				
				vo = new SalesVO(saleno, salesdate, stockno, dealno, pno_info, detailno, isrefund, cnt);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	
	public void close() {
		try {
		
			if(rs != null) {
				rs.close();
			}	
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) as cnt from SALES ");
		
		// 카운트 초기화
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
}
