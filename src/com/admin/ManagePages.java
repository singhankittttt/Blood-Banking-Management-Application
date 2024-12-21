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
 * Servlet implementation class ManagePages
 */
@WebServlet("/ManagePages")
public class ManagePages extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aboutUs=request.getParameter("aboutUs");
		String pgedetails=request.getParameter("pgedetails");
		HttpSession hs=request.getSession();
		try {
			int editPages=DatabaseConnection.insertUpdateFromSqlQuery("update tblpages set detail='"+pgedetails+"' where type='"+aboutUs+"'");
			if(editPages>0) {
				String update="Pages edited sucessfully.";
				hs.setAttribute("success", update);
				response.sendRedirect("admin-manage-pages.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
