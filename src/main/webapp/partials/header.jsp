<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Help Desk</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background: #f5f5f5;
            color: #333;
        }
        
        header {
            background: #0077cc;
            padding: 15px 0;
            text-align: center;
            color: white;
        }
        
        nav {
            display: flex;
            justify-content: center;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            padding: 0;
        }
        
        nav ul li {
            display: inline-block;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 10px 15px;
            transition: background 0.3s ease-in-out, color 0.3s ease-in-out;
            border-radius: 5px;
        }

        nav ul li a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .btn {
            background: #005fa3;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: 600;
        }

        .btn:hover {
            background: #004a82;
        }
        
    </style>
</head>
<body>
    <header>
        <h1>Online Help Desk</h1>
        <br>
        <nav>
            <ul>
                <li><a href="../Bupathi/index.jsp">Home</a></li>
                <li><a href="../Shamal/forum.jsp">Forum</a></li>
                <li><a href="../Dinali/materials.jsp">Study Materials</a></li>
                <li><a href="videos.html">Videos</a></li>
                <li><a href="../Dilsha/tickets.jsp">Support Tickets</a></li>
                <li><a href="announcements.jsp">Live Announcements</a></li>
                <li><a href="../Dinali/contact.jsp">Contact us</a></li>
                <li><a href="../Shamal/faq.html">FAQ</a></li>
                <li><a href="../Dinali/counseling.jsp">Counseling Services</a></li>
                <li><a href="../Shamal/login.jsp" class="btn">Login</a></li>
                <li><a href="../Bupathi/register.jsp" class="btn">Register</a></li>

            </ul>
        </nav>
    </header>