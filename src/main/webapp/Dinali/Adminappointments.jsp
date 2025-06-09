<%@ include file="../partials/adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Appointments Management</title>
    <style>
        
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
        
        .appointments-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .appointments-table th, 
        .appointments-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .appointments-table th {
            background-color: var(--primary);
            color: white;
            font-weight: 500;
        }
        
        .appointments-table tr:hover {
            background-color: #f9f9f9;
        }
        
        .status-pending {
            color: #f39c12;
            font-weight: 500;
        }
        
        .status-approved {
            color: var(--success);
            font-weight: 500;
        }
        
        .status-rejected {
            color: var(--danger);
            font-weight: 500;
        }
        
        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 5px;
            transition: all 0.2s;
        }
        
        .approve-btn {
            background-color: var(--success);
            color: white;
        }
        
        .reject-btn {
            background-color: var(--danger);
            color: white;
        }
        
        .action-btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }
        
        .no-appointments {
            text-align: center;
            padding: 30px;
            color: #666;
        }
    </style>
</head>
<body>
<div class="admin-container">
    <%@ include file="../partials/adminBar.jsp" %>
    
        <!-- Main Content -->
        <div class="admin-main">
            <div class="admin-header">
                <h1>Appointments Management</h1>
            </div>
            
            <c:choose>
                <c:when test="${not empty appointments}">
                    <table class="appointments-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Date</th>
                                <th>Mode</th>
                                <th>Counselor</th>
                                <th>Reason</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${appointments}" var="appointment">
                                <tr>
                                    <td>${appointment.id}</td>
                                    <td>${appointment.stid}</td>
                                    <td>${appointment.name}</td>
                                    <td>${appointment.email}</td>
                                    <td>${appointment.date}</td>
                                    <td>${appointment.mode}</td>
                                    <td>${appointment.counselor}</td>
                                    <td>${appointment.reason}</td>
                                    <td class="status-${appointment.status.toLowerCase()}">${appointment.status}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/updateappointment" method="post" style="display: inline;">
                                            <input type="hidden" name="appointmentId" value="${appointment.id}">
                                            <input type="hidden" name="newStatus" value="APPROVED">
                                            <button type="submit" class="action-btn approve-btn">Approve</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/updateappointment" method="post" style="display: inline;">
                                            <input type="hidden" name="appointmentId" value="${appointment.id}">
                                            <input type="hidden" name="newStatus" value="REJECTED">
                                            <button type="submit" class="action-btn reject-btn">Reject</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-appointments">
                        <p>No appointments found.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
</div>

    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>