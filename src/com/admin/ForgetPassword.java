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
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String newpassword=request.getParameter("newpassword");
		String confirmpassword=request.getParameter("confirmpassword");
		HttpSession hs=request.getSession();
		try {
			int setPassword=DatabaseConnection.insertUpdateFromSqlQuery("update tbladmin set Password='"+newpassword+"' where Email='"+email+"' and MobileNumber='"+mobile+"'");
			if(setPassword>0) {
				String message="Your Password succesfully changed";
				hs.setAttribute("forgot-password", message);
				response.sendRedirect("forgot-password.jsp");
			}else {
				String message="Email id or Mobile no is invalid";
				hs.setAttribute("fail", message);
				response.sendRedirect("forgot-password.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
