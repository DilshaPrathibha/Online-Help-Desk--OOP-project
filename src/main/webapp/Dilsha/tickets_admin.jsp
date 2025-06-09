<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<%@ include file="../partials/adminHeader.jsp" %>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7f9;
        margin: 0;
        padding: 0;
        color: #333;
    }
    .admin-main {
        padding: 20px;
    }
    .admin-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    .search-bar-container {
        justify-content: center;
        margin: 20px 0;
        flex-wrap: wrap;
        gap: 12px;
    }
    .search-bar {
        display: flex;
        border: 1px solid #ccc;
        border-radius: 999px;
        overflow: hidden;
        width: 40%;
        max-width: 500px;
    }
    .search-bar input[type="text"] {
        flex: 1;
        padding: 10px;
        border: none;
        outline: none;
        font-size: 14px;
    }
    .search-bar button {
        background-color: var(--primary);
        color: #fff;
        border: none;
        padding: 0 16px;
        cursor: pointer;
    }
    .search-bar button:hover {
        background-color: #1a252f;
    }
    .search-bar-container select {
        padding: 10px 12px;
        font-size: 14px;
        border-radius: 999px;
        border: 1px solid #ccc;
        background-color: #fff;
        color: #333;
        outline: none;
        min-width: 160px;
        transition: border-color 0.3s ease;
    }
    .search-bar-container select:focus {
        border-color: var(--primary);
    }
    .table-wrapper {
        overflow-x: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 900px;
        table-layout: auto;
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
    .action-buttons {
        display: flex;
        gap: 10px;
        align-items: center;
    }
    .action-buttons a,
    .action-buttons button {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 4px;
        text-align: center;
        color: white;
        font-size: 18px;
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
    tbody tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    @media (max-width: 768px) {
        table thead {
            display: none;
        }
        table, tbody, tr, td {
            display: block;
            width: 100%;
        }
        tr {
            margin-bottom: 15px;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 6px;
        }
        td {
            padding-left: 50%;
            position: relative;
            text-align: right;
        }
        td::before {
            content: attr(data-label);
            position: absolute;
            left: 10px;
            font-weight: bold;
            text-align: left;
        }
    }
</style>

<div class="admin-container">
    <%@ include file="../partials/adminBar.jsp" %>
    <div class="admin-main">
        <div class="admin-header">
            <h1>Manage Support Tickets</h1>
        </div>

        <div class="search-bar-container">
            <form action="${pageContext.request.contextPath}/admin/tickets" method="get" style="display: flex; gap: 10px; align-items: center; flex-wrap: wrap; justify-content: center;">
                <div class="search-bar">
                    <input type="text" name="search" placeholder="Search tickets..." value="${fn:escapeXml(param.search)}">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </div>

                <select name="status">
                    <option value="">All Statuses</option>
                    <option value="Open" ${param.status eq 'Open' ? 'selected' : ''}>Open</option>
                    <option value="In Progress" ${param.status eq 'In Progress' ? 'selected' : ''}>In Progress</option>
                    <option value="Resolved" ${param.status eq 'Resolved' ? 'selected' : ''}>Resolved</option>
                </select>

                <select name="issueType">
                    <option value="">All Issue Types</option>
                    <option value="Technical Issue" ${param.issueType eq 'Technical Issue' ? 'selected' : ''}>Technical Issue</option>
                    <option value="Account Problem" ${param.issueType eq 'Account Problem' ? 'selected' : ''}>Account Problem</option>
                    <option value="Study Material Request" ${param.issueType eq 'Study Material Request' ? 'selected' : ''}>Study Material Request</option>
                    <option value="Other" ${param.issueType eq 'Other' ? 'selected' : ''}>Other</option>
                </select>

                <select name="faculty">
                    <option value="">All Faculties</option>
                    <option value="Computing" ${param.faculty eq 'Computing' ? 'selected' : ''}>Computing</option>
                    <option value="Business" ${param.faculty eq 'Business' ? 'selected' : ''}>Business</option>
                    <option value="Engineering" ${param.faculty eq 'Engineering' ? 'selected' : ''}>Engineering</option>
                    <option value="Architecture" ${param.faculty eq 'Architecture' ? 'selected' : ''}>Architecture</option>
                </select>
            </form>
        </div>

        <br>

        <c:if test="${empty tickets}">
            <p>No tickets found.</p>
        </c:if>

        <c:if test="${not empty tickets}">
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student Info</th>
                            <th>Faculty</th>
                            <th>Subject</th>
                            <th>Issue Type</th>
                            <th>Description</th>
                            <th>Attachment</th>
                            <th>Admin Reply</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ticket" items="${tickets}">
                            <tr>
                                <td data-label="ID">${ticket.ticketId}</td>
                                <td data-label="Student Info">
                                    <strong>${fn:escapeXml(ticket.name)}</strong><br>
                                    ${fn:escapeXml(ticket.email)}<br>
                                    ${fn:escapeXml(ticket.studentId)}
                                </td>
                                <td data-label="Faculty">${fn:escapeXml(ticket.faculty)}</td>
                                <td data-label="Subject">${fn:escapeXml(ticket.subject)}</td>
                                <td data-label="Issue Type">${fn:escapeXml(ticket.issueType)}</td>
                                <td data-label="Description">
                                    <span title="${fn:escapeXml(ticket.description)}">
                                        <c:choose>
                                            <c:when test="${fn:length(ticket.description) > 50}">
                                                ${fn:substring(ticket.description, 0, 50)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:escapeXml(ticket.description)}
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                                <td data-label="Attachment">
                                    <c:choose>
                                        <c:when test="${not empty ticket.attachment}">
                                            <a href="${pageContext.request.contextPath}/uploads/${ticket.attachment}" target="_blank" rel="noopener noreferrer">
                                                ${fn:escapeXml(ticket.attachment)}
                                            </a>
                                        </c:when>
                                        <c:otherwise>No file</c:otherwise>
                                    </c:choose>
                                </td>
                                <td data-label="Admin Reply">
                                    <span title="${fn:escapeXml(ticket.reply)}">
                                        <c:choose>
                                            <c:when test="${not empty ticket.reply}">
                                                <c:choose>
                                                    <c:when test="${fn:length(ticket.reply) > 40}">
                                                        ${fn:substring(ticket.reply, 0, 40)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${fn:escapeXml(ticket.reply)}
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>No reply yet</c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                                <td data-label="Status">${fn:escapeXml(ticket.status)}</td>
                                <td data-label="Actions">
                                    <div class="action-buttons">
                                        <a href="${pageContext.request.contextPath}/admin/edit-ticket?id=${ticket.ticketId}" class="edit" title="Reply Ticket">
                                            <i class="fas fa-paper-plane"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/deleteTicketServlet?id=${ticket.ticketId}" class="delete" title="Delete Ticket" onclick="return confirm('Are you sure you want to delete this ticket?');">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                        <form class="inline-form" action="${pageContext.request.contextPath}/UpdateTicketStatusServlet" method="post">
                                            <input type="hidden" name="id" value="${ticket.ticketId}" />
                                            <select name="status">
                                                <option value="Open" ${ticket.status eq 'Open' ? 'selected' : ''}>Open</option>
                                                <option value="In Progress" ${ticket.status eq 'In Progress' ? 'selected' : ''}>In Progress</option>
                                                <option value="Resolved" ${ticket.status eq 'Resolved' ? 'selected' : ''}>Resolved</option>
                                            </select>
                                            <button type="submit" class="update" title="Update Status">
                                                <i class="fas fa-sync-alt"></i>
                                            </button>
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
</div>
