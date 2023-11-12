<%@page import="com.entity.Specalist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	
	<%
		//Doctor doctObj = (Doctor) session.getAttribute("doctObj");
		if (doctObj == null) {
			response.sendRedirect("../doctor_login.jsp");
		}
	%>


	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<%
						if (session.getAttribute("succMsg") != null) {
					%>
						<p class="text-center text-success fs-3"><%= session.getAttribute("succMsg") %></p>
						<%
							session.removeAttribute("succMsg");
						}
						if (session.getAttribute("errorMsg") != null) {
					%>
						<p class="text-center text-danger fs-5"><%= session.getAttribute("errorMsg") %></p>
						<%
							session.removeAttribute("errorMsg");
						}
					%>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label>
								<input type="text" name="newPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter Old Password</label>
								<input type="text" name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="<%= doctObj.getId() %>" name="uid">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>
					<%
						if (session.getAttribute("succMsgd") != null) {
					%>
						<p class="text-center text-success fs-3"><%= session.getAttribute("succMsgd") %></p>
						<%
							session.removeAttribute("succMsgd");
						}
						if (session.getAttribute("errorMsgd") != null) {
					%>
						<p class="text-center text-danger fs-5"><%= session.getAttribute("errorMsgd") %></p>
						<%
							session.removeAttribute("errorMsgd");
						}
					%>
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name="fullname" class="form-control" value="<%= doctObj.getFullName() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" required name="dob" class="form-control" value="<%= doctObj.getDob() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input required name="qualification" type="text" class="form-control" value="<%= doctObj.getQualification() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option><%= doctObj.getSpecialist() %></option>
									<%
										SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
										List<Specalist> list = dao.getAllSpecialist();
										for (Specalist s : list) {
									%>
										<option><%= s.getSpecialistName() %></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="text" readonly required name="email" class="form-control" value="<%= doctObj.getEmail() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label>
								<input type="text" required name="mobno" class="form-control" value="<%= doctObj.getMobNo() %>">
							</div>
							<input type="hidden" name="id" value="<%= doctObj.getId() %>">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
