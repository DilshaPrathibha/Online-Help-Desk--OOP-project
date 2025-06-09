<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../partials/header.jsp" %>
    <title>${editMode ? 'Edit Credit Card' : 'Add Credit Card'}</title>
    <style>
        :root {
            --primary-color: #e6f2ff;
            --secondary-color: #cce6ff;
            --text-color: #333;
            --border-color: #99ccff;
            --error-color: #e74c3c;
            --success-color: #2ecc71;
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
            position: relative;
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
        .error-message {
            color: var(--error-color);
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }
        .error-border {
            border-color: var(--error-color) !important;
        }
        .success-border {
            border-color: var(--success-color) !important;
        }
        .card-preview {
            display: none;
            background: linear-gradient(135deg, #0066cc, #004080);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            position: relative;
            height: 180px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-preview.show {
            display: block;
        }
        .card-number-preview {
            font-size: 20px;
            letter-spacing: 2px;
            margin-top: 30px;
        }
        .card-details {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .card-type-logo {
            position: absolute;
            right: 20px;
            top: 20px;
            height: 40px;
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

        <!-- Card Preview -->
        <div class="card-preview" id="cardPreview">
            <img src="" alt="Card Type" class="card-type-logo" id="cardTypeLogo">
            <div class="card-number-preview" id="cardNumberPreview">•••• •••• •••• ••••</div>
            <div class="card-details">
                <div>
                    <div>Card Holder</div>
                    <div id="cardNamePreview">YOUR NAME</div>
                </div>
                <div>
                    <div>Expires</div>
                    <div id="cardExpiryPreview">••/••</div>
                </div>
            </div>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/${editMode ? 'editcard' : 'addCard'}" id="creditCardForm">

            <c:if test="${editMode}">
                <input type="hidden" name="id" value="${card.id}" />
            </c:if>

            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456"
                       value="${card != null ? card.cardNumber : ''}" maxlength="19">
                <div class="error-message" id="cardNumberError">Please enter a valid 16-digit card number</div>
            </div>

            <div class="form-group">
                <label for="cardName">Name on Card</label>
                <input type="text" id="cardName" name="cardName" placeholder="John Doe"
                       value="${card != null ? card.cardName : ''}">
                <div class="error-message" id="cardNameError">Please enter a valid name (letters only)</div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY"
                           value="${card != null ? card.expiryDate : ''}" maxlength="5">
                    <div class="error-message" id="expiryDateError">Please enter a valid future expiry date (MM/YY)</div>
                </div>

                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="password" id="cvv" name="cvv" placeholder="123"
                           value="${card != null ? card.cvv : ''}" maxlength="3">
                    <div class="error-message" id="cvvError">Please enter a valid 3-digit CVV</div>
                </div>
            </div>

            <div class="form-group">
                <label for="cardType">Card Type</label>
                <select id="cardType" name="cardType">
                    <option value="">Select Card Type</option>
                    <option value="visa" ${card != null && card.cardType == 'visa' ? 'selected' : ''}>Visa</option>
                    <option value="mastercard" ${card != null && card.cardType == 'mastercard' ? 'selected' : ''}>Mastercard</option>
                    <option value="amex" ${card != null && card.cardType == 'amex' ? 'selected' : ''}>American Express</option>
                    <option value="discover" ${card != null && card.cardType == 'discover' ? 'selected' : ''}>Discover</option>
                </select>
                <div class="error-message" id="cardTypeError">Please select a card type</div>
            </div>

            <div class="form-group">
                <label for="billingAddress">Billing Address</label>
                <input type="text" id="billingAddress" name="billingAddress" placeholder="123 Main St, City, Country"
                       value="${card != null ? card.billingAddress : ''}">
                <div class="error-message" id="billingAddressError">Please enter billing address</div>
            </div>

            <div class="form-group">
                <label for="zipCode">ZIP/Postal Code</label>
                <input type="text" id="zipCode" name="zipCode" placeholder="12345"
                       value="${card != null ? card.zipCode : ''}" maxlength="5">
                <div class="error-message" id="zipCodeError">Please enter a valid 5-digit ZIP code</div>
            </div>

            <button type="submit" class="submit-btn">
                ${editMode ? 'Update Card' : 'Save Card'}
            </button>
        </form>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Form elements
        const form = document.getElementById('creditCardForm');
        const cardNumberInput = document.getElementById('cardNumber');
        const cardNameInput = document.getElementById('cardName');
        const expiryDateInput = document.getElementById('expiryDate');
        const cvvInput = document.getElementById('cvv');
        const cardTypeSelect = document.getElementById('cardType');
        const billingAddressInput = document.getElementById('billingAddress');
        const zipCodeInput = document.getElementById('zipCode');
        
        // Card preview elements
        const cardPreview = document.getElementById('cardPreview');
        const cardNumberPreview = document.getElementById('cardNumberPreview');
        const cardNamePreview = document.getElementById('cardNamePreview');
        const cardExpiryPreview = document.getElementById('cardExpiryPreview');
        const cardTypeLogo = document.getElementById('cardTypeLogo');

        // Format card number with spaces
        cardNumberInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
            let formatted = '';
            
            for (let i = 0; i < value.length; i++) {
                if (i > 0 && i % 4 === 0) formatted += ' ';
                formatted += value[i];
            }
            
            e.target.value = formatted;
            updateCardPreview();
        });

        // Format expiry date
        expiryDateInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            
            if (value.length > 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            
            e.target.value = value;
            updateCardPreview();
        });

        // Validate name - letters and spaces only
        cardNameInput.addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/[^a-zA-Z\s]/g, '');
            updateCardPreview();
        });

        // Validate ZIP code - numbers only
        zipCodeInput.addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/\D/g, '');
        });

        // Update card preview
        function updateCardPreview() {
            // Show preview when we have some data
            if (cardNumberInput.value || cardNameInput.value || expiryDateInput.value) {
                cardPreview.classList.add('show');
            } else {
                cardPreview.classList.remove('show');
            }
            
            // Update card number preview
            if (cardNumberInput.value) {
                cardNumberPreview.textContent = cardNumberInput.value;
            } else {
                cardNumberPreview.textContent = '•••• •••• •••• ••••';
            }
            
            // Update card name preview
            if (cardNameInput.value) {
                cardNamePreview.textContent = cardNameInput.value.toUpperCase();
            } else {
                cardNamePreview.textContent = 'YOUR NAME';
            }
            
            // Update expiry date preview
            if (expiryDateInput.value) {
                cardExpiryPreview.textContent = expiryDateInput.value;
            } else {
                cardExpiryPreview.textContent = '••/••';
            }
            
            // Update card type logo
            if (cardTypeSelect.value) {
                cardTypeLogo.src = `https://cdn.jsdelivr.net/gh/devicons/devicon/icons/${cardTypeSelect.value}/${cardTypeSelect.value}-original.svg`;
                cardTypeLogo.alt = cardTypeSelect.value;
                cardTypeLogo.style.display = 'block';
            } else {
                cardTypeLogo.style.display = 'none';
            }
        }

        // Add event listeners for preview updates
        cardNameInput.addEventListener('input', updateCardPreview);
        cardTypeSelect.addEventListener('change', updateCardPreview);

        // Form validation
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            let isValid = true;
            
            // Validate card number (must be exactly 16 digits)
            const cleanedCardNumber = cardNumberInput.value.replace(/\D/g, '');
            if (cleanedCardNumber.length !== 16 || !/^\d+$/.test(cleanedCardNumber)) {
                showError(cardNumberInput, 'cardNumberError', 'Please enter a valid 16-digit card number');
                isValid = false;
            } else {
                hideError(cardNumberInput, 'cardNumberError');
            }
            
            // Validate card name (letters only)
            if (!cardNameInput.value.trim() || !/^[a-zA-Z\s]+$/.test(cardNameInput.value)) {
                showError(cardNameInput, 'cardNameError', 'Please enter a valid name (letters only)');
                isValid = false;
            } else {
                hideError(cardNameInput, 'cardNameError');
            }
            
            // Validate expiry date (must be future date)
            if (!validateExpiryDate(expiryDateInput.value)) {
                showError(expiryDateInput, 'expiryDateError', 'Please enter a valid future expiry date (MM/YY)');
                isValid = false;
            } else {
                hideError(expiryDateInput, 'expiryDateError');
            }
            
            // Validate CVV (must be exactly 3 digits)
            if (!cvvInput.value || cvvInput.value.length !== 3 || !/^\d+$/.test(cvvInput.value)) {
                showError(cvvInput, 'cvvError', 'Please enter a valid 3-digit CVV');
                isValid = false;
            } else {
                hideError(cvvInput, 'cvvError');
            }
            
            // Validate card type
            if (!cardTypeSelect.value) {
                showError(cardTypeSelect, 'cardTypeError', 'Please select a card type');
                isValid = false;
            } else {
                hideError(cardTypeSelect, 'cardTypeError');
            }
            
            // Validate billing address
            if (!billingAddressInput.value.trim()) {
                showError(billingAddressInput, 'billingAddressError', 'Please enter billing address');
                isValid = false;
            } else {
                hideError(billingAddressInput, 'billingAddressError');
            }
            
            // Validate ZIP code (must be exactly 5 digits)
            if (!zipCodeInput.value || zipCodeInput.value.length !== 5 || !/^\d+$/.test(zipCodeInput.value)) {
                showError(zipCodeInput, 'zipCodeError', 'Please enter a valid 5-digit ZIP code');
                isValid = false;
            } else {
                hideError(zipCodeInput, 'zipCodeError');
            }
            
            if (isValid) {
                form.submit();
            }
        });

        // Validation functions
        function validateExpiryDate(expiryDate) {
            if (!expiryDate || expiryDate.length !== 5 || expiryDate.indexOf('/') !== 2) {
                return false;
            }
            
            const [monthStr, yearStr] = expiryDate.split('/');
            const month = parseInt(monthStr, 10);
            const year = parseInt(yearStr, 10);
            
            if (isNaN(month) || isNaN(year) || month < 1 || month > 12) {
                return false;
            }
            
            // Check if date is in the future
            const currentYear = new Date().getFullYear() % 100;
            const currentMonth = new Date().getMonth() + 1;
            
            if (year < currentYear || (year === currentYear && month < currentMonth)) {
                return false;
            }
            
            return true;
        }

        function showError(input, errorId, message) {
            const errorElement = document.getElementById(errorId);
            input.classList.add('error-border');
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }

        function hideError(input, errorId) {
            const errorElement = document.getElementById(errorId);
            input.classList.remove('error-border');
            errorElement.style.display = 'none';
        }

        // Initialize card preview if editing
        if (${card != null}) {
            updateCardPreview();
        }
    });
</script>
</body>
	<%@ include file="../partials/footer.jsp" %>

</html>