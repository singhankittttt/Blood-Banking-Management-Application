<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<footer>
	<div class="w3ls-footer-grids pt-sm-4 pt-3">
		<div class="container py-xl-5 py-lg-3">
			<div class="row">
				<div class="col-md-4 w3l-footer">
					<h4 class="mb-sm-3 mb-2">
						<a href="index.jsp"
							class="text-white font-italic font-weight-bold"> <span>Blood
								Bank</span> Management System <i class="fas fa-syringe ml-2"></i>
						</a>
					</h4>
					<p>A Blood Bank Management System (BBMS) is a software
						application or system designed to streamline and automate the
						operations of a blood bank or a blood donation center. Its primary
						goal is to efficiently manage the collection, storage, testing,
						and distribution of blood and its components, ensuring a safe and
						reliable supply of blood products to healthcare facilities and
						patients in need.</p>
				</div>
				<div class="col-md-4 w3l-footer my-md-0 my-4">
					<h3 class="mb-sm-3 mb-2 text-white">Address</h3>
					<ul class="list-unstyled">
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("SELECT * from  tblcontactusinfo");
							if (resultset.next()) {
						%>

						<li><i class="fas fa-location-arrow float-left"></i>
							<p class="ml-4">
								<span><%=resultset.getString("address")%>
							</p>
							<div class="clearfix"></div></li>
						<li class="my-3"><i class="fas fa-phone float-left"></i>
							<p class="ml-4"><%=resultset.getString("ContactNo")%></p>
							<div class="clearfix"></div></li>
						<li><i class="far fa-envelope-open float-left"></i>
						<p class="ml-4"><%=resultset.getString("EmailId")%></p>
							<div class="clearfix"></div></li>
						<%
							}
						%>
					
				</div>
				<div class="col-md-4 w3l-footer">
					<h3 class="mb-sm-3 mb-2 text-white">Quick Links</h3>
					<div class="nav-w3-l">
						<ul class="list-unstyled">
							<li><a href="index.jsp">Home</a></li>
							<li class="mt-2"><a href="about.jsp">About Us</a></li>
							<li class="mt-2"><a href="contact.jsp">Contact Us</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="border-top mt-5 pt-lg-4 pt-3 pb-lg-0 pb-3 text-center">
				<p class="copy-right-grids mt-lg-1">© Blood Bank Management
					System</p>
			</div>
		</div>
	</div>
</footer>
<!-- //footer -->