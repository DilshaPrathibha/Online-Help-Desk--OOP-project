<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../partials/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Appointment</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

    <style>
    	body {
		    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		    background: linear-gradient(to right, #f0f8fc, #ade5fb);
		    margin: 0;
		    padding: 0;
		}
		
		.container {
		    background-color: rgba(255, 255, 255, 0.95);
		    width: 40rem;
		    margin: 60px auto;
		    border-radius: 15px;
		    padding: 40px 50px;
		    display: flex;
		    flex-direction: column;
		    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
		}
		
		h1.topic {
		    text-align: center;
		    font-size: 2rem;
		    color: #003366;
		    margin-bottom: 30px;
		    border-bottom: 2px solid #3498db;
		    padding-bottom: 10px;
		}
		
		form label {
		    font-weight: 600;
		    display: block;
		    margin-top: 20px;
		    color: #003366;
		}
		
		form input[type="text"],
		form input[type="email"],
		form input[type="tel"],
		form input[type="date"],
		form select,
		form textarea {
		    width: 100%;
		    padding: 10px 15px;
		    margin-top: 8px;
		    border: 1px solid #ccc;
		    border-radius: 8px;
		    font-size: 1rem;
		    transition: border-color 0.3s;
		}
		
		form input:focus,
		form select:focus,
		form textarea:focus {
		    border-color: #3498db;
		    outline: none;
		}
		
		form textarea {
		    resize: vertical;
		}
        .btn {
            margin-top: 25px;
            padding: 12px 20px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2c3e50;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="leftside">
        <h1 class="topic">Counseling Appointment</h1><br>
        <p class="content">Please update your appointment details below.</p>
    </div><br>
    <div class="rightside">
        <form method="POST" action="${pageContext.request.contextPath}/Dinali/updateAppointment"> 

            <input type="hidden" name="id" value="${appointment.id}" />

            <label for="name">Student Name:</label>
            <input type="text" name="name" value="${appointment.name}" required><br>

            <label for="email">Student Email:</label>
            <input type="text" name="email" value="${appointment.email}" required><br>

			<label for="tel">Phone Number:</label>
			<input type="tel" id="tel" name="tel" value="${appointment.tel}"  required><br>


            <label for="reason">Reason for Counseling:</label>
            <select name="reason" required>
                <option value="">Select Reason</option>
                <option value="Academic Stress" <c:if test="${appointment.reason == 'Academic Stress'}">selected</c:if>>Academic Stress</option>
                <option value="Career Guidance" <c:if test="${appointment.reason == 'Career Guidance'}">selected</c:if>>Career Guidance</option>
                <option value="Personal Issues" <c:if test="${appointment.reason == 'Personal Issues'}">selected</c:if>>Personal Issues</option>
                <option value="Mental Health Support" <c:if test="${appointment.reason == 'Mental Health Support'}">selected</c:if>>Mental Health Support</option>
                <option value="Other" <c:if test="${appointment.reason == 'Other'}">selected</c:if>>Other..</option>
            </select><br>

			<label for="date">Appointment Date:</label>
			<input type="date" id="date" name="date" value="${appointment.date}" required><br>

            <label for="mode">Mode of Counseling:</label>
            <select name="mode" required>
                <option value="">Select Type</option>
                <option value="In-Person" <c:if test="${appointment.mode == 'In-Person'}">selected</c:if>>In-Person</option>
                <option value="Virtual" <c:if test="${appointment.mode == 'Virtual'}">selected</c:if>>Virtual</option>
                <option value="Phone Call" <c:if test="${appointment.mode == 'Phone Call'}">selected</c:if>>Phone Call</option>
            </select><br>

         <label for="counselor">Preferred Counselor:</label>
		<select id="counselor" name="counselor" required>
		    <option value="">Select a counselor</option>
		    <option value="Dr. Saman Perera" <c:if test="${appointment.counselor == 'Dr. Saman Perera'}">selected</c:if>>Dr. Saman Perera (Clinical Psychologist)</option>
		    <option value="Dr. Nimali Fernando" <c:if test="${appointment.counselor == 'Dr. Nimali Fernando'}">selected</c:if>>Dr. Nimali Fernando (Career Counselor)</option>
		    <option value="Dr. Rajitha Silva" <c:if test="${appointment.counselor == 'Dr. Rajitha Silva'}">selected</c:if>>Dr. Rajitha Silva (Family Therapist)</option>
		    <option value="Dr. Priyanka Bandara" <c:if test="${appointment.counselor == 'Dr. Priyanka Bandara'}">selected</c:if>>Dr. Priyanka Bandara (Cognitive Behavioral Therapist)</option>
		    <option value="Dr. Asanka Gamage" <c:if test="${appointment.counselor == 'Dr. Asanka Gamage'}">selected</c:if>>Dr. Asanka Gamage (Student Counselor)</option>
		</select><br>

            <label for="concern">Briefly Describe Your Concern:</label>
            <textarea name="concern" rows="4" cols="50" required>${appointment.concern}</textarea><br><br>

            <button class="btn" type="submit">Update Appointment</button>
            <button class="btn" type="button" onclick="window.history.back();" style="background-color: #6c757d;">Cancel</button>

        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<c:if test="${not empty message}">
  <script>
    toastr.options = {
      closeButton: true,
      positionClass: 'toast-top-right',
      timeOut: 3000
    };
    toastr.success('${fn:escapeXml(message)}');
  </script>
</c:if>

<script>
    window.addEventListener('DOMContentLoaded', function () {
        const dateInput = document.getElementById('date');

        // Set min attribute to today's date
        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0'); 
        const dd = String(today.getDate()).padStart(2, '0');
        const todayStr = ${yyyy}-${mm}-${dd};
        dateInput.setAttribute('min', todayStr);

        
        dateInput.addEventListener('change', function () {
            const selectedDate = new Date(this.value);
            today.setHours(0, 0, 0, 0); 

            if (selectedDate < today) {
                alert("Please select today or a future date. Past dates are not allowed.");
                this.value = ""; 
            }
        });
    });
</script>

</body>
</html>

<%@ include file="../partials/footer.jsp" %>