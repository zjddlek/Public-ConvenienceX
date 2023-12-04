package com.cx.www.emp;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

import cxcom.cx.www.action.Action;


public class ListAction  implements Action{

   public String execute(HttpServletRequest req, HttpServletResponse resp) {

      String name = req.getParameter("name");
      String period = req.getParameter("period");
      String period2 = req.getParameter("period2");
      
      EmpDAO dao = new EmpDAO();
		/*
		 * System.out.println(name); System.out.println(period);
		 * System.out.println(period2);
		 */
      
      if (name == null  || name.isEmpty()) {
         
         if( period != null && period2 != null)
         {
            
            ArrayList<EmpVO> list= dao.getAllByDate(period, period2 );
            //System.out.println(list == null ? "empty" : "not empty");
            //System.out.println(list.isEmpty()? "empty" : "not empty");
   
            req.setAttribute("list",list);
            
         }
         
         else    
         {
            ArrayList<EmpVO> list= dao.getAll();
            req.setAttribute("list",list);
         }
         
      }
      else if(name != null ) {
         EmpVO vo = dao.getOne(name);

         req.setAttribute("vo", vo);
      
         
      }
      

      
      dao.close();
      
      return "views/test.jsp";
   }

}