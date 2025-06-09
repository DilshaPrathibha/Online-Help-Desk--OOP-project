<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HelpAura</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/partials/media/logo.png">
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
            color: white;
            position: sticky; 
            top: 0; 
            z-index: 1000;
        }

        .header-title {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 10px;
            margin-bottom: 10px;
            padding-left: 150px; 
        }

        .header-title img {
            height: 36px;
        }

        .header-title h1 {
            font-size: 1.8rem;
            font-weight: 600;
            margin: 0;
        }

        nav {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .menu-toggle {
            display: none;
            font-size: 28px;
            cursor: pointer;
            color: white;
            padding: 8px;
            text-align: right;
            width: 95%;
        }

        .menu-toggle:hover {
            opacity: 0.8;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            padding: 0;
            align-items: center;
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
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        nav ul li a:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }
        nav ul li a.back-btn:hover{
			background: #d5d147;
		}
		nav ul li a.logoutB:hover{
			background: #be4141;
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

        .profile-icon {
            font-size: 24px;
            cursor: pointer;
            position: relative;
        }

        .profile-dropdown {
            position: absolute;
            right: 0;
            top: 40px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            display: none;
            min-width: 200px;
            z-index: 1001;
        }

        .profile-dropdown a {
            color: #333 !important;
            display: block;
            padding: 10px 15px;
        }

        .profile-dropdown a:hover {
            background: #f0f0f0;
        }

        .profile-container {
            position: relative;
        }

        .profile-container:hover .profile-dropdown {
            display: block;
        }

        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }

            nav ul {
                flex-direction: column;
                align-items: center;
                display: none;
                width: 100%;
                gap: 10px;
            }

            nav ul.active {
                display: flex;
            }

            nav ul li {
                width: 100%;
                max-width: 280px;
            }

            nav ul li a {
                width: 100%;
                text-align: center;
                padding: 10px 0;
            }

            .profile-dropdown {
                right: 50%;
                transform: translateX(50%);
            }
        }
    </style>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <header>
        <div class="header-title">
            <a href="${pageContext.request.contextPath}/Bupathi/index.jsp" style="text-decoration: none; color: white; display: flex; align-items: center; gap: 10px;">
                <img src="${pageContext.request.contextPath}/partials/media/logo.png" alt="Logo">
                <h1>HelpAura</h1>
            </a>
        </div>
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
        <nav>
            <ul id="nav-menu">
                <li><a href="${pageContext.request.contextPath}/Bupathi/index.jsp"><span class="material-icons">home</span>Home</a></li>
               <li><a href="${pageContext.request.contextPath}/ForumReadServlet"><span class="material-icons">forum</span>Forum</a></li>

                <li><a href="${pageContext.request.contextPath}/Bupathi/studymaterials.jsp"><span class="material-icons">menu_book</span>Study Materials</a></li>
                <li><a href="${pageContext.request.contextPath}/Bupathi/Videos.jsp"><span class="material-icons">smart_display</span>Videos</a></li>
                <li><a href="${pageContext.request.contextPath}/Dinali/contact.jsp"><span class="material-icons">contact_mail</span>Contact us</a></li>
                <li><a href="${pageContext.request.contextPath}/Shamal/faq.jsp"><span class="material-icons">help</span>FAQ</a></li>
                <li><a href="${pageContext.request.contextPath}/Dinali/counseling.jsp"><span class="material-icons">psychology</span>Counseling Services</a></li>

                <c:choose>
                    <c:when test="${not empty sessionScope.student}">
                        <li class="profile-container">
                            <a class="profile-icon"><span class="material-icons">account_circle</span></a>
                            <div class="profile-dropdown">
                                <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn"><span class="material-icons">dashboard</span>Back to Dashboard</a>
                                <a href="${pageContext.request.contextPath}/logout" class="logoutB"><span class="material-icons">logout</span> Logout</a>
                            </div>
                        </li>
                    </c:when>
                    <c:when test="${not empty sessionScope.admin}">
                        <li class="profile-container">
                            <a class="profile-icon"><span class="material-icons">account_circle</span></a>
                            <div class="profile-dropdown">
                                <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-btn"><span class="material-icons">dashboard</span>Back to Dashboard</a>
                                <a href="${pageContext.request.contextPath}/logout"  class="logoutB"><span class="material-icons">logout</span> Logout</a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/Bupathi/login.jsp" class="btn"><span class="material-icons">login</span>Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/Bupathi/register.jsp" class="btn"><span class="material-icons">person_add</span>Register</a></li>
                    </c:otherwise>
                </c:choose>
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
