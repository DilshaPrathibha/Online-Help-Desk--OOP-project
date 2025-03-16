<%@ include file="../partials/header.jsp" %>

<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<style>
.chat-container {
    width: 50%;
    height: 60vh;
    padding: 20px;
    display: flex;
    flex-direction: column;
    gap: 15px;
    font-size: 18px;
    overflow: auto;
    margin: 30px auto;
    background: #ffffff;
    border-radius: 15px;
    border: 2px solid #0077cc;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.user-chat-box, .ai-chat-box {
    width: fit-content;
    max-width: 70%;
    padding: 15px;
    border-radius: 15px;
    margin-bottom: 10px;
    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
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
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    background: white;
    padding: 10px;
    margin: 0 auto;
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
    transition: all 0.3s ease-in-out;
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

<div class="chat-container" id="chatContainer">
  <div class="ai-chat-box">Hello! How can I help you today?</div>
</div>

<div class="prompt-area">
  <input type="text" id="prompt" placeholder="Type a message...">
  <button id="submit">
    <i class="fa-solid fa-arrow-right"></i> <!-- fontawesome icon -->
  </button>
</div>

<script>
  function sendMessage() {
    let userMessage = document.querySelector("#prompt").value;
    if (!userMessage.trim()) return;
    let chatContainer = document.querySelector("#chatContainer");
    let userChat = document.createElement("div");
    userChat.className = "user-chat-box";
    userChat.textContent = userMessage;
    chatContainer.appendChild(userChat);
    document.querySelector("#prompt").value = "";
    setTimeout(() => {
      let aiChat = document.createElement("div");
      aiChat.className = "ai-chat-box";
      aiChat.textContent = "Thanks for contacting us! Our agent may reply soon.";
      chatContainer.appendChild(aiChat);
      chatContainer.scrollTo({ top: chatContainer.scrollHeight, behavior: "smooth" });
    }, 1000); // 1000 for 1 sec delay
  }
  document.querySelector("#submit").addEventListener("click", sendMessage);
  document.querySelector("#prompt").addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
      event.preventDefault();
      sendMessage();
    }
  });
</script>

<%@ include file="../partials/footer.jsp" %>
