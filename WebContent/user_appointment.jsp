<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Appointment</title>
    <%@include file="component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
        }
        .backImg {
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("img/hospital.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp" %>

    <div class="container-fulid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 p-5">
                <img alt="" src="img/doct.jpg">
            </div>

            <div class="col-md-6">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-3">User Appointment</p>
                        
                        <% if (request.getAttribute("succMsg") != null) { %>
                            <p class="text-center text-success fs-3"><%= request.getAttribute("succMsg") %></p>
                            <% request.removeAttribute("succMsg"); %>
                        <% } %>

                        <% if (request.getAttribute("errorMsg") != null) { %>
                            <p class="text-center text-danger fs-5"><%= request.getAttribute("errorMsg") %></p>
                            <% request.removeAttribute("errorMsg"); %>
                        <% } %>
                        
                        <form class="row g-3" action="appAppointment" method="post">
                            <input type="hidden" name="userid" value="<%= session.getAttribute("userObj") != null ? ((com.entity.User) session.getAttribute("userObj")).getId() : "" %>">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Full Name</label>
                                <input required type="text" class="form-control" name="fullname">
                            </div>
							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Doctor</label>
                                <select required class="form-control" name="doct">
                                    <option value="">--select--</option>
                                    <% DoctorDao dao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                    for (Doctor d : list) { %>
                                        <option value="<%= d.getId() %>">
                                            <%= d.getFullName() %> (<%= d.getSpecialist() %>)
                                        </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <textarea required name="address" class="form-control" rows="3" cols=""></textarea>
                            </div>
                            <% if (session.getAttribute("userObj") == null) { %>
							    <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							<% } else { %>
							    <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							<% } %>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="component/footer.jsp" %>
</body>
</html>
