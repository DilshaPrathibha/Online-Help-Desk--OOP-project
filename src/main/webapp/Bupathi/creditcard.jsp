<%@ include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cards | Student Help Desk</title>
    <style>
        /* ===== BASE STYLES ===== */
        :root {
            --primary: #2c3e50;
            --secondary: #34495e;
            --accent: #3498db;
            --success: #2ecc71;
            --danger: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --text: #333;
            --text-light: #7f8c8d;
        }
        body {
            background-color: #f5f7fa;
            color: var(--text);
            line-height: 1.6;
        }

        .topic2{
        	color: #01274e;
	        text-align: center;
	        font-size: 2rem;
	        font-weight: 700;
	        letter-spacing: 1px;
	        margin-bottom: 25px;
        }
        .content-container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        /* ===== CARD MANAGEMENT ===== */
        .card-management-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-primary {
            background: var(--accent);
            color: white;
        }
        
        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        /* ===== CARD LIST ===== */
        .card-list {
            display: grid;
            gap: 20px;
        }
        
        .card-item {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            transition: all 0.2s ease;
        }
        
        .card-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .card-type {
            font-weight: 600;
            color: var(--primary);
            text-transform: capitalize;
        }
        
        .card-number {
            font-family: 'Courier New', monospace;
            font-size: 18px;
            letter-spacing: 1px;
            margin: 10px 0;
            color: var(--text);
        }
        
        .card-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-bottom: 15px;
        }
        
        .detail-group label {
            display: block;
            font-size: 14px;
            color: var(--text-light);
            margin-bottom: 5px;
        }
        
        .detail-group div {
            font-weight: 500;
        }
        
        /* ===== CARD ACTIONS ===== */
        .card-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        .btn-sm {
            padding: 8px 15px;
            font-size: 14px;
        }
        
        .btn-edit {
            background: var(--accent);
            color: white;
        }
        
        .btn-delete {
            background: var(--danger);
            color: white;
        }
        
        .btn-edit:hover {
            background: #2980b9;
        }
        
        .btn-delete:hover {
            background: #c0392b;
        }
        
        /* ===== EMPTY STATE ===== */
        .empty-state {
            text-align: center;
            padding: 50px 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .empty-state h3 {
            color: var(--text-light);
            margin-bottom: 10px;
        }
        
        /* ===== RESPONSIVE ADJUSTMENTS ===== */
        @media (max-width: 768px) {      
            .card-details {
                grid-template-columns: 1fr;
            }
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
            <div class="content-container">
                <div class="card-management-header">
                    <h1 class="topic2">Your Payment Cards</h1>
                    <a href="${pageContext.request.contextPath}/Bupathi/addcard.jsp" class="btn btn-primary">
                        + Add New Card
                    </a>
                </div>
                
                <!-- Simple message display (if needed) -->
                <c:if test="${not empty message}">
                    <div style="padding:10px;margin-bottom:20px;background:#e6f7e6;border-left:4px solid #2ecc71;">
                        ${message}
                    </div>
                </c:if>
                
                <div class="card-list">
                    <c:choose>
                        <c:when test="${not empty cards}">
                            <c:forEach items="${cards}" var="card">
                                <div class="card-item">
                                    <div class="card-header">
                                        <span class="card-type">${card.cardType}</span>
                                        <span>Expires: ${card.expiryDate}</span>
                                    </div>
                                    <div class="card-number">
                                        •••• •••• •••• 
                                        <c:out value="${fn:substring(card.cardNumber, fn:length(card.cardNumber)-4, fn:length(card.cardNumber))}"/>
                                    </div>
                                    <div class="card-details">
                                        <div class="detail-group">
                                            <label>Cardholder Name</label>
                                            <div>${card.cardName}</div>
                                        </div>
                                        <div class="detail-group">
                                            <label>Billing Address</label>
                                            <div>${card.billingAddress}, ${card.zipCode}</div>
                                        </div>
                                    </div>
                                    <div class="card-actions">
                                        <a href="${pageContext.request.contextPath}/editcard?id=${card.id}" 
                                           class="btn btn-edit btn-sm">Edit</a>
                                        <form action="${pageContext.request.contextPath}/deletecard" 
                                              method="post" 
                                              style="display: inline;"
                                              onsubmit="return confirm('Are you sure you want to delete this card?')">
                                            <input type="hidden" name="cardId" value="${card.id}">
                                            <button type="submit" class="btn btn-delete btn-sm">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <h3>No Saved Payment Cards</h3>
                                <p>You haven't added any credit/debit cards yet.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</body>
</html>