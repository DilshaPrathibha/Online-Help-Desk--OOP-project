<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Help Desk</title>
    <link rel="icon" type="image/png" href="media/favicon.png">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f5f8fb;
            color: #333;
            line-height: 1.6;
        }

        header {
            background-color: #0077cc;
            padding: 20px 0;
            text-align: center;
            color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        header h1 {
            font-size: 2rem;
            font-weight: 600;
            letter-spacing: 1px;
        }

        nav {
            margin-top: 10px;
        }

        .menu-toggle {
            display: none;
            font-size: 28px;
            cursor: pointer;
            color: white;
            padding: 8px;
            margin-top: 5px;
            text-align: right;
            width: 95%;
        }

        .menu-toggle:hover {
            opacity: 0.8;
        }

        nav ul {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            padding: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 10px 18px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        /* Apply hover text color only to links that are not login or register */
        nav ul li a:not(.btn):hover {
            color: #4CAF50; /* green color */
        }

        .btn {
            background-color: #004f91;
            border: none;
            font-weight: 600;
        }

        .btn:hover {
            background-color: #003f75;
            color: #fff;
        }

        /* Responsive tweak */
        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }

            #nav-menu {
                display: none;
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }

            #nav-menu.active {
                display: flex;
            }

            #nav-menu li {
                width: 100%;
                max-width: 280px;
            }

            #nav-menu li a {
                width: 100%;
                text-align: center;
                display: block;
                padding: 10px 0;
            }
        }
    </style>
</head>
<body>
    <header>
        <a href="../Bupathi/index.jsp" style="text-decoration: none; color: white;">
            <h1>Online Help Desk</h1>
        </a>
        <nav>
            <div class="menu-toggle" onclick="toggleMenu()">☰</div>
            <ul id="nav-menu">
                <li><a href="../Shamal/forum.jsp">Forum</a></li>
                <li><a href="../Dinali/materials.jsp">Study Materials</a></li>
                <li><a href="videos.html">Videos</a></li>
                <li><a href="../Dilsha/tickets.jsp">Support Tickets</a></li>
                <li><a href="announcements.jsp">Live Announcements</a></li>
                <li><a href="../Dinali/contact.jsp">Contact us</a></li>
                <li><a href="../Shamal/faq.html">FAQ</a></li>
                <li><a href="../Dinali/counseling.jsp">Counseling Services</a></li>
                <li><a href="../Bupathi/login.jsp" class="btn">Login</a></li>
                <li><a href="../Bupathi/register.jsp" class="btn">Register</a></li>
            </ul>
        </nav>
    </header>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('nav-menu');
            menu.classList.toggle('active');
        }
    </script>
</body>
</html>
