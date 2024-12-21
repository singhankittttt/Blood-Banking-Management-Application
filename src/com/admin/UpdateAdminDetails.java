package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UpdateAdminDetails
 */
@WebServlet("/UpdateAdminDetails")
public class UpdateAdminDetails extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminname=request.getParameter("adminname");
		String username=request.getParameter("username");
		String mobilenumber=request.getParameter("mobilenumber");
		String email=request.getParameter("email");
		HttpSession hs=request.getSession();
		
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tbladmin set AdminName='"+adminname+"', MobileNumber='"+mobilenumber+"',email='"+email+"' where UserName='"+request.getParameter("username")+"'");
			if(editProfile>0) {
				String update="Profile edited sucessfully.";
				hs.setAttribute("success", update);
				response.sendRedirect("admin-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
