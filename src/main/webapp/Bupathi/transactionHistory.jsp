<%@ include file="../partials/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Styles same as before */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            padding: 20px;
        }

        .transaction-box {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .topic2 {
            color: #01274e;
            font-size: 2rem;
	        text-align: center;
	        font-weight: 700;
	        letter-spacing: 1px;
	        margin-bottom: 25px;
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
        .no-transactions {
            text-align: center;
            padding: 30px;
            color: #7f8c8d;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .back-btn:hover {
            background-color: #2980b9;
        }
        .card-number {
            font-family: monospace;
        }
    </style>
</head>
<body>

    <div class="header">
        <h2>Student Dashboard</h2>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

<div class="container">
    <%@ include file="../partials/sideBar.jsp" %>

    <div class="main-content">
    <div class=".transaction-box">
        <h1 class="topic2">Transaction History for ${studentName}</h1>
        
        <c:choose>
            <c:when test="${not empty transactions}">
                <table class="transaction-table">
                    <thead>
                        <tr>
                            <th>Date</th>
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
                    <p>No transactions found in your history.</p>
                </div>
            </c:otherwise>
        </c:choose>
        </div>
           <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-btn">Back to Dashboard</a>
     </div>
</div>        

</body>
</html>
