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
 * Servlet implementation class AddDonar
 */
@WebServlet("/AddDonar")
public class AddDonar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int did = DatabaseConnection.generateDonarId();
		System.out.println("Donar Id ===>> " + did);
		String fullname = request.getParameter("fullname");
		String mobileno = request.getParameter("mobileno");
		String emailid = request.getParameter("emailid");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String bloodgroup = request.getParameter("bloodgroup");
		String address = request.getParameter("address");
		String message = request.getParameter("message");
		String password = request.getParameter("password");
		int status = 0;
		HttpSession hs = request.getSession();
		try {
			int addDonar = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblblooddonars(id,FullName,MobileNumber,EmailId,Gender,age,BloodGroup,Address,Message,status,Password) values('"
							+ did + "','" + fullname + "','" + mobileno + "','" + emailid + "','" + gender + "','" + age
							+ "','" + bloodgroup + "','" + address + "','" + message + "','" + status + "','" + password
							+ "')");
			String register = "Donar registered sucessfully.";
			hs.setAttribute("success", register);
			response.sendRedirect("donar-sign-up.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
