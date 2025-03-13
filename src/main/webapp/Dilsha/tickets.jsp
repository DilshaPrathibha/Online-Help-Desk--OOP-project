<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../partials/header.jsp"%>
    
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
