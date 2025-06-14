<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"> <!-- for inline css -->

<style>
     body {
        font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
        background: linear-gradient(135deg, #f5f7fa 0%, #e9ecef 100%);
        margin: 0;
        padding: 0;
        color: #2c3e50;
        line-height: 1.6;
     } 
    .ticket-form {
        max-width: 900px;
        margin: 30px auto;
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    .topic1 {
        color: #01274e;
        text-align: center;
        font-weight: 700;
        letter-spacing: 1px;
        margin-bottom: 25px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .form-grid .full-width {
        grid-column: span 2;
    }

    label {
        font-weight: 600;
        margin-bottom: 8px;
        color: #2c3e50;
        display: block;
    }

    input, select, textarea {
        width: 100%;
        padding: 12px;
        border: 2px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        transition: all 0.3s ease;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    input:focus, select:focus, textarea:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
    }

    .tBtn {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background: linear-gradient(to right, #007bff, #0056b3);
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        font-weight: bold;
    }

    .tBtn:hover {
        box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
    }

    .file-upload-wrapper {
        margin-top: 10px;
        position: relative;
        display: flex;
        align-items: center;
    }

    .file-upload-wrapper input[type="file"] {
        position: absolute;
        opacity: 0;
        width: 100%;
        height: 100%;
        cursor: pointer;
    }

    .custom-file-upload {
        display: inline-block;
        padding: 10px 15px;
        background: #e0e0e0;
        color: #2c3e50;
        font-size: 14px;
        font-weight: bold;
        border-radius: 6px;
        cursor: pointer;
        width: 100%;
        border: 2px solid #b0bec5;
        text-align: center;
        transition: all 0.3s ease;
    }

    .custom-file-upload:hover {
        background: #d6e4ff;
        border-color: #007bff;
    }

    .file-name {
        margin-top: 8px;
        font-size: 14px;
        color: #555;
        text-align: center;
    }

    .char-count {
        text-align: right;
        color: #6c757d;
        font-size: 12px;
        margin-top: 5px;
    }

    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
    }
    
</style>

    
    <%
    model.Student student = (model.Student) session.getAttribute("student");
	%>
    <div class="header">
        <h2>Student Dashboard</h2>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>	
<div class="container">
    <%@ include file="../partials/sideBar.jsp" %>

    <div class="main-content">
	<section class="ticket-form">
	    <h2 class="topic1">Submit a Support Ticket</h2>

	    <form id="ticketForm"
	          action="${pageContext.request.contextPath}/student/ticket?action=create"
	          method="post"
	          enctype="multipart/form-data">
	
	        <div class="form-grid">
	            <div>
				    <label for="name">Your Name:</label>
				    <input
				        type="text"
				        id="name"
				        name="name"
				        value="<%= student.getFullname() %>"
				        placeholder="e.g. John Doe" 
				        readonly>
				</div>
	
	            <div>
				    <label for="studentId">Student ID Number:</label>
				    <input
				        type="text"
				        id="studentId"
				        name="studentId"
				        placeholder="e.g. IT2312345"
				        minlength="10"
				        maxlength="10"
				        value="<%= student.getStdid() %>" 
				        readonly>
				</div>
	
	            <div>
	                <label for="faculty">Faculty:</label>
	                <select id="faculty" name="faculty" required>
	                    <option value="Computing">Computing</option>
	                    <option value="Business">Business</option>
	                    <option value="Engineering">Engineering</option>
	                    <option value="Architecture">Architecture</option>
	                </select>
	            </div>
	
	            <div>
	                <label for="subject">Subject:</label>
	                <input
	                    type="text"
	                    id="subject"
	                    name="subject"
	                    required
	                    placeholder="e.g. Request a PDF"
	                    maxlength="100"
	                    minlength="4">
	            </div>
	
	            <div>
	                <label for="email">Your Email:</label>
	                <input
	                    type="email"
	                    id="email"
	                    name="email"
	                    required
	                    placeholder="e.g. name@example.com"
	                    maxlength="100"
	                    minlength="6">
	            </div>
	
	            <div>
	                <label for="phone">Phone Number:</label>
	                <input
	                    type="text"
	                    id="phone"
	                    name="phone"
	                    required
	                    pattern="\d{10}"
	                    title="Enter a 10-digit phone number"
	                    placeholder="e.g. 0712345678"
	                    minlength="10">
	            </div>
	
	            <div class="full-width">
	                <label for="issue">Issue Type:</label>
	                <select id="issue" name="issueType">
	                    <option value="Technical Issue">Technical Issue</option>
	                    <option value="Account Problem">Account Problem</option>
	                    <option value="Study Material Request">Study Material Request</option>
	                    <option value="Other">Other</option>
	                </select>
	            </div>
	
	            <div class="full-width">
	                <label for="description">Description:</label>
	                <textarea
	                    id="description"
	                    name="description"
	                    rows="4"
	                    maxlength="500"
	                    required
	                    placeholder="Please describe the issue clearly (max 500 characters)"
	                    minlength="4"></textarea>
	            </div>
	
	            <div class="full-width">
	                <div class="file-upload-wrapper">
	                    <label class="custom-file-upload">
	                        Attach File
	                        <input
	                            type="file"
	                            id="attachment"
	                            name="attachment"
	                            accept=".jpg, .png, .pdf, .docx"
	                            onchange="showFileName()">
	                    </label>
	                </div>
	                <div class="file-name" id="file-name">No file selected</div>
	            </div>
	
	            <div class="full-width">
	                <button class="tBtn" type="submit">Submit Ticket</button>
	            </div>
	        </div>
	    </form>
	</section>
</div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('ticketForm');
        const description = document.getElementById('description');
        const attachment = document.getElementById('attachment');
        const fileName = document.getElementById('file-name');

        // File upload preview
        attachment.addEventListener('change', function() {
            const file = this.files[0];
            fileName.textContent = file ? file.name : 'No file selected';
            fileName.style.color = file ? '#007bff' : '#6c757d';
        });

        // Form validation
        form.addEventListener('submit', function(e) {
            let isValid = true;
            const requiredFields = form.querySelectorAll('[required]');
            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    field.style.borderColor = 'red';
                    isValid = false;
                } else {
                    field.style.borderColor = '#ccc';
                }
            });
            if (description.value.length > 500) {
                description.style.borderColor = 'red';
                isValid = false;
            }
            if (!isValid) {
                e.preventDefault();
                alert('Please fill out all required fields correctly.');
            }
        });
    });
</script>
