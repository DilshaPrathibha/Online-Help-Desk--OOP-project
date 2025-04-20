// Validate the form fields
function validateForm() {
    let isValid = true;

    // Reset previous error messages
    resetErrors();

    // Name Validation
    const name = document.getElementById("name").value.trim();
    if (name === "") {
        showError("nameError", "Full Name is required.");
        isValid = false;
    }

    // Email Validation
    const email = document.getElementById("email").value.trim();
    if (!isValidEmail(email)) {
        showError("emailError", "Please enter a valid email address.");
        isValid = false;
    }

    // Card Number Validation
    const cardNumber = document.getElementById("cardNumber").value.trim();
    if (!isValidCardNumber(cardNumber)) {
        showError("cardError", "Please enter a valid card number.");
        isValid = false;
    }

    // Expiration Date Validation
    const expiryDate = document.getElementById("expiryDate").value.trim();
    if (!isValidExpiryDate(expiryDate)) {
        showError("expiryError", "Please enter a valid expiration date (MM/YY).");
        isValid = false;
    }

    // CVV Validation
    const cvv = document.getElementById("cvv").value.trim();
    if (!isValidCVV(cvv, cardNumber)) {
        showError("cvvError", "Please enter a valid CVV.");
        isValid = false;
    }

    // Amount Validation
    const amount = document.getElementById("amount").value.trim();
    if (!isValidAmount(amount)) {
        showError("amountError", "Please enter a valid amount greater than zero.");
        isValid = false;
    }

    return isValid;
}

// Function to validate email
function isValidEmail(email) {
    const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return emailRegex.test(email);
}

// Function to validate card number using Luhn Algorithm
function isValidCardNumber(cardNumber) {
    const cardNumberRegex = /^\d{13,19}$/; // Card numbers are typically 13-19 digits
    if (!cardNumberRegex.test(cardNumber)) {
        return false;
    }
    return luhnCheck(cardNumber);
}

// Luhn Algorithm for card number validation
function luhnCheck(cardNumber) {
    let sum = 0;
    for (let i = 0; i < cardNumber.length; i++) {
        let digit = parseInt(cardNumber[i]);
        if ((cardNumber.length - i) % 2 === 0) {
            digit *= 2;
            if (digit > 9) digit -= 9;
        }
        sum += digit;
    }
    return sum % 10 === 0;
}

// Function to validate expiration date
function isValidExpiryDate(expiryDate) {
    const dateParts = expiryDate.split('/');
    if (dateParts.length !== 2 || dateParts[0].length !== 2 || dateParts[1].length !== 2) {
        return false; // Invalid format
    }

    const [month, year] = dateParts;

    // Validate month (01-12)
    if (isNaN(month) || month < 1 || month > 12) {
        return false; // Invalid month
    }

    // Validate year (must be 2 digits)
    if (isNaN(year)) {
        return false; // Invalid year
    }

    // Check if the date is in the past
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear() % 100; // Get last two digits of the year
    const currentMonth = currentDate.getMonth() + 1; // Months are zero-based

    // Convert year to full year (e.g., 23 -> 2023)
    const fullYear = 2000 + parseInt(year);

    // Check if the expiry date is in the past
    if (fullYear < currentDate.getFullYear() || (fullYear === currentDate.getFullYear() && month < currentMonth)) {
        return false; // Expired
    }

    return true;
}

// Function to validate CVV
function isValidCVV(cvv, cardNumber) {
    const cvvRegex = /^\d{3,4}$/; // CVV is 3 or 4 digits
    if (!cvvRegex.test(cvv)) {
        return false;
    }

    // Check if CVV length matches card type
    const cardType = getCardType(cardNumber);
    if (cardType === "amex" && cvv.length !== 4) {
        return false; // American Express requires 4-digit CVV
    } else if (cardType !== "amex" && cvv.length !== 3) {
        return false; // Other cards require 3-digit CVV
    }

    return true;
}

// Function to detect card type
function getCardType(cardNumber) {
    if (/^4/.test(cardNumber)) {
        return "visa";
    } else if (/^5[1-5]/.test(cardNumber)) {
        return "mastercard";
    } else if (/^3[47]/.test(cardNumber)) {
        return "amex"; // American Express
    } else if (/^6(?:011|5)/.test(cardNumber)) {
        return "discover";
    } else {
        return "unknown";
    }
}

// Function to validate amount
function isValidAmount(amount) {
    return !isNaN(amount) && parseFloat(amount) > 0;
}

// Function to show error messages
function showError(fieldId, message) {
    const errorElement = document.getElementById(fieldId);
    errorElement.textContent = message;
    errorElement.style.display = "block";
    document.getElementById(fieldId.replace("Error", "")).classList.add("error");
}

// Reset error messages
function resetErrors() {
    const errorMessages = document.querySelectorAll(".error-message");
    errorMessages.forEach(function (error) {
        error.style.display = "none";
    });

    const errorFields = document.querySelectorAll(".error");
    errorFields.forEach(function (field) {
        field.classList.remove("error");
    });
}

// Add event listeners for real-time validation
document.getElementById("name").addEventListener("blur", function () {
    const name = this.value.trim();
    if (name === "") {
        showError("nameError", "Full Name is required.");
    } else {
        resetErrors();
    }
});

document.getElementById("email").addEventListener("blur", function () {
    const email = this.value.trim();
    if (!isValidEmail(email)) {
        showError("emailError", "Please enter a valid email address.");
    } else {
        resetErrors();
    }
});

document.getElementById("cardNumber").addEventListener("blur", function () {
    const cardNumber = this.value.trim();
    if (!isValidCardNumber(cardNumber)) {
        showError("cardError", "Please enter a valid card number.");
    } else {
        resetErrors();
    }
});

document.getElementById("expiryDate").addEventListener("blur", function () {
    const expiryDate = this.value.trim();
    if (!isValidExpiryDate(expiryDate)) {
        showError("expiryError", "Please enter a valid expiration date (MM/YY).");
    } else {
        resetErrors();
    }
});

document.getElementById("cvv").addEventListener("blur", function () {
    const cvv = this.value.trim();
    const cardNumber = document.getElementById("cardNumber").value.trim();
    if (!isValidCVV(cvv, cardNumber)) {
        showError("cvvError", "Please enter a valid CVV.");
    } else {
        resetErrors();
    }
});

document.getElementById("amount").addEventListener("blur", function () {
    const amount = this.value.trim();
    if (!isValidAmount(amount)) {
        showError("amountError", "Please enter a valid amount greater than zero.");
    } else {
        resetErrors();
    }
});