<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp"%>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7f9;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h2 {
        color: #2c3e50;
        text-align: center;
        font-weight: 600;
        letter-spacing: 1px;
    }

    .ticket-form {
        max-width: 900px;
        margin: 20px auto;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
        font-weight: bold;
        margin-top: 12px;
        color: #2c3e50;
        display: block;
    }

    input, select, textarea {
        width: 100%;
        padding: 12px;
        margin-top: 5px;
        border: 2px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        transition: border 0.3s;
    }

    input:focus, select:focus, textarea:focus {
        border-color: #007bff;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease;
        font-weight: bold;
    }

    button:hover {
        background: #0056b3;
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

    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<section class="ticket-form">
    <h2>Submit a Support Ticket</h2>
    <form id="ticketForm" action="${pageContext.request.contextPath}/ticket?action=create" method="post" enctype="multipart/form-data">
        <div class="form-grid">
            <div>
                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div>
                <label for="studentId">Student ID Number:</label>
                <input type="text" id="studentId" name="studentId" required>
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
                <input type="text" id="subject" name="subject" required>
            </div>

            <div>
                <label for="email">Your Email:</label>
                <input type="email" id="email" name="email">
            </div>

            <div>
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone">
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
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="full-width">
                <div class="file-upload-wrapper">
                    <label class="custom-file-upload">
                        Attach File
                        <input type="file" id="attachment" name="attachment" accept=".jpg, .png, .pdf, .docx" onchange="showFileName()">
                    </label>
                </div>
                <div class="file-name" id="file-name">No file selected</div>
            </div>

            <div class="full-width">
                <button type="submit">Submit Ticket</button>
            </div>
        </div>
    </form>
</section>

<%@ include file="../partials/footer.jsp"%>

<script>
    function showFileName() {
        const fileInput = document.getElementById('attachment');
        const fileNameDisplay = document.getElementById('file-name');
        fileNameDisplay.textContent = fileInput.files.length > 0 ? fileInput.files[0].name : "No file selected";
    }
</script>
