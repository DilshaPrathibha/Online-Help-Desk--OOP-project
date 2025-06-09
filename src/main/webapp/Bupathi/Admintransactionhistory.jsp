<%@ include file="../partials/adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Transaction History</title>
    <style>
        .admin-transaction-box {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 20px 0;
        }
        .admin-topic {
            color: #01274e;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .admin-transaction-table {
            width: 100%;
            border-collapse: collapse;
        }
        .admin-transaction-table th, .admin-transaction-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .admin-transaction-table th {
            background-color: #2c3e50;
            color: white;
        }
        .admin-transaction-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .admin-transaction-table tr:hover {
            background-color: #f1f1f1;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
        }
        .no-transactions {
            text-align: center;
            padding: 30px;
            color: #7f8c8d;
        }
        .card-number {
            font-family: monospace;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="admin-sidebar">
            <!-- Include your admin sidebar content -->
            <%@ include file="../partials/adminBar.jsp" %>
        </div>
        
        <div class="admin-main">
            <div class="admin-header">
                <h1>Transaction History</h1>
            </div>
            
            <div class="admin-transaction-box">
                <h2 class="admin-topic">All Transactions</h2>
                
                <c:choose>
                    <c:when test="${not empty transactions}">
                        <table class="admin-transaction-table">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Student</th>
                                    <th>Material</th>
                                    <th>Amount</th>
                                    <th>Payment Method</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="txn" items="${transactions}">
                                    <tr>
                                        <td>${txn.transactionDate}</td>
                                        
                                        <td>${txn.materialName}</td>
                                        <td class="price">$${txn.price}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty txn.displayCardName and not empty txn.displayCardNumber}">
                                                    ${txn.displayCardName}<br>
                                                    <span class="card-number">
                                                        •••• •••• •••• 
                                                        ${fn:substring(txn.displayCardNumber, fn:length(txn.displayCardNumber)-4, fn:length(txn.displayCardNumber))}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    N/A
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${txn.remarks}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-transactions">
                            <p>No transactions found.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary" style="margin-top: 20px;">Back to Dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>