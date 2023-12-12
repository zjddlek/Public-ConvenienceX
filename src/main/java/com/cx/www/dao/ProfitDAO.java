package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.ProfitVO;

public class ProfitDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public ProfitDAO() {
		conn = DBConnection.getConnection();
	}
	
	   
	
	
	
	public ArrayList<ProfitVO> getList() { // 리스트 가져오기
		ArrayList<ProfitVO> list = new ArrayList<ProfitVO>();
		ProfitVO vo = null;

		sb.setLength(0);		
		sb.append("SELECT * FROM CALCULATION ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {


			while (rs.next()) {

				int calno = rs.getInt("CALNO");
				String attno = rs.getString("ATTNO");
				int calculate = rs.getInt("CALCULATE");
				String caltime = rs.getString("CALTIME");
				int salesamount = rs.getInt("SALESAMOUNT");
				int difference = rs.getInt("DIFFERENCE");
				
				
			
				vo = new ProfitVO(calno, attno, calculate, caltime, salesamount, difference);

				list.add(vo);
				System.out.println(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
}
