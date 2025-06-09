<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp"%>
<%@ page import="model.Student" %>

<%
    // Check if user is logged in
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Counseling Appointment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
		.container {
		    background-color: rgb(210, 212, 220, 0.7);
		    width: 70rem;
		    margin: 60px auto 60px;
		    border-radius: 15px;
		    padding: 40px 0;
		    display:flex;
		    box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		    justify-content: center;
		}
		.leftside {
		    margin: 100px auto auto 40px;
		    width: 320px;
		    padding: 15px;
		    position: sticky;
		    top: 150px;
		    height: 400px;
		}
		.imageapp{
			width: 250px;
			height: 200px;
			padding:5px;
		}
		.rightside {
		    margin: auto 80px auto auto;
		    padding: 20px 0 20px;
		}
		.topic {
		    color: #003366;    
		}
		.content {
		    color: #023a71;
		}
		label{
			color: #003366;
			font-size: 18px;
		}
		input, select, textarea{
		    width: 28rem;
		    padding: 12px;
		    margin-top: 5px;
		    margin-bottom: 20px;
		    border-radius: 10px;
		    border: 1px solid #ccc;
		    font-family: 'Arial', sans-serif;
		    font-size: 16px;
		    font-weight: 100;
		    color: #4a4a4a;
		    box-shadow: 0 5px 5px rgba(0, 0, 0, 0.5);
		}
		input:focus,
		select:focus,
		textarea:focus {
		    border-color: #3498db;
		    outline: none;
		}
		textarea {
		    resize: vertical;
		}
        .btn {
            background-color: #003366;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn:hover {
            background-color: #16212c;
            transform: translateY(-2px);
        }
		
        .responseMessage {
            margin: 1rem 0;
        }
        
        .error {
            color: var(--danger);
            padding: 0.75rem;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
        }
        
        .success {
            color: var(--success);
            padding: 0.75rem;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="leftside">
            <h1 class="topic">Counseling Appointment</h1><br>
            <p class="content">Please fill out this form to schedule a counseling appointment.</p>
            <img src="./images/counseling.png" class="imageapp" alt="counselling image">
        </div>
        <div class="rightside">
            <form id="requestForm" method="POST" action="${pageContext.request.contextPath}/addAppointments">
                <input type="hidden" name="stid" value="<%= student.getStdid() %>">
                
                <label for="name">Student Name:</label><br>
                <input type="text" id="name" name="name" value="<%= student.getFullname() != null ? student.getFullname() : "" %>"  required><br>
                
                <label for="email">Student Email:</label><br>
                <input type="email" id="email" name="email" value="<%= student.getEmail() != null ? student.getEmail() : "" %>"  required><br>

				<label for="tel">Phone Number:</label><br>
				<input type="tel" id="tel" name="tel" value="<%= student.getPhonenumber() != null ? student.getPhonenumber() : "" %>" required><br>
   
                <label for="reason">Reason for Counseling:</label><br>
                <select id="reason" name="reason" required>
                    <option value="">Select Reason</option>
                    <option value="Academic Stress">Academic Stress</option>
                    <option value="Career Guidance">Career Guidance</option>
                    <option value="Personal Issues">Personal Issues</option>
                    <option value="Mental Health Support">Mental Health Support</option>
                    <option value="Other">Other..</option>
                </select><br>

				<%
				    java.time.LocalDate today = java.time.LocalDate.now();
				%>
				
				<label for="date">Appointment Date:</label><br>
				<input type="date" id="date" name="date" min="<%= today %>" required><br>

                <label for="mode">Mode of Counseling:</label><br>
	                <select id="mode" name="mode" required>
	                    <option value="">Select Type</option>
	                    <option value="In-Person">In-Person</option>
	                    <option value="Virtual">Virtual</option>
	                    <option value="Phone Call">Phone Call</option>
	                </select><br>
    
               <label for="counselor">Preferred Counselor:</label><br>
					<select id="counselor" name="counselor" required>
					    <option value="">Select a counselor</option>
					    <option value="Dr. Saman Perera">Dr. Saman Perera (Clinical Psychologist)</option>
					    <option value="Dr. Nimali Fernando">Dr. Nimali Fernando (Career Counselor)</option>
					    <option value="Dr. Rajitha Silva">Dr. Rajitha Silva (Family Therapist)</option>
					    <option value="Dr. Priyanka Bandara">Dr. Priyanka Bandara (Cognitive Behavioral Therapist)</option>
					    <option value="Dr. Asanka Gamage">Dr. Asaka Gamage (Student Counselor)</option>
					</select><br>

                <label for="concern">Briefly Describe Your Concern:</label><br>
                <textarea id="concern" name="concern" rows="4" cols="50" placeholder="Enter your concern" required></textarea><br><br>
    
                <div id="responseMessage" class="responseMessage">
                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="error"><%= request.getAttribute("errorMessage") %></div>
                    <% } %>
                    <% if (request.getAttribute("successMessage") != null) { %>
                        <div class="success"><%= request.getAttribute("successMessage") %></div>
                    <% } %>
                </div>
                
                <button class="btn" type="submit">
                    <i class="material-icons">event_available</i>  Book Appointment
                </button>
            </form>
        </div>
    </div>
	<script>
	    document.getElementById('date').addEventListener('change', function () {
	        const selectedDate = new Date(this.value);
	        const today = new Date();
	        today.setHours(0, 0, 0, 0); // ignore time portion
	
	        if (selectedDate < today) {
	            alert("Please select today or a future date. Past dates are not allowed.");
	            this.value = ""; // clear invalid input
	        }
	    });
	    
	    document.getElementById("tel").addEventListener("input", function () {
	        const telField = this;
	        const value = telField.value.trim();

	        // Regex: starts with 0 followed by 9 digits OR +94 followed by 9 digits
	        const phoneRegex = /^(0\d{9}|\+94\d{9})$/;

	        if (value === "" || phoneRegex.test(value)) {
	          telField.setCustomValidity(""); // valid
	        } else {
	          telField.setCustomValidity("Enter a valid phone number (e.g., 0712345678 or +94712345678)");
	        }
	      });
	</script>
</body>
</html>
<%@ include file="../partials/footer.jsp"%>