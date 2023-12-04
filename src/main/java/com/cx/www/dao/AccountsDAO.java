package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.AccountsVO;

public class AccountsDAO {
	private static Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public AccountsDAO() {
		conn = DBConnection.getConnection();
	}
	
	// 총 거래처 수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM ACCOUNTS");
		
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
	
	public ArrayList<AccountsVO> getAll() {
		ArrayList<AccountsVO> list = new ArrayList<AccountsVO>();
		
		sb.setLength(0);
		sb.append("SELECT ACCNO, ACCNAME, ACCCEO, ACCCEOPHONE, ACCHEAD, ACCHEADPHONE, ACCLOC, ACCSTORAGELOC FROM ACCOUNTS ORDER BY LENGTH(ACCNO), ACCNO");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String accNo = rs.getString("ACCNO");
				String accName = rs.getString("ACCNAME");
				String accCeo = rs.getString("ACCCEO");
				String accCeoPhone = rs.getString("ACCCEOPHONE");
				String accHead = rs.getString("ACCHEAD");
				String accHeadPhone = rs.getString("ACCHEADPHONE");
				String accLoc = rs.getString("ACCLOC");
				String accStorageLoc = rs.getString("ACCSTORAGELOC");
				
				AccountsVO vo = new AccountsVO(accNo, accName, accCeo, accCeoPhone, accHead, accHeadPhone, accLoc, accStorageLoc);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<AccountsVO> getAll(int startNo, int count) {
		ArrayList<AccountsVO> list = new ArrayList<AccountsVO>();
		
		sb.setLength(0);
		sb.append("SELECT ACCNO, ACCNAME, ACCCEO, ACCCEOPHONE, ACCHEAD, ACCHEADPHONE, ACCLOC, ACCSTORAGELOC FROM ACCOUNTS ORDER BY LENGTH(ACCNO), ACCNO LIMIT ?, ?");
		// 1행이 0, startN0 행부터 20개
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				String accNo = rs.getString("ACCNO");
				String accName = rs.getString("ACCNAME");
				String accCeo = rs.getString("ACCCEO");
				String accCeoPhone = rs.getString("ACCCEOPHONE");
				String accHead = rs.getString("ACCHEAD");
				String accHeadPhone = rs.getString("ACCHEADPHONE");
				String accLoc = rs.getString("ACCLOC");
				String accStorageLoc = rs.getString("ACCSTORAGELOC");
				
				AccountsVO vo = new AccountsVO(accNo, accName, accCeo, accCeoPhone, accHead, accHeadPhone, accLoc, accStorageLoc);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public AccountsVO getOne(String accNo) {
		AccountsVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT ACCNO, ACCNAME, ACCCEO, ACCCEOPHONE, ACCHEAD, ACCHEADPHONE, ACCLOC, ACCSTORAGELOC FROM ACCOUNTS WHERE ACCNO=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, accNo);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String accName = rs.getString("ACCNAME");
				String accCeo = rs.getString("ACCCEO");
				String accCeoPhone = rs.getString("ACCCEOPHONE");
				String accHead = rs.getString("ACCHEAD");
				String accHeadPhone = rs.getString("ACCHEADPHONE");
				String accLoc = rs.getString("ACCLOC");
				String accStorageLoc = rs.getString("ACCSTORAGELOC");
				
				vo = new AccountsVO(accNo, accName, accCeo, accCeoPhone, accHead, accHeadPhone, accLoc, accStorageLoc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public void addOne(AccountsVO vo) {
		
		sb.setLength(0);
		sb.append("SELECT ACCNO FROM ACCOUNTS ORDER BY LENGTH(ACCNO) DESC, ACCNO DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				String accno = rs.getString("ACCNO");
				int accnoSeq = Integer.parseInt(accno.substring(3));
				accnoSeq++;
				accno = "ACC" + accnoSeq;
				
				sb.setLength(0);
				sb.append("INSERT INTO ACCOUNTS VALUES (?,?,?,?,?,?,?,?)");
				
				pstmt = conn.prepareStatement(sb.toString());
					pstmt.setString(1, accno);
					pstmt.setString(2, vo.getAccName());
					pstmt.setString(3, vo.getAccCeo());
					pstmt.setString(4, vo.getAccCeoPhone());
					pstmt.setString(5, vo.getAccHead());
					pstmt.setString(6, vo.getAccHeadPhone());
					pstmt.setString(7, vo.getAccLoc());
					pstmt.setString(8, accno);
				pstmt.executeUpdate();	
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String accNo) {
		sb.setLength(0);
		sb.append("DELETE FROM ACCOUNTS WHERE ACCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, accNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateName(AccountsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ACCOUNTS SET ACCNAME=? WHERE ACCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getAccName());
				pstmt.setString(2, vo.getAccNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateCEO(AccountsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ACCOUNTS SET ACCCEO=?, ACCCEOPHONE=? WHERE ACCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getAccCeo());
				pstmt.setString(2, vo.getAccCeoPhone());
				pstmt.setString(3, vo.getAccNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateHead(AccountsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ACCOUNTS SET ACCHEAD=?, ACCHEADPHONE=? WHERE ACCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getAccHead());
				pstmt.setString(2, vo.getAccHeadPhone());
				pstmt.setString(3, vo.getAccNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateLoc(AccountsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ACCOUNTS SET ACCLOC=? WHERE ACCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getAccLoc());
				pstmt.setString(2, vo.getAccNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateStorageLoc(AccountsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ACCOUNTS SET ACCSTORAGELOC=? WHERE ACCNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getAccStorageLoc());
				pstmt.setString(2, vo.getAccNo());
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
