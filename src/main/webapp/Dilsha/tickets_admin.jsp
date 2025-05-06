<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../partials/header.jsp" %>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7f9;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h2 {
        color: #2c3e50;
        text-align: center;
        margin-top: 20px;
    }

    .admin-container {
        max-width: 100%;
        margin: 30px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow-x: auto;
    }

    .table-wrapper {
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 1200px; /* Ensure minimum width for horizontal scroll */
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
        background-color: #007bff;
        color: white;
    }

    .action-buttons {
        display: flex;
        flex-direction: column;
        gap: 8px;
        min-width: 180px;
    }

    .action-buttons a,
    .action-buttons button {
        display: block;
        padding: 6px 10px;
        border-radius: 4px;
        text-align: center;
        color: white;
        font-size: 13px;
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

    .update {
        background-color: #17a2b8;
    }

    .update:hover {
        background-color: #138496;
    }

    form.inline-form {
        display: flex;
        align-items: center;
        gap: 6px;
    }

    select {
        padding: 4px 6px;
        font-size: 13px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    /* Responsive Styling for Mobile Devices */
	
	}

</style>

<div class="admin-container">
    <h2>Manage Support Tickets</h2> <br>

    <c:if test="${empty tickets}">
        <p>No tickets found.</p>
    </c:if>

    <c:if test="${not empty tickets}">
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Student ID</th>
                        <th>Faculty</th>
                        <th>Subject</th>
                        <th>Phone</th>
                        <th>Issue Type</th>
                        <th>Description</th>
                        <th>Attachment</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ticket" items="${tickets}">
                        <tr>
                            <td>${ticket.ticketId}</td>
                            <td>${ticket.name}</td>
                            <td>${ticket.email}</td>
                            <td>${ticket.studentId}</td>
                            <td>${ticket.faculty}</td>
                            <td>${ticket.subject}</td>
                            <td>${ticket.phone != null ? ticket.phone : 'N/A'}</td>
                            <td>${ticket.issueType}</td>
                            <td>${ticket.description}</td>
                            <td>
							    <c:choose>
							        <c:when test="${not empty ticket.attachment}">
							            <a href="${pageContext.request.contextPath}/uploads/${ticket.attachment}" target="_blank" download>
							                ${ticket.attachment}
							            </a>
							        </c:when>
							        <c:otherwise>
							            No file
							        </c:otherwise>
							    </c:choose>
							</td>

                            <td>${ticket.status}</td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/admin/edit-ticket?id=${ticket.ticketId}" class="edit">Edit</a>
                                    <a href="DeleteTicketServlet?id=${ticket.ticketId}" class="delete" onclick="return confirm('Are you sure you want to delete this ticket?');">Delete</a>
                                    <form class="inline-form" action="${pageContext.request.contextPath}/UpdateTicketStatusServlet" method="post">
                                        <input type="hidden" name="id" value="${ticket.ticketId}" />
                                        <select name="status">
                                            <option value="Open" ${ticket.status eq 'Open' ? 'selected' : ''}>Open</option>
                                            <option value="In Progress" ${ticket.status eq 'In Progress' ? 'selected' : ''}>In Progress</option>
                                            <option value="Resolved" ${ticket.status eq 'Resolved' ? 'selected' : ''}>Resolved</option>
                                        </select>
                                        <button type="submit" class="update">Update</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

<%@ include file="../partials/footer.jsp" %>
