<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../partials/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Live Chat | Student Help Desk</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        .topic1 {
        	color: #01274e;
	        text-align: center;
	        font-size: 2rem;
	        font-weight: 700;
	        letter-spacing: 1px;
	        margin-bottom: 25px;
        }

        .chat-container {
            width: 60%;
            height: 60vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            font-size: 18px;
            overflow-y: auto;
            margin: 30px auto;
            background: #ffffff;
            border-radius: 15px;
            border: 2px solid #0077cc;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .user-chat-box, .ai-chat-box {
            max-width: 70%;
            padding: 15px;
            border-radius: 15px;
            font-size: 16px;
            line-height: 1.5;
        }

        .user-chat-box {
            align-self: flex-end;
            background: #0077cc;
            color: white;
            border-radius: 15px 15px 0px 15px;
        }

        .ai-chat-box {
            align-self: flex-start;
            background: #f1f1f1;
            color: #333;
            border-radius: 15px 15px 15px 0px;
            border: 1px solid #ddd;
        }

        .prompt-area {
            width: 60%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: white;
            padding: 10px;
            margin: 0 auto 30px;
            border-radius: 10px;
            box-shadow: 0px -2px 8px rgba(0, 0, 0, 0.1);
        }

        .prompt-area input {
            width: 80%;
            height: 50px;
            padding: 15px;
            font-size: 16px;
            border: 2px solid #0077cc;
            outline: none;
            border-radius: 25px;
            background-color: white;
            color: #333;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
        }

        .prompt-area input:focus {
            border-color: #005fa3;
            box-shadow: 0 0 8px rgba(0, 119, 204, 0.3);
        }

        .prompt-area button {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            background-color: #0077cc;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.3s;
        }

        .prompt-area button i {
            font-size: 22px;
            color: white;
        }

        .prompt-area button:hover {
            background-color: #005fa3;
            transform: scale(1.1);
        }

    </style>
</head>
<body>

<div class="header">
     <h2>Student Dashboard</h2>
     <form action="${pageContext.request.contextPath}/logout" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

<div class="container">
    <%@ include file="../partials/sideBar.jsp" %>

    <div class="main-content">
        <h2 class="topic1">Chat Bot</h2>

        <div class="chat-container" id="chatContainer">
            <div class="ai-chat-box">Hello! How can I help you today?</div>
        </div>

        <div class="prompt-area">
            <input type="text" id="prompt" placeholder="Type a message...">
            <button id="submit">
                <i class="fa-solid fa-arrow-right"></i>
            </button>
        </div>
    </div>
</div>
<script>
    function getAutoReply(message) {
        const lowerMessage = message.toLowerCase();

        if (lowerMessage.includes("contact")) {
            return "You can contact us at:<br>📞 Phone: 012-345-6789<br>📧 Email: helpdesk@university.edu";
        } else if (lowerMessage.includes("info")) {
            return "Visit our website for more info: 🌐 <a href='https://studenthelp.university.edu' target='_blank'>https://studenthelp.university.edu</a>";
        } else if (lowerMessage.includes("hours") || lowerMessage.includes("timing")) {
            return "Our support hours are: 🕒 Mon–Fri, 9 AM – 5 PM";
        } else if (lowerMessage.includes("location")) {
            return "We are located at 📍 2nd Floor, IT Building, Main Campus.";
        } else {
            return "<small>💡 Tip: Try using keywords like <strong>contact</strong>, <strong>info</strong>, <strong>timing</strong>, or <strong>location</strong>.</small>";
        }
    }

    function sendMessage() {
        const userMessage = document.querySelector("#prompt").value.trim();
        if (!userMessage) return;

        const chatContainer = document.querySelector("#chatContainer");

        const userChat = document.createElement("div");
        userChat.className = "user-chat-box";
        userChat.textContent = userMessage;
        chatContainer.appendChild(userChat);

        document.querySelector("#prompt").value = "";

        setTimeout(() => {
            const aiChat = document.createElement("div");
            aiChat.className = "ai-chat-box";
            aiChat.innerHTML = getAutoReply(userMessage); 
            chatContainer.appendChild(aiChat);
            chatContainer.scrollTo({ top: chatContainer.scrollHeight, behavior: "smooth" });
        }, 1000);
    }

    document.querySelector("#submit").addEventListener("click", sendMessage);
    document.querySelector("#prompt").addEventListener("keydown", (event) => {
        if (event.key === "Enter") {
            event.preventDefault();
            sendMessage();
        }
    });
</script>


</body>

</html>
