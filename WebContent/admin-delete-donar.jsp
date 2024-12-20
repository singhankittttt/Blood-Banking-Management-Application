<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	int id=Integer.parseInt(request.getParameter("del"));
	int deleteQuery=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblblooddonars where id='"+id+"'");
	String del="Donar deleted sucessfully.";
	session.setAttribute("delete", del);
	response.sendRedirect("admin-view-donar-list.jsp");
%>