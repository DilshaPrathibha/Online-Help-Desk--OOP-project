<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../partials/header.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Help Desk</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="styleD.css">
</head>
<body>

<div class="container">
    <div class="leftside">
		<h1 class="topic">Counseling Appointment</h1><br>
		<p class="content">Please fill out this form to schedule a counseling appointment. We will notify you once your appointment is confirmed.</p>
    </div>
    <div class="rightside">


            <c:set var="appoin" value="${appointment}" />

            <label for="name">Student Name:</label><br>
            <input type="text" name="name" value="${appoin.name}" required><br>

            <label for="email">Student Email:</label><br>
            <input type="text" name="email" value="${appoin.email}" required><br>

            <label for="tel">Phone Number:</label><br>
            <input type="tel" name="tel" value="${appoin.tel}" required><br>

            <label for="reason">Reason for Counseling:</label><br>
            <select name="reason" required>
                <option value="">Select Reason</option>
                <option value="Academic Stress" <c:if test="${appoin.reason == 'Academic Stress'}">selected</c:if>>Academic Stress</option>
                <option value="Career Guidance" <c:if test="${appoin.reason == 'Career Guidance'}">selected</c:if>>Career Guidance</option>
                <option value="Personal Issues" <c:if test="${appoin.reason == 'Personal Issues'}">selected</c:if>>Personal Issues</option>
                <option value="Mental Health Support" <c:if test="${appoin.reason == 'Mental Health Support'}">selected</c:if>>Mental Health Support</option>
                <option value="Other" <c:if test="${appoin.reason == 'Other'}">selected</c:if>>Other..</option>
            </select><br>

            <label for="date">Appointment Date:</label><br>
            <input type="date" name="date" value="${appoin.date}" required><br>

            <label for="mode">Mode of Counseling:</label><br>
            <select name="mode" required>
                <option value="">Select Type</option>
                <option value="In-Person" <c:if test="${appoin.mode == 'In-Person'}">selected</c:if>>In-Person</option>
                <option value="Virtual" <c:if test="${appoin.mode == 'Virtual'}">selected</c:if>>Virtual</option>
                <option value="Phone Call" <c:if test="${appoin.mode == 'Phone Call'}">selected</c:if>>Phone Call</option>
            </select><br>

            <label for="counselor">Preferred Counselor:</label><br>
            <select name="counselor" required>
                <option value="">Select a counselor</option>
                <option value="dr1" <c:if test="${appoin.counselor == 'dr1'}">selected</c:if>>Dr. Saman</option>
            </select><br>

            <label for="concern">Briefly Describe Your Concern:</label><br>
            <textarea name="concern" rows="4" cols="50" placeholder="Enter your concern" required>${appoin.concern}</textarea><br><br>


                     

    </div>
</div>

</body>
</html>

<%@ include file="../partials/footer.jsp" %>
