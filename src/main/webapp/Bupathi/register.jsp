<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register Form</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: url('media/girlwritting.jpg') no-repeat center center fixed;
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
        }

        .register-form {
            max-width: 450px;
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px;
            margin: 80px auto 40px auto;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.25);
            color: #333;
        }

        h2 {
            text-align: center;
            color: #0056b3;
            margin-bottom: 25px;
            font-weight: bold;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: 0.3s;
            background-color: #fff;
        }

        input:focus, select:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0,123,255,0.4);
            outline: none;
        }

        .error-message {
            color: red;
            font-size: 12px;
            display: none;
            margin-top: -5px;
            margin-bottom: 10px;
        }

        input.invalid {
            border: 1px solid #ff6b6b;
            background-color: #fff0f0;
        }

        input.valid {
            border: 1px solid #51cf66;
            background-color: #f0fff4;
        }

        button[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            font-weight: bold;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23007BFF'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 15px;
        }

        footer {
            background-color: rgba(0,0,0,0.7);
            color: white;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>

<body id="registerbody">
    <div class="register-form">
        <h2>Register Form</h2>
        <form id="register-form" method="post" action="${pageContext.request.contextPath}/Addstudent" onsubmit="return validateForm()">

            <div class="input-container">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname">
                <span class="error-message" id="fullnameError">Name should contain only letters and spaces</span>
            </div>

            <div class="input-container">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
                <span class="error-message" id="emailError">Please enter a valid email address</span>
            </div>

            <div class="input-container">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone">
                <span class="error-message" id="phoneError">Phone must be 10 digits starting with 0</span>
            </div>

            <div class="input-container">
                <label for="studentID">Student ID</label>
                <input type="text" id="studentID" name="studentID">
                <span class="error-message" id="studentIDError">Format: IT/It followed by 8 digits (e.g., IT23453456)</span>
            </div>

            <div class="input-container">
                <label for="semester">Semester</label>
                <select id="semester" name="semester">
                    <option value="">Select Semester</option>
                    <option value="1">Semester 1</option>
                    <option value="2">Semester 2</option>
                    <option value="3">Semester 3</option>
                    <option value="4">Semester 4</option>
                    <option value="5">Semester 5</option>
                    <option value="6">Semester 6</option>
                    <option value="7">Semester 7</option>
                    <option value="8">Semester 8</option>
                </select>
                <span class="error-message" id="semesterError">Please select a semester</span>
            </div>

            <div class="input-container">
                <label for="studyField">Field of Study</label>
                <select id="studyField" name="studyField">
                    <option value="">Select Field</option>
                    <option value="IT">Information Technology</option>
                    <option value="CS">Computer Science</option>
                    <option value="SE">Software Engineering</option>
                    <option value="DS">Data Science</option>
                    <option value="Cyber">Cyber Security</option>
                </select>
                <span class="error-message" id="studyFieldError">Please select a field of study</span>
            </div>

            <div class="input-container">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob">
                <span class="error-message" id="dobError">Birth date must be before 2003</span>
            </div>

            <div class="input-container">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
                <span class="error-message" id="usernameError">Username is required</span>
            </div>

            <div class="input-container">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
                <span class="error-message" id="passwordError">Password must be at least 8 characters with uppercase, lowercase, number and special character</span>
            </div>

            <div class="input-container">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
                <span class="error-message" id="confirmPasswordError">Passwords must match</span>
            </div>

            <button type="submit">Register</button>
        </form>
    </div>

    <%@ include file="../partials/footer.jsp" %>

    <script>
        document.getElementById('fullname').addEventListener('input', validateFullName);
        document.getElementById('email').addEventListener('input', validateEmail);
        document.getElementById('phone').addEventListener('input', validatePhone);
        document.getElementById('studentID').addEventListener('input', validateStudentID);
        document.getElementById('semester').addEventListener('change', validateSemester);
        document.getElementById('studyField').addEventListener('change', validateStudyField);
        document.getElementById('dob').addEventListener('change', validateDOB);
        document.getElementById('username').addEventListener('input', validateUsername);
        document.getElementById('password').addEventListener('input', validatePassword);
        document.getElementById('confirmPassword').addEventListener('input', validateConfirmPassword);

        function validateFullName() {
            const fullname = document.getElementById('fullname').value;
            const regex = /^[a-zA-Z\s]+$/;
            const isValid = regex.test(fullname) && fullname.length >= 3;
            toggleValidation('fullname', isValid, 'fullnameError');
            return isValid;
        }

        function validateEmail() {
            const email = document.getElementById('email').value;
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const isValid = regex.test(email);
            toggleValidation('email', isValid, 'emailError');
            return isValid;
        }

        function validatePhone() {
            const phone = document.getElementById('phone').value;
            const regex = /^0\d{9}$/;
            const isValid = regex.test(phone);
            toggleValidation('phone', isValid, 'phoneError');
            return isValid;
        }

        function validateStudentID() {
            const studentID = document.getElementById('studentID').value;
            const regex = /^(IT|it)\d{8}$/i;
            const isValid = regex.test(studentID);
            toggleValidation('studentID', isValid, 'studentIDError');
            return isValid;
        }

        function validateSemester() {
            const semester = document.getElementById('semester').value;
            const isValid = semester !== '';
            toggleValidation('semester', isValid, 'semesterError');
            return isValid;
        }

        function validateStudyField() {
            const studyField = document.getElementById('studyField').value;
            const isValid = studyField !== '';
            toggleValidation('studyField', isValid, 'studyFieldError');
            return isValid;
        }

        function validateDOB() {
            const dob = document.getElementById('dob').value;
            if (!dob) {
                toggleValidation('dob', false, 'dobError');
                return false;
            }
            const dobDate = new Date(dob);
            const cutoffDate = new Date('2003-01-01');
            const isValid = dobDate < cutoffDate;
            toggleValidation('dob', isValid, 'dobError');
            return isValid;
        }

        function validateUsername() {
            const username = document.getElementById('username').value;
            const isValid = username.length >= 4;
            toggleValidation('username', isValid, 'usernameError');
            return isValid;
        }

        function validatePassword() {
            const password = document.getElementById('password').value;
            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            const isValid = regex.test(password);
            toggleValidation('password', isValid, 'passwordError');
            if (document.getElementById('confirmPassword').value) {
                validateConfirmPassword();
            }
            return isValid;
        }

        function validateConfirmPassword() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const isValid = confirmPassword === password && password !== '';
            toggleValidation('confirmPassword', isValid, 'confirmPasswordError');
            return isValid;
        }

        function toggleValidation(fieldId, isValid, errorId) {
            const field = document.getElementById(fieldId);
            const error = document.getElementById(errorId);

            if (isValid) {
                field.classList.remove('invalid');
                field.classList.add('valid');
                error.style.display = 'none';
            } else {
                field.classList.remove('valid');
                field.classList.add('invalid');
                error.style.display = 'block';
            }
        }

        function validateForm() {
            return validateFullName() && validateEmail() && validatePhone() && validateStudentID() &&
                   validateSemester() && validateStudyField() && validateDOB() &&
                   validateUsername() && validatePassword() && validateConfirmPassword();
        }
    </script>
</body>
</html>
