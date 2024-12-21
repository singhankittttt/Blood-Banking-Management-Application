package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;


@WebServlet("/AddBloodGroup")
public class AddBloodGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		String bloodgroup=request.getParameter("bloodgroup");
		HttpSession hs=request.getSession();
		try {
			int addBloodGroup=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblbloodgroup(id,BloodGroup)values('"+id+"','"+bloodgroup+"')");
			if(addBloodGroup>0) {
				String message="Blood Group add sucessfully.";
				hs.setAttribute("success", message);
				response.sendRedirect("add-blood-group.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
