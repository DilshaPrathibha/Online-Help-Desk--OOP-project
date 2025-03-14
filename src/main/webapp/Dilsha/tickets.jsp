<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		}
		
		.ticket-form {
		    max-width: 500px;
		    margin: 20px auto;
		    background: #ffffff;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		.ticket-form label {
		    font-weight: bold;
		    display: block;
		    margin-top: 10px;
		}
		
		.ticket-form input,
		.ticket-form select,
		.ticket-form textarea {
		    width: 100%;
		    padding: 10px;
		    margin-top: 5px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 14px;
		}
		
		.ticket-form textarea {
		    resize: vertical;
		}
		
		.ticket-form button {
		    width: 100%;
		    padding: 12px;
		    margin-top: 15px;
		    background: #007bff;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    font-size: 16px;
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		.ticket-form button:hover {
		    background: #0056b3;
		}
		
		.ticket-list {
		    max-width: 600px;
		    margin: 30px auto;
		    background: #ffffff;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
		}
		
		.ticket-list li strong {
		    color: #2c3e50;
		}
		
		.ticket-list li span {
		    font-size: 14px;
		    color: #555;
		}
		
		@media (max-width: 600px) {
		    .ticket-form, .ticket-list {
		        max-width: 90%;
		    }
		}
				
    </style>
    <section class="ticket-form">
        <h2>Submit a Support Ticket</h2>
        <form id="ticketForm">
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
