package com.cx.www.emp;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;


public class ListAction  implements Action{

   public String execute(HttpServletRequest req, HttpServletResponse resp) {

      String name = req.getParameter("name");
      String period = req.getParameter("period");
      String period2 = req.getParameter("period2");
      String sno = req.getParameter("sno");
      String jobno = req.getParameter("jobno"); 
      
      int jobno1 = 0;
      
      System.out.println("jobno : " + jobno);
      System.out.println("sno : " + sno);

      
      if( jobno != null && !jobno.isEmpty()) {
    	  jobno1=Integer.parseInt(jobno);
      }
      
      
      EmpDAO dao = new EmpDAO();
		/*
		 * System.out.println(name); System.out.println(period);
		 * System.out.println(period2);
		 */
      
      if (name == null  || name.isEmpty()) {
         
         if( period != null && period2 != null)
         {
            
            ArrayList<EmpVO> list= dao.getAllByDate(period,period2,sno);
            //System.out.println(list == null ? "empty" : "not empty");
            //System.out.println(list.isEmpty()? "empty" : "not empty");
   
            req.setAttribute("list",list);
            
            System.out.println(sno);
            System.out.println("period list:"+list);
         }
         
         else    
         {
            ArrayList<EmpVO> list= dao.getAllByJobno(sno,jobno1);
            req.setAttribute("list",list);
         }
         
      }
      else if(name != null ) {
         EmpVO empvo = dao.getOne(name);

         
         req.setAttribute("empvo", empvo);    

         System.out.println("empvo vo:"+empvo);
      
         
      }
      
      
    
      
      dao.close();
      
      return "emp/empList.jsp";
   }

}