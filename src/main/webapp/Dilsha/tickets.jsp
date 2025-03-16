<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp"%>

<style>
    /* General Styles */
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

    /* Ticket Form Section */
    .ticket-form {
        max-width: 500px;
        margin: 20px auto;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .ticket-form label {
        font-weight: bold;
        display: block;
        margin-top: 12px;
        color: #2c3e50;
    }

    .ticket-form input,
    .ticket-form select,
    .ticket-form textarea {
        width: 100%;
        padding: 12px;
        margin-top: 5px;
        border: 2px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        transition: border 0.3s;
    }

    .ticket-form input:focus,
    .ticket-form select:focus,
    .ticket-form textarea:focus {
        border-color: #007bff;
        outline: none;
    }

    .ticket-form button {
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

    .ticket-form button:hover {
        background: #0056b3;
    }

    /* Styled Attach File Button */
    .file-upload-wrapper {
        margin-top: 10px;
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
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
        transition: background 0.3s ease, border 0.3s ease;
        text-align: center;
        width: 100%;
        border: 2px solid #b0bec5;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .custom-file-upload:hover {
        background: #d6e4ff;
        border-color: #007bff;
    }

    /* Display Selected File Name */
    .file-name {
        margin-top: 8px;
        font-size: 14px;
        color: #555;
        text-align: center;
    }

    /* Ticket List Section */
    .ticket-list {
        max-width: 600px;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .ticket-list ul {
        list-style: none;
        padding: 0;
    }

    .ticket-list li {
        background: #f8f9fa;
        padding: 12px;
        border-left: 5px solid #007bff;
        margin: 10px 0;
        border-radius: 5px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 15px;
        transition: transform 0.3s ease, background 0.3s ease;
    }

    .ticket-list li:hover {
        transform: translateX(5px);
        background: #e9ecef;
    }

    .ticket-list li strong {
        color: #2c3e50;
    }

    .ticket-list li span {
        font-size: 14px;
        color: #555;
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .ticket-form, .ticket-list {
            max-width: 90%;
        }
    }
</style>

<section class="ticket-form">
    <h2>Submit a Support Ticket</h2>
    <form id="ticketForm" action="TicketServlet" method="post" enctype="multipart/form-data">
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Your Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="issue">Issue Type:</label>
        <select id="issue" name="issue">
            <option value="Technical Issue">Technical Issue</option>
            <option value="Account Problem">Account Problem</option>
            <option value="Study Material Request">Study Material Request</option>
            <option value="Other">Other</option>
        </select>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <!-- New File Attachment Field -->
        <div class="file-upload-wrapper">
            <label class="custom-file-upload">
                📎 Attach File
                <input type="file" id="attachment" name="attachment" accept=".jpg, .png, .pdf, .docx" onchange="showFileName()">
            </label>
        </div>
        <div class="file-name" id="file-name">No file selected</div>

        <button type="submit">Submit Ticket</button>
    </form>
</section>

<section class="ticket-list">
    <h2>📌 Recent Tickets</h2>
    <ul id="ticketList">
        <li>🔧 <strong>Technical Issue:</strong> "Page not loading" (Open)</li>
        <li>📂 <strong>Study Material Request:</strong> "Need SDLC notes" (Resolved)</li>
    </ul>
</section>

<%@ include file="../partials/footer.jsp"%>

<script>
    function showFileName() {
        const fileInput = document.getElementById('attachment');
        const fileNameDisplay = document.getElementById('file-name');

        if (fileInput.files.length > 0) {
            fileNameDisplay.textContent = fileInput.files[0].name;
        } else {
            fileNameDisplay.textContent = "No file selected";
        }
    }
</script>