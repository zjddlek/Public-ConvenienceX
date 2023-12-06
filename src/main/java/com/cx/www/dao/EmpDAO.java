package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.EmpVO;



public class EmpDAO {

   EmpVO vo = null;

   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   private StringBuffer sb = new StringBuffer();

   public EmpDAO() {

      Context initCtx;
      conn = DBConnection.getConnection();
     // System.out.println("conn >>>> " + conn);

   }

   public void addOne(EmpVO vo) { // 사원등록

      sb.setLength(0);
      sb.append("INSERT INTO CXEMP values( ?,?,?,?,?,?,?,now(),?,?,?,?,?,? ) ");

      try {
         pstmt = conn.prepareStatement(sb.toString());

         pstmt.setString(1, vo.getEmpno());
         pstmt.setString(2, vo.getEname());
         pstmt.setString(3, vo.getDate());
         pstmt.setString(4, vo.getPhone());
         pstmt.setString(5, vo.getAddress());
         pstmt.setString(6, vo.getAddress_detail());
         pstmt.setString(7, vo.getEmail());
         //pstmt.setString(8, vo.getHiredate());
         pstmt.setString(8, vo.getIsretire());
         pstmt.setInt(9, vo.getSal_hour());
         pstmt.setString(10, vo.getId());
         pstmt.setString(11, vo.getPwd());
         pstmt.setString(12, vo.getSno());
         pstmt.setInt(13, vo.getJobno());

         pstmt.executeUpdate();

      } catch (SQLException e) {

         e.printStackTrace();
      }

   }

   public ArrayList<EmpVO> getAll() { // 사원 전체목록 조회
      ArrayList<EmpVO> list = new ArrayList<EmpVO>();

      sb.setLength(0);
      sb.append("SELECT * FROM CXEMP ");
      try {
         pstmt = conn.prepareStatement(sb.toString());

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      try {

         rs = pstmt.executeQuery();

         while (rs.next()) {

            String empno = rs.getString("empno");
            
            String ename = rs.getString("ename");
            String date = rs.getString("BIRTHDATE");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String address_detail = rs.getString("address_detail");
            String email = rs.getString("email");
            String hiredate = rs.getString("hiredate");
            String is_retire = rs.getString("ISRETIRE");
            int sal_hour = rs.getInt("sal_hour");
            String id = rs.getString("id");
            String pwd = rs.getString("PASSWORD");
            String sno = rs.getString("sno");
            int jobno = rs.getInt("JOBNO");
            String picture = rs.getString("picture");


            EmpVO vo = new EmpVO(empno, ename, date, phone, address, address_detail, email, hiredate, is_retire,
                  sal_hour, id, pwd, sno, jobno,picture);
            
   
            
            list.add(vo);
         }

      } catch (

      SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return list;

   }

   public EmpVO getOne(String ename) { // 사원이름으로 정보검색

      sb.setLength(0);
      sb.append("SELECT * FROM CXEMP WHERE ename=? ");
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, ename);

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      try {

         rs = pstmt.executeQuery();
         
      
         while (rs.next()) {
               String empno = rs.getString("empno");
               String date = rs.getString("BIRTHDATE");
               String phone = rs.getString("phone");
               String address = rs.getString("address");
               String address_detail = rs.getString("address_detail");
               String email = rs.getString("email");
               String hiredate = rs.getString("hiredate");
               String is_retire = rs.getString("isretire");
               int sal_hour = rs.getInt("sal_hour");
               String id = rs.getString("id");
               String pwd = rs.getString("PASSWORD");
               String sno = rs.getString("sno");
               int jobno = rs.getInt("jobno");
               String picture = rs.getString("picture");


               vo = new EmpVO(empno, ename, date, phone, address, address_detail, email, hiredate, is_retire, sal_hour, id, pwd, sno, jobno,picture);
            
               
            
         }
      } catch (

      SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return vo;

   }
   
   public EmpVO getOneByEmpno(String empno) { // 사원번호로 정보검색
	      sb.setLength(0);
	      sb.append("SELECT * FROM CXEMP WHERE empno=? ");
	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, empno);

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }

	      try {

	         rs = pstmt.executeQuery();
	         
	      
	         while (rs.next()) {
	               String ename = rs.getString("ename");
	               String date = rs.getString("BIRTHDATE");
	               String phone = rs.getString("phone");
	               String address = rs.getString("address");
	               String address_detail = rs.getString("address_detail");
	               String email = rs.getString("email");
	               String hiredate = rs.getString("hiredate");
	               String is_retire = rs.getString("isretire");
	               int sal_hour = rs.getInt("sal_hour");
	               String id = rs.getString("id");
	               String pwd = rs.getString("PASSWORD");
	               String sno = rs.getString("sno");
	               int jobno = rs.getInt("jobno");
	               String picture = rs.getString("picture");
	               

	               vo = new EmpVO(empno, ename, date, phone, address, address_detail, email, hiredate, is_retire, sal_hour, id, pwd, sno, jobno,picture);
	            
	               
	            
	         }
	      } catch (

	      SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      
	      return vo;

	   }
   
// 점장로그인용
   public EmpVO getOneSM(String id, String pwd) { 

      sb.setLength(0);
      sb.append("SELECT * FROM CXEMP WHERE ID=? and PASSWORD=?");
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, id);
         pstmt.setString(2, pwd);

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      try {

         rs = pstmt.executeQuery();
         
      
         while (rs.next()) {
            String empno = rs.getString("empno");
            String ename = rs.getString("ename");
            String date = rs.getString("birthdate");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String address_detail = rs.getString("address_detail");
            String email = rs.getString("email");
            String giredate = rs.getString("hiredate");
            String is_retire = rs.getString("isretire");
            int sal_hour = rs.getInt("sal_hour");
            String sno = rs.getString("sno");
            int jobno = rs.getInt("jobno");
            String picture = rs.getString("picture");

            vo = new EmpVO(empno, ename, date, phone, address, address_detail, email, giredate, is_retire, sal_hour,
                  id, pwd, sno, jobno,picture);
         }
      } catch (

      SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return vo;


   }

   public  ArrayList<EmpVO> getAllByDate(String startDate, String endDate) { // 근무일자로 정보검색
      ArrayList<EmpVO> list = new ArrayList<EmpVO>();

      sb.setLength(0);
      sb.append("SELECT * FROM CXEMP WHERE HIREDATE BETWEEN ? AND ?");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setDate(1, java.sql.Date.valueOf(startDate));
         pstmt.setDate(2, java.sql.Date.valueOf(endDate));

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      try {

         rs = pstmt.executeQuery();

         while (rs.next()) {
            
            String empno = rs.getString("empno");
            
            String ename = rs.getString("ename");
            String date = rs.getString("BIRTHDATE");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String address_detail = rs.getString("address_detail");
            String email = rs.getString("email");
            String hiredate = rs.getString("hiredate");
            String is_retire = rs.getString("ISRETIRE");
            int sal_hour = rs.getInt("sal_hour");
            String id = rs.getString("id");
            String pwd = rs.getString("PASSWORD");
            String sno = rs.getString("sno");
            int jobno = rs.getInt("JOBNO");
            String picture = rs.getString("picture");

            
            EmpVO vo = new EmpVO(empno, ename, date, phone, address, address_detail, email, hiredate, is_retire,
                  sal_hour, id, pwd, sno, jobno,picture);
            
            
            
            list.add(vo);
         }

      } catch (

      SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return list;

   }
   
   public void modifyOne(EmpVO vo) { // 사원번호로 사원정보 수정
      sb.setLength(0);
      sb.append("UPDATE CXEMP SET ENAME=?, BIRTHDATE=?, PHONE=?, ADDRESS=?, ADDRESS_DETAIL=?, EMAIL=?, HIREDATE=?, ISRETIRE=?, SAL_HOUR=?, ID=?, PASSWORD=?, SNO=?, JOBNO=? WHERE EMPNO=? ");

      try {
         pstmt = conn.prepareStatement(sb.toString());

         pstmt.setString(1, vo.getEname());
         pstmt.setString(2, vo.getDate());
         pstmt.setString(3, vo.getPhone());
         pstmt.setString(4, vo.getAddress());
         pstmt.setString(5, vo.getAddress_detail());
         pstmt.setString(6, vo.getEmail());
         pstmt.setString(7, vo.getHiredate());
         pstmt.setString(8, vo.getIsretire());
         pstmt.setInt(9, vo.getSal_hour());
         pstmt.setString(10, vo.getId());
         pstmt.setString(11, vo.getPwd());
         pstmt.setString(12, vo.getSno());
         pstmt.setInt(13, vo.getJobno());
         pstmt.setString(14, vo.getEmpno());
         

         
         pstmt.executeUpdate();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

   }

   public void deleteOne(String empno) { // 사원정보 삭제
      sb.setLength(0);
      sb.append("DELETE from CXEMP WHERE EMPNO=?");

      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, empno);

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