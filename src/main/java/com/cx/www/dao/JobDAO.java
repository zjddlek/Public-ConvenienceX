package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.JobVO;

public class JobDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public JobDAO() {
		conn = DBConnection.getConnection();
	}
	
	public ArrayList<JobVO> getAll(){
		sb.setLength(0);
		sb.append("select * from JOB");
		ArrayList<JobVO> list = new ArrayList<JobVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JobVO vo = new JobVO(rs.getInt("jobno"),rs.getString("jobname"));
				list.add(vo);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public JobVO getOne(int jobno) {
		sb.setLength(0);
		sb.append("select * from JOB where sno = ?");
		JobVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, jobno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new JobVO(jobno,rs.getString("jobname"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public void addOne(JobVO vo) {
		sb.setLength(0);
		sb.append("insert into JOB values (?,?)");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getJobno());
			pstmt.setString(2, vo.getJobName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteOne(int jobno) {
		sb.setLength(0);
		sb.append("delete from JOB where sno=?");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, jobno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void updateOne(JobVO vo) {
		sb.setLength(0);
		sb.append("update JOB set jobname=? where jobno=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getJobName());
			pstmt.setInt(2, vo.getJobno());
			
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
