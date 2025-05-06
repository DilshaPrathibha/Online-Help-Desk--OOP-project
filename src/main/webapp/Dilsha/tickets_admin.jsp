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
    }
    .admin-container {
        max-width: 900px;
        margin: 30px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    table, th, td {
        border: 1px solid #ccc;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    .action-buttons a, .action-buttons button {
        margin-right: 5px;
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 4px;
        color: white;
        border: none;
        cursor: pointer;
    }
    .action-buttons a.edit {
        background-color: #28a745;
    }
    .action-buttons a.delete {
        background-color: #dc3545;
    }
    .action-buttons button.update {
        background-color: #17a2b8;
    }
    form.inline-form {
        display: inline;
    }
    @media (max-width: 600px) {
        .admin-container {
            max-width: 95%;
        }
        table, th, td {
            font-size: 12px;
        }
    }
</style>

<div class="admin-container">
    <h2>Admin - Manage Support Tickets</h2>

    <c:if test="${empty tickets}">
    <p>No tickets found.</p>
</c:if>

<c:if test="${not empty tickets}">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Issue Type</th>
                <th>Description</th>
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
                    <td>${ticket.issueType}</td>
                    <td>${ticket.description}</td>
                    <td>${ticket.status}</td>
                    <td class="action-buttons">
                        <a href="${pageContext.request.contextPath}/admin/edit-ticket?id=${ticket.ticketId}"
   class="edit text-blue-500 hover:underline">Edit</a>

                        <a href="DeleteTicketServlet?id=${ticket.ticketId}" class="delete" onclick="return confirm('Are you sure you want to delete this ticket?');">Delete</a>
                        <form class="inline-form" action="UpdateTicketStatusServlet" method="post">
                            <input type="hidden" name="id" value="${ticket.ticketId}" />
                            <select name="status">
                                <option value="Open" ${ticket.status eq 'Open' ? 'selected' : ''}>Open</option>
                                <option value="In Progress" ${ticket.status eq 'In Progress' ? 'selected' : ''}>In Progress</option>
                                <option value="Resolved" ${ticket.status eq 'Resolved' ? 'selected' : ''}>Resolved</option>
                            </select>
                            <button type="submit" class="update">Update</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
     
</div>

<%@ include file="../partials/footer.jsp" %>
