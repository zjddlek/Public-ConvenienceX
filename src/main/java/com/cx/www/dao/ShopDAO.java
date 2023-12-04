package com.cx.www.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.vo.ShopVO;

public class ShopDAO {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://xe.cf5cxgodlgfu.ap-northeast-2.rds.amazonaws.com:3306/xe";
	String user = "scott";
	String password = "tigertiger1";

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public ShopDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	public ArrayList<ShopVO> getAll(){
		sb.setLength(0);
		sb.append("select * from SHOP");
		ArrayList<ShopVO> list = new ArrayList<ShopVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ShopVO vo = new ShopVO(rs.getString("sno"),rs.getString("sname"),rs.getString("businessnumber"),rs.getString("sloc"));
				list.add(vo);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ShopVO getOne(String sno) {
		sb.setLength(0);
		sb.append("select * from SHOP where sno =? ");
		ShopVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ShopVO(sno,rs.getString("sname"),rs.getString("businessnumber"),rs.getString("sloc"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public void addOne(ShopVO vo) {
		sb.setLength(0);
		sb.append("insert into SHOP values (?,?,?,?)");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getSno());
			pstmt.setString(2, vo.getSname());
			pstmt.setString(3, vo.getBusinessNumber());
			pstmt.setString(4, vo.getSloc());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteOne(String sno) {
		sb.setLength(0);
		sb.append("delete from SHOP where sno=?");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void updateOne(ShopVO vo) {
		sb.setLength(0);
		sb.append("update SHOP set sname=? , businessnumber=? , sloc=? where sno=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getSname());
			pstmt.setString(2, vo.getBusinessNumber());
			pstmt.setString(3, vo.getSloc());
			pstmt.setString(4, vo.getSno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
