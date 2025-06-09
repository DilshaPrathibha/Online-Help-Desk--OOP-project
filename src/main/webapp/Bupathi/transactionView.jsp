<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Transactions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        .transaction-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .transaction-table th, .transaction-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .transaction-table th {
            background-color: #3498db;
            color: white;
            position: sticky;
            top: 0;
        }
        .transaction-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .transaction-table tr:hover {
            background-color: #f1f1f1;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
        }
        .card-number {
            font-family: monospace;
        }
        .no-transactions {
            text-align: center;
            padding: 30px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-list-alt"></i> All Transactions</h1>
        
        <c:choose>
            <c:when test="${not empty transactions}">
                <table class="transaction-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Student ID</th>
                            <th>Material</th>
                            <th>Amount</th>
                            <th>Payment Method</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="txn" items="${transactions}">
                            <tr>
                                <td>${txn.id}</td>
                                <td><fmt:formatDate value="${txn.transactionDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td>${txn.studentStid}</td>
                                <td>${txn.materialName}</td>
                                <td class="price">$<fmt:formatNumber value="${txn.price}" minFractionDigits="2"/></td>
                                <td>
                                    <c:if test="${not empty txn.displayCardName}">
                                        ${txn.displayCardName}<br>
                                        <span class="card-number">•••• •••• •••• ${fn:substring(txn.displayCardNumber, fn:length(txn.displayCardNumber)-4, fn:length(txn.displayCardNumber))}</span>
                                    </c:if>
                                    <c:if test="${empty txn.displayCardName}">
                                        N/A
                                    </c:if>
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
    </div>
</body>
</html>