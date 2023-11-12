<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.UserDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <%@ include file="component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <% 
        User userObj = (User) session.getAttribute("userObj");
        if (userObj == null) {
            response.sendRedirect("user_login.jsp");
        }
    %>

    <div class="container p-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <p class="text-center fs-3">Change Password</p>
                    <% 
                        String succMsg = (String) session.getAttribute("succMsg");
                        String errorMsg = (String) session.getAttribute("errorMsg");
                        if (succMsg != null && !succMsg.isEmpty()) {
                    %>
                    <p class="text-center text-success fs-3"><%= succMsg %></p>
                    <% 
                        session.removeAttribute("succMsg");
                        }
                        if (errorMsg != null && !errorMsg.isEmpty()) {
                    %>
                    <p class="text-center text-danger fs-5"><%= errorMsg %></p>
                    <% 
                        session.removeAttribute("errorMsg");
                    %>
                    <% } %>
                    <div class="card-body">
                        <form action="userChangePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label>
                                <input type="text" name="newPassword" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="text" name="oldPassword" class="form-control" required>
                            </div>
                            <input type="hidden" value="<%= userObj.getId() %>" name="uid">
                            <button class="btn btn-success col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
