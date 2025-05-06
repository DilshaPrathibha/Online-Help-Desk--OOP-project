<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${editMode ? 'Edit Credit Card' : 'Add Credit Card'}</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        :root {
            --primary-color: #e6f2ff;
            --secondary-color: #cce6ff;
            --text-color: #333;
            --border-color: #99ccff;
        }
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--primary-color);
            color: var(--text-color);
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .card-form {
            background-color: rgba(230, 242, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            backdrop-filter: blur(5px);
            border: 1px solid var(--border-color);
        }
        h2 {
            text-align: center;
            color: #0066cc;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.7);
            transition: all 0.3s;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #0066cc;
            box-shadow: 0 0 5px rgba(0, 102, 204, 0.3);
        }
        .row {
            display: flex;
            gap: 15px;
        }
        .row .form-group {
            flex: 1;
        }
        .submit-btn {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background-color: #0052a3;
        }
        .card-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }
        .card-icons img {
            height: 30px;
            opacity: 0.7;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card-form">
        <h2>${editMode ? 'Edit Credit Card' : 'Add Credit Card'}</h2>

        <div class="card-icons">
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/visa/visa-original.svg" alt="Visa">
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mastercard/mastercard-original.svg" alt="Mastercard">
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg" alt="Apple Pay">
        </div>

      <form method="post" action="${pageContext.request.contextPath}/${editMode ? 'editcard' : 'addCard'}">


            <c:if test="${editMode}">
                <input type="hidden" name="id" value="${card.id}" />
            </c:if>

            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456"
                       value="${card != null ? card.cardNumber : ''}" required>
            </div>

            <div class="form-group">
                <label for="cardName">Name on Card</label>
                <input type="text" id="cardName" name="cardName" placeholder="John Doe"
                       value="${card != null ? card.cardName : ''}" required>
            </div>

            <div class="row">
                <div class="form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY"
                           value="${card != null ? card.expiryDate : ''}" required>
                </div>

                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" name="cvv" placeholder="123"
                           value="${card != null ? card.cvv : ''}" required>
                </div>
            </div>

            <div class="form-group">
                <label for="cardType">Card Type</label>
                <select id="cardType" name="cardType" required>
                    <option value="">Select Card Type</option>
                    <option value="visa" ${card != null && card.cardType == 'visa' ? 'selected' : ''}>Visa</option>
                    <option value="mastercard" ${card != null && card.cardType == 'mastercard' ? 'selected' : ''}>Mastercard</option>
                    <option value="amex" ${card != null && card.cardType == 'amex' ? 'selected' : ''}>American Express</option>
                    <option value="discover" ${card != null && card.cardType == 'discover' ? 'selected' : ''}>Discover</option>
                </select>
            </div>

            <div class="form-group">
                <label for="billingAddress">Billing Address</label>
                <input type="text" id="billingAddress" name="billingAddress" placeholder="123 Main St, City, Country"
                       value="${card != null ? card.billingAddress : ''}" required>
            </div>

            <div class="form-group">
                <label for="zipCode">ZIP/Postal Code</label>
                <input type="text" id="zipCode" name="zipCode" placeholder="12345"
                       value="${card != null ? card.zipCode : ''}" required>
            </div>

            <div class="form-group">
                <input type="checkbox" id="saveCard" name="saveCard" ${card == null || card.saveCard ? 'checked' : ''}>
                <label for="saveCard" style="display: inline; font-weight: normal;">Save this card for future payments</label>
            </div>

            <button type="submit" class="submit-btn">
                ${editMode ? 'Update Card' : 'Save Card'}
            </button>
        </form>
    </div>
</div>
</body>
</html>
