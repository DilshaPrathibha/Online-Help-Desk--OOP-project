<%@ include file="../partials/adminHeader.jsp" %>
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
        .admin-container {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
        .btn-primary {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }
        .search-container {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }
        .search-input {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        .search-btn {
            padding: 10px 15px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .no-results {
            text-align: center;
            padding: 20px;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="admin-container">
    <%@ include file="../partials/adminBar.jsp" %>
      
        <div class="admin-main">
            <div class="admin-header">
                <h1>Student Management</h1>
                <div class="admin-actions">
                   
                </div>
            </div>
            
            <!-- Search Form -->
            <div class="search-container">
                <input type="text" id="searchInput" class="search-input" placeholder="Search by name, ID, email..." 
                       onkeyup="searchTable()">
                <button class="search-btn" onclick="searchTable()">Search</button>
            </div>
            
            <table class="student-table" id="studentTable">
    <thead>
        <tr>
            <th>Student ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Semester</th>
            <th>Field of Study</th>
            <th>Actions</th> <!-- NEW COLUMN -->
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty students}">
                <c:forEach items="${students}" var="student">
                    <tr>
                        <td>${student.stdid}</td>
                        <td>${student.fullname}</td>
                        <td>${student.email}</td>
                        <td>${student.semester}</td>
                        <td>${student.fos}</td>
                        <td>
                            <form method="post"  action="${pageContext.request.contextPath}/deleteStudent" onsubmit="return confirmDelete('${student.stdid}', '${student.fullname}')">
                                <input type="hidden" name="stid" value="${student.stdid}" />
                                <button type="submit" class="btn-primary" style="background-color: red;">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="6" class="no-results">No students found</td> <!-- Updated colspan -->
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
            
        </div>
    </div>

    <script>
        function searchTable() {
            // Get input value and convert to lowercase
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            
            // Get table and rows
            const table = document.getElementById("studentTable");
            const rows = table.getElementsByTagName("tr");
            
            let found = false;
            
            // Loop through all table rows (skip header row)
            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const cells = row.getElementsByTagName("td");
                let rowContainsText = false;
                
                // Check each cell in the row (except actions cell)
                for (let j = 0; j < cells.length; j++) {
                    const cell = cells[j];
                    if (cell) {
                        const text = cell.textContent || cell.innerText;
                        if (text.toLowerCase().indexOf(filter) > -1) {
                            rowContainsText = true;
                            break;
                        }
                    }
                }
                
                // Show/hide row based on search match
                if (rowContainsText) {
                    row.style.display = "";
                    found = true;
                } else {
                    row.style.display = "none";
                }
            }
            
            // Show "no results" message if no matches found
            const noResultsRow = table.querySelector(".no-results");
            if (noResultsRow) {
                noResultsRow.style.display = found ? "none" : "";
            }
        }
        
        function confirmDelete(stid, name) {
            const firstConfirm = confirm(
                "⚠ WARNING: You are about to delete student '" + name + "' (ID: " + stid + ").\n\n" +
                "This will permanently delete ALL data associated with this student:\n" +
                "- Credit Cards\n- Transactions\n- Appointments\n\n" +
                "Are you sure you want to continue?"
            );

            if (firstConfirm) {
                return confirm("🚨 Final Confirmation: Are you absolutely sure you want to DELETE this student?");
            }

            return false; // cancel form submit if not confirmed
        }
    </script>
</body>
</html>