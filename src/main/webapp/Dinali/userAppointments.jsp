<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp" %>
<%@ page import="model.Student" %>
<%@ page import="java.util.List, model.Appointment" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Appointments</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        .topic{
        	color: #01274e;
	        text-align: center;
	        font-size: 2rem;
	        font-weight: 700;
	        letter-spacing: 1px;
	        margin-bottom: 25px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-family: Arial, sans-serif;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .btn-view, .btn-delete {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            margin: 2px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn-view {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
            border: none;
        }
        .btn-view:hover, .btn-delete:hover {
            opacity: 0.8;
            transform: translateY(-1px);
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 16px;
        }
        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }
        .alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
        .no-appointments {
            font-size: 18px;
            color: #666;
            margin: 30px 0;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #0077cc;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .back-btn:hover {
            background-color: #0056b3;
        }
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
            th, td {
                padding: 8px 10px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Student Dashboard</h2>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <div class="container">
        <%@ include file="../partials/sideBar.jsp" %>

        <div class="main-content">
            <h2 class="topic">My Appointments</h2><br>

            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
                <% session.removeAttribute("message"); %>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
                <% session.removeAttribute("errorMessage"); %>
            </c:if>

            <%
                List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
                if (appointments != null && !appointments.isEmpty()) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Reason</th>
                            <th>Counselor</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Appointment app : appointments) { %>
                            <tr>
                                <td><%= app.getId() %></td>
                                <td><%= app.getDate() %></td>
                                <td><%= app.getReason() %></td>
                                <td><%= app.getCounselor() %></td>
                                <td><%= app.getStatus() %></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/readAppointment?id=<%= app.getId() %>" class="btn-view">View Details</a>
                                    <form action="${pageContext.request.contextPath}/deleteAppointment" method="POST" style="display:inline;">
                                        <input type="hidden" name="id" value="<%= app.getId() %>">
                                        <button type="submit" class="btn-delete" onclick="return confirm('Are you sure you want to delete this appointment? This action cannot be undone.')">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p class="no-appointments">You have no appointments scheduled.</p>
            <% } %>
            
			<%@ page session="true" %>
			<%
			    String successMessage = (String) session.getAttribute("successMessage");
			    if (successMessage != null) {
			%>
			    <div style="background-color: #d4edda; color: #155724; padding: 10px; border: 1px solid #c3e6cb; border-radius: 5px; margin-bottom: 15px;">
			        <%= successMessage %>
			    </div>
			<%
			        session.removeAttribute("successMessage"); // Clear after showing once
			    }
			%>
			
			<br>
            <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn">Back to Dashboard</a>
        </div>
    </div>

    <script>
        document.querySelectorAll('.btn-delete').forEach(button => {
            button.addEventListener('click', function(e) {
                if (!confirm('Are you sure you want to delete this appointment?\nThis action cannot be undone.')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>

