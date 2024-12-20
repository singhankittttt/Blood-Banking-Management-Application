<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	int id=Integer.parseInt(request.getParameter("del"));
	int deleteQuery=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblbloodgroup where id='"+id+"'");
	String del="Blood group deleted sucessfully.";
	session.setAttribute("delete", del);
	response.sendRedirect("manage-blood-group.jsp");
%>