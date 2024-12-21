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
 * Servlet implementation class ContactHelp
 */
@WebServlet("/ContactHelp")
public class ContactHelp extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		HttpSession hs = request.getSession();
		String fullName = request.getParameter("fullname");
		String email = request.getParameter("email");
		String contactno = request.getParameter("contactno");
		String message = request.getParameter("message");
		int status=0;
		try {
			int contactusQuery = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcontactusquery(id,name,EmailId,ContactNumber,message,status)values('"
							+ id + "','" + fullName + "','" + email + "','" + contactno + "','" + message + "','"+status+"')");
			if (contactusQuery > 0) {
				String inquiry = "Thanks for contacting us! We will get in touch with you.";
				hs.setAttribute("message", inquiry);
				response.sendRedirect("contact.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
