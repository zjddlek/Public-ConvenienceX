package com.cx.www.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.AttendanceRecodVO;
import com.cx.www.vo.AttendanceVO;

public class AttendanceDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public AttendanceDAO() {
		conn = DBConnection.getConnection();
	}

	public ArrayList<AttendanceVO> getAll() {
		sb.setLength(0);
		sb.append("select * from ATTENDANCE");
		ArrayList<AttendanceVO> list = new ArrayList<AttendanceVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AttendanceVO vo = new AttendanceVO(rs.getString("attno"), rs.getString("attstart"),
						rs.getString("attend"), rs.getString("empno"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<AttendanceRecodVO> getRecordAll(String sno) {
		sb.setLength(0);
		sb.append(
				" SELECT C.JOBNO, C.ENAME, A.ATTSTART,A.ATTEND, C.EMPNO, C.SNO FROM SHOP S JOIN CXEMP C JOIN ATTENDANCE A WHERE S.SNO = C.SNO AND C.EMPNO = A.EMPNO AND C.SNO=? ORDER BY A.ATTSTART DESC");
		ArrayList<AttendanceRecodVO> list = new ArrayList<AttendanceRecodVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AttendanceRecodVO vo = new AttendanceRecodVO(rs.getString("ename"), rs.getInt("jobno"),
						rs.getString("attstart"), rs.getString("attend"), rs.getString("empno"), rs.getString("sno"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public AttendanceVO getOne(String attno) {
		sb.setLength(0);
		sb.append("select * from ATTENDANCE where attno = ?");
		AttendanceVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, attno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new AttendanceVO(attno, rs.getString("attstart"), rs.getString("attend"), rs.getString("empno"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public AttendanceVO attGetOne(String empno) {
		sb.setLength(0);
		sb.append("select * from ATTENDANCE where empno =? ORDER BY LENGTH(ATTNO) DESC, ATTNO DESC LIMIT 1");
		AttendanceVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new AttendanceVO(rs.getString("attno"), rs.getString("attstart"), rs.getString("attend"), empno);
				// System.out.println(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void addOne(AttendanceVO vo) {
		sb.setLength(0);
		sb.append("SELECT ATTNO, ATTSTART, ATTEND FROM ATTENDANCE ORDER BY LENGTH(ATTNO) DESC, ATTNO DESC LIMIT 1");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String attno = rs.getString("ATTNO");
				int attnoSeq = Integer.parseInt(attno.substring(3));
				attnoSeq++;
				attno = "ATT" + attnoSeq;

				sb.setLength(0);
				sb.append("insert into ATTENDANCE(attno, attstart,empno) values (?,now(),?)");
				pstmt = conn.prepareStatement(sb.toString());

				pstmt.setString(1, attno);
				pstmt.setString(2, vo.getEmpno());

				pstmt.executeUpdate();

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteOne(String attno) {
		sb.setLength(0);
		sb.append("delete from ATTENDANCE where attno=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, attno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateOne(AttendanceVO vo) {
		sb.setLength(0);
		sb.append("update ATTENDANCE set  attend=? where attno=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getAttstart());
			pstmt.setString(2, vo.getAttend());
			pstmt.setString(3, vo.getAttno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateStart(AttendanceVO vo) {
		sb.setLength(0);
		sb.append("update ATTENDANCE set attstart=now() where empno=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getEmpno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateEnd(AttendanceVO vo) {
		sb.setLength(0);
		sb.append("update ATTENDANCE set attend=now() where empno=? and attno=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getEmpno());
			pstmt.setString(2, vo.getAttno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public ArrayList<AttendanceRecodVO> getRecordAll(String sno, int startno, int recordperpage) {
		sb.setLength(0);
		sb.append(
				" SELECT C.JOBNO, C.ENAME, A.ATTSTART,A.ATTEND, C.EMPNO, C.SNO FROM SHOP S JOIN CXEMP C JOIN ATTENDANCE A WHERE S.SNO = C.SNO AND C.EMPNO = A.EMPNO AND C.SNO=? ORDER BY A.ATTSTART DESC LIMIT ?, ? ");
		ArrayList<AttendanceRecodVO> list = new ArrayList<AttendanceRecodVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			pstmt.setInt(2, startno);
			pstmt.setInt(3, recordperpage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				AttendanceRecodVO vo = new AttendanceRecodVO(rs.getString("ename"), rs.getInt("jobno"),
						rs.getString("attstart"), rs.getString("attend"), rs.getString("empno"), rs.getString("sno"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotalCount(String sno) {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) CNT FROM SHOP S JOIN CXEMP C JOIN ATTENDANCE A WHERE S.SNO = C.SNO AND C.EMPNO = A.EMPNO AND C.SNO=? ");

		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
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
