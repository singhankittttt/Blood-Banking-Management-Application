package com.admin;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession hs=request.getSession();
		try {
			ResultSet resultset=DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where UserName='"+username+"' and Password='"+password+"'");
			if(resultset.next()) {
				hs.setAttribute("AdminName", resultset.getString("AdminName"));
				hs.setAttribute("UserName", resultset.getString("UserName"));
				response.sendRedirect("admin-dashboard.jsp");
			}else {
				String message="Invalid login details";
				hs.setAttribute("message", message);
				response.sendRedirect("admin-login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
