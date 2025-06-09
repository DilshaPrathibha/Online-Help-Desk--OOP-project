
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	color: #333;
}

.header {
	background-color: #1d262f;
	color: white;
	padding: 15px 25px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.logout-btn {
	background-color: #dc3545;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
	font-weight: 500;
}

.container {
	display: flex;
	min-height: calc(100vh - 65px);
}

.sidebar {
	width: 220px;
	background-color: #2c3e50;
	padding: 20px 0;
}

.sidebar a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 12px 25px;
	transition: background-color 0.2s;
	font-weight: 500;
}

.sidebar a:hover {
	background-color: #3d4348;
}

.main-content {
	flex: 1;
	padding: 25px;
}

.profile-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	padding: 25px;
	margin-bottom: 25px;
}

.profile-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.profile-header h3 {
	margin: 0;
	color: #2c3e50;
}
</style>
</head>
<body>


	<div class="container">
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/student/dashboard"><i class="fas fa-user"></i> My Profile</a> <a
				href="${pageContext.request.contextPath}/creditcard"><i
				class="fas fa-credit-card"></i> Cards</a> <a
				href="${pageContext.request.contextPath}/TransactionView"><i
				class="fas fa-receipt"></i> Transactions</a> <a
				href="${pageContext.request.contextPath}/userAppointments"><i
				class="fas fa-calendar-check"></i> My Appointments</a> <a
				href="${pageContext.request.contextPath}/student/chat"><i
				class="fas fa-comments"></i> Chat Bot</a> <a
				href="${pageContext.request.contextPath}/student/ticket"><i
				class="fas fa-ticket-alt"></i> Submit a Ticket</a> <a
				href="${pageContext.request.contextPath}/student/tickets"><i
				class="fas fa-folder-open"></i> My Tickets</a>
		</div>
	</div>
</body>
</html>
