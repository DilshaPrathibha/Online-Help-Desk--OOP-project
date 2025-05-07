<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
    <style>
        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .student-table th, .student-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .student-table th {
            background-color: #2c3e50;
            color: white;
        }
        .student-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .student-table tr:hover {
            background-color: #e6f7ff;
        }
        .action-btns a {
            padding: 5px 10px;
            margin: 0 5px;
            text-decoration: none;
            border-radius: 4px;
        }
        .view-btn {
            background-color: #3498db;
            color: white;
        }
        .edit-btn {
            background-color: #f39c12;
            color: white;
        }
    </style>
</head>
<body>
    <div class="admin-container">
<%@ include file="../partials/header.jsp" %>
        
        <div class="admin-main">
            <div class="admin-header">
                <h1>Student Management</h1>
                <div class="admin-actions">
                    <a href="${pageContext.request.contextPath}/admin/Addstudent.jsp" class="btn btn-primary">
                        Add New Student
                    </a>
                </div>
            </div>
            
            <table class="student-table">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Semester</th>
                        <th>Field</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${students}" var="student">
                        <tr>
                            <td>${student.stdid}</td>
                            <td>${student.fullname}</td>
                            <td>${student.email}</td>
                            <td>${student.semester}</td>
                            <td>${student.fos}</td>
                            <td class="action-btns">
                                <a href="${pageContext.request.contextPath}/admin/view-student?id=${student.stdid}" class="view-btn">View</a>
                                <a href="${pageContext.request.contextPath}/admin/EditProfileServlet?id=${student.stdid}" class="edit-btn">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>