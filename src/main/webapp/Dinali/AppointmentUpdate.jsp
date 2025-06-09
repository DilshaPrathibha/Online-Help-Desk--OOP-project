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
        <h1 class="topic"> My Appointment</h1><br>
    </div>
    <div class="rightside">
        <form id="requestForm" method="POST" action="updateAppointment">
        
        	<input type="hidden" name="id" value="${param.id}" />

            <label for="name">Student Name:</label><br>
            <input type="text" name="name" value="${param.name}" required><br>

            <label for="email">Student Email:</label><br>
            <input type="text" name="email" value="${param.email}" required><br>

            <label for="tel">Phone Number:</label><br>
            <input type="tel" name="tel" value="${param.tel}" required><br>

            <label for="reason">Reason for Counseling:</label><br>
            <select name="reason" required>
                <option value="">Select Reason</option>
                <option value="Academic Stress" <c:if test="${param.reason == 'Academic Stress'}">selected</c:if>>Academic Stress</option>
                <option value="Career Guidance" <c:if test="${param.reason == 'Career Guidance'}">selected</c:if>>Career Guidance</option>
                <option value="Personal Issues" <c:if test="${param.reason == 'Personal Issues'}">selected</c:if>>Personal Issues</option>
                <option value="Mental Health Support" <c:if test="${param.reason == 'Mental Health Support'}">selected</c:if>>Mental Health Support</option>
                <option value="Other" <c:if test="${param.reason == 'Other'}">selected</c:if>>Other..</option>
            </select><br>

            <label for="date">Appointment Date:</label><br>
            <input type="date" name="date" value="${param.date}" required><br>

            <label for="mode">Mode of Counseling:</label><br>
            <select name="mode" required>
                <option value="">Select Type</option>
                <option value="In-Person" <c:if test="${param.mode == 'In-Person'}">selected</c:if>>In-Person</option>
                <option value="Virtual" <c:if test="${param.mode == 'Virtual'}">selected</c:if>>Virtual</option>
                <option value="Phone Call" <c:if test="${param.mode == 'Phone Call'}">selected</c:if>>Phone Call</option>
            </select><br>

            <label for="counselor">Preferred Counselor:</label><br>
            <select name="counselor" required>
                <option value="">Select a counselor</option>
                <option value="dr1" <c:if test="${param.counselor == 'dr1'}">selected</c:if>>Dr. Saman</option>
            </select><br>

            <label for="concern">Briefly Describe Your Concern:</label><br>
            <textarea name="concern" rows="4" cols="50" required>${param.concern}</textarea><br><br>

            <div id="responseMessage" class="responseMessage"></div>
            <button class="btn" type="submit">Update Appointment</button>
        </form>
    </div>
</div>

</body>
</html>

<%@ include file="../partials/footer.jsp" %>
