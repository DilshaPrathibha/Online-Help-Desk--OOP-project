<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../partials/header.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

<style>
:root {
	--primary: #2c3e50;
}

body {
	font-family: 'Arial', sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
	color: #333;
}

.topic1 {
	color: #01274e;
	text-align: center;
	font-size: 2rem;
	font-weight: 700;
	letter-spacing: 1px;
	margin-bottom: 25px;
}

.student-container {
	max-width: 1000px;
	margin: 30px auto;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	min-width: 900px;
}

th, td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ccc;
	font-size: 14px;
	vertical-align: top;
	word-wrap: break-word;
	white-space: normal;
}

th {
	background-color: var(--primary);
	color: white;
}

tbody tr:hover {
	background-color: #f1f1f1;
}

.no-tickets {
	text-align: center;
	font-style: italic;
	margin: 20px 0;
}

.success-message {
	background-color: #d4edda;
	color: #155724;
	padding: 15px;
	margin: 20px auto;
	border: 1px solid #c3e6cb;
	border-radius: 5px;
	width: 80%;
	text-align: center;
	font-weight: bold;
	transition: opacity 0.5s ease;
}

.action-buttons {
	display: flex;
	gap: 8px;
	justify-content: center;
}

.action-buttons a {
	display: inline-block;
	padding: 6px 10px;
	border-radius: 4px;
	color: white;
	font-size: 16px;
	text-decoration: none;
	border: none;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.edit {
	background-color: #28a745;
}

.edit:hover {
	background-color: #218838;
}

.delete {
	background-color: #dc3545;
}

.delete:hover {
	background-color: #c82333;
}
</style>

<%
String success = request.getParameter("success");
if ("true".equals(success)) {
%>
<div id="successMsg" class="success-message">Ticket submitted
	successfully!</div>
<script>
        setTimeout(() => {
            const msg = document.getElementById("successMsg");
            if (msg) {
                msg.style.opacity = "0";
                setTimeout(() => msg.style.display = "none", 500);
            }
        }, 1500);
    </script>
<%
}
%>

<div class="header">
	<h2>Student Dashboard</h2>
	<form action="${pageContext.request.contextPath}/logout" method="post">
		<button type="submit" class="logout-btn">Logout</button>
	</form>
</div>

<div class="container">
	<%@ include file="../partials/sideBar.jsp"%>

	<div class="main-content">
		<div class="student-container">
			<h2 class="topic1">My Support Tickets</h2>

			<c:if test="${empty tickets}">
				<p class="no-tickets">You have not submitted any tickets yet.</p>
			</c:if>

			<c:if test="${not empty tickets}">
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Faculty</th>
							<th>Subject</th>
							<th>Issue Type</th>
							<th>Description</th>
							<th>Attachment</th>
							<th>Admin Reply</th>
							<th>Status</th>
							<th>Submitted At</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ticket" items="${tickets}">
							<tr>
								<td>${ticket.ticketId}</td>
								<td>${ticket.faculty}</td>
								<td>${ticket.subject}</td>
								<td>${ticket.issueType}</td>
								<td title="${ticket.description}"><c:choose>
										<c:when test="${fn:length(ticket.description) > 50}">
                                    ${fn:substring(ticket.description, 0, 50)}...
                                </c:when>
										<c:otherwise>
                                    ${ticket.description}
                                </c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${not empty ticket.attachment}">
											<a
												href="${pageContext.request.contextPath}/uploads/${ticket.attachment}"
												target="_blank" rel="noopener noreferrer">
												${ticket.attachment} </a>
										</c:when>
										<c:otherwise>No file</c:otherwise>
									</c:choose></td>
								<td title="${ticket.reply}"><c:choose>
										<c:when test="${not empty ticket.reply}">
											<c:choose>
												<c:when test="${fn:length(ticket.reply) > 40}">
                                            ${fn:substring(ticket.reply, 0, 40)}...
                                        </c:when>
												<c:otherwise>
                                            ${ticket.reply}
                                        </c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>No reply yet</c:otherwise>
									</c:choose></td>
								<td>${ticket.status}</td>
								<td><fmt:formatDate value="${ticket.createdAt}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>
									<div class="action-buttons">
										<a
											href="${pageContext.request.contextPath}/student/edit-ticket?id=${ticket.ticketId}"
											class="edit" title="Edit Ticket"> <i class="fas fa-edit"></i>
										</a> <a
											href="${pageContext.request.contextPath}/student/deleteTicketServlet?id=${ticket.ticketId}"
											class="delete" title="Delete Ticket"
											onclick="return confirm('Are you sure you want to delete this ticket?');">
											<i class="fas fa-trash"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>

	</div>
</div>

