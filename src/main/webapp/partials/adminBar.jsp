<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

<style>
:root {
	--primary: #2c3e50;
	--secondary: #34495e;
	--accent: #3498db;
	--success: #2ecc71;
	--danger: #e74c3c;
	--light: #ecf0f1;
	--dark: #2c3e50;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background-color: #f5f7fa;
}

.admin-container {
	display: grid;
	grid-template-columns: 220px 1fr;
	min-height: 100vh;
}

/* Sidebar */
.admin-sidebar {
	background: var(--primary);
	color: white;
	padding: 20px 0;
}

.admin-brand {
	padding: 0 20px 20px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.admin-nav {
	list-style: none;
	margin-top: 20px;
}

.logout-button {
	background-color: #e80000;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-weight: 500;
	cursor: pointer;
	transition: background-color 0.3s ease;
	text-align: center;
	display: inline-block;
	text-decoration: none;
}

.logout-button:hover {
	background-color: #ff0000;
	box-shadow: 0 4px 8px #e53935;
	text-decoration: none;
}

.admin-nav li a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 12px 20px;
	transition: all 0.2s;
}

.admin-nav li a:not(.logout-button):hover {
	background: rgba(255, 255, 255, 0.1);
}

/* Main Content */
.admin-main {
	padding: 30px;
}

.admin-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.admin-cards {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	margin-bottom: 30px;
}

.admin-card {
	background: white;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.admin-card h3 {
	color: var(--text-light);
	font-size: 14px;
	margin-bottom: 10px;
}

.admin-card p {
	font-size: 24px;
	font-weight: bold;
}

.card-students {
	border-left: 4px solid var(--accent);
}

.card-courses {
	border-left: 4px solid var(--success);
}

.card-payments {
	border-left: 4px solid var(--danger);
}

.card-active {
	border-left: 4px solid #f39c12;
}

/* Abstract Art Section */
.abstract-art {
	background: white;
	border-radius: 8px;
	padding: 40px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin-top: 30px;
}

.abstract-art svg {
	max-width: 300px;
	margin: 20px auto;
}

.welcome-message {
	font-size: 1.2rem;
	color: var(--secondary);
	margin-bottom: 20px;
}

.btn {
	padding: 8px 16px;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	font-weight: 500;
}

.btn-primary {
	background: var(--accent);
	color: white;
}
</style>
</head>
<body>
	<div class="admin-container">
		<!-- Sidebar -->
		<div class="admin-sidebar">
			<div class="admin-brand">
				<h2>Admin Panel</h2>
			</div>
			<ul class="admin-nav">
				<li><a href="${pageContext.request.contextPath}/admin/dashboard" class="active"><i
						class="fas fa-tachometer-alt"></i> Dashboard</a></li>
				<li><a href="${pageContext.request.contextPath}/StudentList"><i
						class="fas fa-users"></i> Students</a></li>
				<li><a href="#"><i class="fas fa-book-open"></i> Courses</a></li>
				<li><a
					href="${pageContext.request.contextPath}/TransactionView"><i
						class="fas fa-credit-card"></i> Payments</a></li>
				<li><a
					href="${pageContext.request.contextPath}/adminappointments"><i
						class="fas fa-calendar-check"></i> Booked Appointments</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/tickets"><i
						class="fas fa-ticket-alt"></i> Manage Tickets</a></li>
				<li><a href="${pageContext.request.contextPath}/logout"
					class="logout-button"><i class="fas fa-sign-out-alt"></i>
						Logout</a></li>
			</ul>
		</div>
	</div>

	<!-- Font Awesome for icons -->
	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>
</body>
</html>