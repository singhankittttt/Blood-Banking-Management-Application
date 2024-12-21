package com.donar;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.DatabaseConnection;
import java.sql.*;
import java.util.*;
/**
 * Servlet implementation class DonarLogin
 */
@WebServlet("/DonarLogin")
public class DonarLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession hs=request.getSession();
		try {
			ResultSet resultset=DatabaseConnection.getResultFromSqlQuery("select * from tblblooddonars where EmailId='"+email+"' and Password='"+password+"'");
			if(resultset.next()) {
				hs.setAttribute("did", resultset.getInt("id"));
				hs.setAttribute("FullName", resultset.getString("FullName"));
				hs.setAttribute("email", resultset.getString("EmailId"));
				response.sendRedirect("index.jsp");
			}else {
				String message="Invalid login details";
				hs.setAttribute("message", message);
				response.sendRedirect("donar-login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
