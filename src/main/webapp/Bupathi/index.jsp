<%@ include file="../partials/header.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Online Help Desk</title>
    <link rel="stylesheet" href="styles.css">

    <style>
        .overlay-box {
            background-color: rgba(0, 123, 255, 0.8);
            color: white;
            text-align: center;
            padding: 30px;
            border-radius: 15px;
            max-width: 700px;
            width: 90%;
            margin-top: 100px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .announcement-box {
            background-color: rgba(255, 255, 255, 0.85);
            color: #333;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            margin-top: 30px;
            text-align: center;
            max-width: 500px;
            border-left: 5px solid #007bff;
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }

        .announcement-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }

        .announcement-title {
            color: #007bff;
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .announcement-title:before {
            content: "🔔";
            margin-right: 10px;
            font-size: 1.1rem;
        }

        .announcement-box p {
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .announcement-box a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 20px;
            background-color: rgba(0, 123, 255, 0.1);
            transition: all 0.3s ease;
            display: inline-block;
        }

        .announcement-box a:hover {
            background-color: rgba(0, 123, 255, 0.2);
            text-decoration: none;
            transform: scale(1.05);
        }
    </style>
</head>
<body style="
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
    background: url('media/girlwritting.jpg') no-repeat center center fixed; 
    background-size: cover; 
    display: flex; 
    flex-direction: column; 
    align-items: center; 
    min-height: 100vh;
    margin: 0;
">

	    <!-- Success Message (optional, disappears) on index.jsp -->
    <%
        String success = request.getParameter("success");
        if ("true".equals(success)) {
    %>
        <div id="successMsg" class="success-message">Ticket submitted successfully!</div>
        <script>
            setTimeout(() => {
                const msg = document.getElementById("successMsg");
                if (msg) {
                    msg.style.opacity = "0";
                    setTimeout(() => msg.style.display = "none", 500); // smooth fade out
                }
            }, 1500); // 4 seconds to disappear 
        </script>
    <%
        }
    %>

    <!-- Overlay Welcome Box -->
    <div class="overlay-box">
        <h2>Welcome to Your Semester Help Desk</h2>
        <p>Find study materials, ask questions, and engage in interactive learning.</p>
    </div>

    <!-- Live Announcement Box -->
    <div class="announcement-box">
        <div class="announcement-title"> Live Announcements</div>
        <p>Stay updated with the latest news and important updates from your institution.</p>
        <a href="announcements.jsp">View All Announcements</a>
    </div>

    <%@ include file="../partials/footer.jsp" %>

</body>
</html>