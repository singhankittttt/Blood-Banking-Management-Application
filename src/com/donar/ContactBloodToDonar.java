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
 * Servlet implementation class ContactBloodToDonar
 */
@WebServlet("/ContactBloodToDonar")
public class ContactBloodToDonar extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;
		int did=Integer.parseInt(request.getParameter("did"));
		System.out.println("Donar Id ===>> "+did);
		String fullname=request.getParameter("fullname");
		String email=request.getParameter("email");
		String contactno=request.getParameter("contactno");
		String brf=request.getParameter("brf");
		String message=request.getParameter("message");
		HttpSession hs=request.getSession();
		try {
			int contactToBloodDonar=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblbloodrequirer(id,BloodDonarID,name,EmailId,ContactNumber,BloodRequirefor,Message)values('"+id+"','"+did+"','"+fullname+"','"+email+"','"+contactno+"','"+brf+"','"+message+"')");
			if(contactToBloodDonar>0) {
				String bloodRequest="Blood request send sucessfully.";
				hs.setAttribute("request", bloodRequest);
				response.sendRedirect("contact-blood.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
