// Debugging: Ensure script is loaded
console.log("register.js loaded successfully");

// Get the form and add event listener
document.getElementById("register-form").addEventListener("submit", function (event) {
    event.preventDefault(); // Prevent default submission
    clearErrors(); // Clear previous errors

    let isValid = true;

    isValid = validateField("fullname", "Full Name is required.") && isValid;
    isValid = validateField("email", "Enter a valid email.") && isValid;
    isValid = validateField("phone", "Enter a valid phone number.") && isValid;
    isValid = validateField("studentID", "Student ID is required.") && isValid;
    isValid = validateField("semester", "Select your semester.") && isValid;
    isValid = validateField("studyField", "Select your field of study.") && isValid;
    isValid = validateField("dob", "Date of Birth is required.") && isValid;
    isValid = validateField("username", "Username is required.") && isValid;
    isValid = validateField("password", "Password must be at least 6 characters.", 6) && isValid;
    isValid = validatePasswordMatch("password", "confirmPassword", "Passwords do not match.") && isValid;
    isValid = validateEmail("email", "Enter a valid email.") && isValid;
    isValid = validatePhoneNumber("phone", "Enter a valid phone number.") && isValid;
    isValid = validatePasswordStrength("password", "Password must be at least 6 characters long and include a number.") && isValid;

    if (isValid) {
        alert("Registration Successful!");
        this.submit(); // Allow form submission
    }
});

// Function to validate a field
function validateField(fieldId, errorMessage, minLength = 1) {
    const field = document.getElementById(fieldId);
    const errorSpan = document.getElementById(fieldId + "Error");

    if (field && errorSpan) {
        if (field.value.trim().length < minLength) {
            errorSpan.innerText = errorMessage;
            errorSpan.style.display = "block";
            return false;
        } else {
            errorSpan.style.display = "none";
            return true;
        }
    }
    return false;
}

// Function to validate email format
function validateEmail(fieldId, errorMessage) {
    const field = document.getElementById(fieldId);
    const errorSpan = document.getElementById(fieldId + "Error");
    const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if (!field.value.trim().match(emailPattern)) {
        errorSpan.innerText = errorMessage;
        errorSpan.style.display = "block";
        return false;
    } else {
        errorSpan.style.display = "none";
        return true;
    }
}

// Function to validate password match
function validatePasswordMatch(passwordId, confirmPasswordId, errorMessage) {
    const password = document.getElementById(passwordId).value.trim();
    const confirmPassword = document.getElementById(confirmPasswordId).value.trim();
    const errorSpan = document.getElementById(confirmPasswordId + "Error");

    if (password !== confirmPassword) {
        errorSpan.innerText = errorMessage;
        errorSpan.style.display = "block";
        return false;
    } else {
        errorSpan.style.display = "none";
        return true;
    }
}

// Function to validate phone number format
function validatePhoneNumber(fieldId, errorMessage) {
    const field = document.getElementById(fieldId);
    const errorSpan = document.getElementById(fieldId + "Error");
    const phonePattern = /^\d{10}$/; // Assumes a 10-digit phone number

    if (!field.value.trim().match(phonePattern)) {
        errorSpan.innerText = errorMessage;
        errorSpan.style.display = "block";
        return false;
    } else {
        errorSpan.style.display = "none";
        return true;
    }
}

// Function to clear all error messages
function clearErrors() {
    document.querySelectorAll(".error-message").forEach((span) => {
        span.style.display = "none";
        span.innerText = "";
    });
}
