package com.cx.www.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/registerController")
public class RegisterOkAction extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDir = req.getRealPath("/upload");
		int maxFileSize = 1024*1024*30;

		MultipartRequest mr=
				new MultipartRequest(req,saveDir,
						maxFileSize,"UTF-8", new DefaultFileRenamePolicy());
		


		//String empno = req.getParameter("empno");
		String ename = mr.getParameter("ename");
		String date = mr.getParameter("date");
		String phone = mr.getParameter("phone");
		String address = mr.getParameter("address");
		String address_detail = mr.getParameter("address_detail");
		String email = mr.getParameter("email");
		String hiredate = mr.getParameter("hiredate");
		String isretire = mr.getParameter("isretire");
		String sal_hour1 = mr.getParameter("sal_hour");
		String id = mr.getParameter("id");
		String pwd = mr.getParameter("pwd");
		String sno = mr.getParameter("sno");
		String jobno1 = mr.getParameter("jobno");
		//String picture = mr.getParameter("picture");

		String picture = mr.getOriginalFileName("picture");

		
		int sal_hour = Integer.parseInt(sal_hour1);
		int jobno = Integer.parseInt(jobno1);

		EmpDAO dao = new EmpDAO();
		EmpVO vo = new EmpVO();

		//vo.setEmpno(empno);
		vo.setEname(ename);
		vo.setDate(date);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setAddress_detail(address_detail);
		vo.setEmail(email);
		vo.setHiredate(hiredate);
		vo.setIsretire(isretire);
		vo.setSal_hour(sal_hour);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setSno(sno);
		vo.setJobno(jobno);
		vo.setPicture(picture);
		
		dao.addOne(vo);

		//System.out.println(vo);
		dao.close();
		
		
	}

	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
