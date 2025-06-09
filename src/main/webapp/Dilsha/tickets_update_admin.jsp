<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../partials/header.jsp" %>

<c:if test="${ticket != null}">
    <style>
        body {
            background-color: #f4f7f9;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .update-container {
            max-width: 700px;
            margin: 40px auto;
            background: #ffffff;
            padding: 25px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: #333;
        }
        .update-container h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 14px;
        }
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        .btn {
            padding: 10px 16px;
            border-radius: 5px;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
            border: none;
        }
        .btn-cancel {
            background-color: transparent;
            color: #333;
            border: 1px solid #007bff;
        }
        .btn-cancel:hover {
            background-color: #e9f2ff;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>

    <div class="update-container">
        <h2>Reply Ticket</h2>
        <form action="${pageContext.request.contextPath}/admin/edit-ticket" method="post">
        
            <input type="hidden" name="ticketId" value="${ticket.ticketId}" />

			<label for="subject">Subject</label>
			<input name="subject" type="text" value="${ticket.subject}" readonly/>
			
			<label for="description">Description</label>
			<textarea name="description" id="description" readonly>${ticket.description}</textarea>
						
			<label for="reply">Admin Reply</label>
			<textarea name="reply" id="reply">${ticket.reply}</textarea>
			
            <label for="status">Status</label>
            <select name="status" id="status">
                <option value="Open" ${ticket.status == 'Open' ? 'selected' : ''}>Open</option>
                <option value="In Progress" ${ticket.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                <option value="Resolved" ${ticket.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
            </select>

            <div class="button-group">
                <a href="${pageContext.request.contextPath}/admin/tickets" class="btn btn-cancel">Cancel</a>
                <button type="submit" class="btn btn-submit">Update Ticket</button>
            </div>
        </form>
    </div>
</c:if>

<c:if test="${ticket == null}">
    <p style="color: red; text-align: center;">Ticket not found. Please go back and try again.</p>
</c:if>

<%@ include file="../partials/footer.jsp" %>
