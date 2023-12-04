package com.cx.www.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

import cxcom.cx.www.action.Action;

public class RegisterOkAction implements Action{

	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String empno = req.getParameter("empno");
		String ename = req.getParameter("ename");
		String date = req.getParameter("date");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String address_detail = req.getParameter("address_detail");
		String email = req.getParameter("email");
		String hiredate = req.getParameter("hiredate");
		String isretire = req.getParameter("isretire");
		String sal_hour1 = req.getParameter("sal_hour");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String sno = req.getParameter("sno");
		String jobno1 = req.getParameter("jobno");

		int sal_hour = Integer.parseInt(sal_hour1);
		int jobno = Integer.parseInt(jobno1);

		EmpDAO dao = new EmpDAO();
		EmpVO vo = new EmpVO();

		vo.setEmpno(empno);
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

		dao.addOne(vo);

		dao.close();

		return "views/register.jsp";
	}
	
	

}
