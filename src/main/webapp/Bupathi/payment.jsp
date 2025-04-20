<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%@ include file="../partials/header.jsp"%>
<html>
<head>
  <link rel="stylesheet" href="styles.css">

</head>



<body id="paybody">
    <div class="payment-form">
        <h2>Payment Form</h2>
        <form id="paymentForm" onsubmit="return validateForm()">
            <!-- Name Field -->
            <div class="input-container">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
                <span id="nameError" class="error-message"></span>
            </div>
            
            <!-- Email Field -->
            <div class="input-container">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
                <span id="emailError" class="error-message"></span>
            </div>
            
            <!-- Card Number Field -->
            <div class="input-container">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" required>
                <span id="cardError" class="error-message"></span>
            </div>
            
            <!-- Expiration Date Field -->
            <div class="input-container">
                <label for="expiryDate">Expiration Date (MM/YY)</label>
                <input type="text" id="expiryDate" name="expiryDate" required>
                <span id="expiryError" class="error-message"></span>
            </div>
            
            <!-- CVV Field -->
            <div class="input-container">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" required>
                <span id="cvvError" class="error-message"></span>
            </div>
            
            <!-- Amount Field -->
            <div class="input-container">
                <label for="amount">Amount</label>
                <input type="number" id="amount" name="amount" required>
                <span id="amountError" class="error-message"></span>
            </div>


            <!-- remarks-->
            <div class="input-container">
                <label for="Remarks">Remarks</label>
                <input type="number" id="Remarks" name="Remarks" >
                <span id="Remarks" class="Remarks"></span>
            </div>
            
            <!-- Submit Button -->
            <button type="submit">Proceed to Payment</button>
        </form>
    </div>
    
    <%@ include file="../partials/footer.jsp"%>
    
    <script src="script.js"></script>




</body>
</html>