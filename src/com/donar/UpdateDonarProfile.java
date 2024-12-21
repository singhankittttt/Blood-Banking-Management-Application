package com.donar;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UpdateDonarProfile
 */
@WebServlet("/UpdateDonarProfile")
public class UpdateDonarProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mobileno=request.getParameter("mobileno");
		String gender=request.getParameter("gender");
		int age=Integer.parseInt(request.getParameter("age"));
		String bloodgroup=request.getParameter("bloodgroup");
		String address=request.getParameter("address");
		String message=request.getParameter("message");
		HttpSession hs=request.getSession();
		
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tblblooddonars set MobileNumber='"+mobileno+"',gender='"+gender+"',age='"+age+"',BloodGroup='"+bloodgroup+"',Address='"+address+"',Message='"+message+"' where FullName='"+hs.getAttribute("FullName")+"' and EmailId='"+hs.getAttribute("email")+"'");
			if(editProfile>0) {
				String update="Profile edited sucessfully.";
				hs.setAttribute("success", update);
				response.sendRedirect("donar-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
