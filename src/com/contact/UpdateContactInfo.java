package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UpdateContactInfo
 */
@WebServlet("/UpdateContactInfo")
public class UpdateContactInfo extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String contactno=request.getParameter("contactno");
		HttpSession hs=request.getSession();
		try {
			int updateContactInfo=DatabaseConnection.insertUpdateFromSqlQuery("update tblcontactusinfo set Address='"+address+"',EmailId='"+email+"',ContactNo='"+contactno+"'");
			if(updateContactInfo>0) {
				String update="Contact info updated sucessfully.";
				hs.setAttribute("success", update);
				response.sendRedirect("admin-update-contact-info.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
