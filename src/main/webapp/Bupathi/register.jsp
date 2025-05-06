<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <%@ include file="../partials/header.jsp" %> 
    <link rel="stylesheet" href="styles.css">
    
</head>

<body id="registerbody">

    <div class="register-form" style="padding-top: 20px;"> 
        <h2>Register Form</h2>
        <form id="register-form" method="post" action="${pageContext.request.contextPath}/Addstudent">

            <div class="input-container">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname">
                <span class="error-message" id="fullnameError"></span>
            </div>

            <div class="input-container">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
                <span class="error-message" id="emailError"></span>
            </div>

            <div class="input-container">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone">
                <span class="error-message" id="phoneError"></span>
            </div>

            <div class="input-container">
                <label for="studentID">Student ID</label>
                <input type="text" id="studentID" name="studentID">
                <span class="error-message" id="studentIDError"></span>
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
                <span class="error-message" id="semesterError"></span>
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
                <span class="error-message" id="studyFieldError"></span>
            </div>

            <div class="input-container">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob">
                <span class="error-message" id="dobError"></span>
            </div>

            <div class="input-container">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
                <span class="error-message" id="usernameError"></span>
            </div>

            <div class="input-container">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
                <span class="error-message" id="passwordError"></span>
            </div>

            <div class="input-container">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
                <span class="error-message" id="confirmPasswordError"></span>
            </div>

            <button type="submit">Register</button>
        </form>
    </div>

    <%@ include file="../partials/footer.jsp" %>

    <!-- Linking JavaScript file -->
    

</body>
</html>
