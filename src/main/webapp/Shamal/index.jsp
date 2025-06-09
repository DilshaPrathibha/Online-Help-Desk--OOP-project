<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Help Desk - Home</title>
    <style>
        /* Global Styles */
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --text-color: #333;
            --text-light: #7f8c8d;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        /* Header Styles */
        header {
            background: var(--secondary-color);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 1.5rem;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            padding: 0.5rem 0;
            position: relative;
        }
        
        nav ul li a:hover {
            color: var(--primary-color);
        }
        
        nav ul li a.active {
            color: var(--primary-color);
        }
        
        nav ul li a.active:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: var(--primary-color);
        }
        
        /* Hero Section */
        .hero {
            text-align: center;
            padding: 4rem 0;
        }
        
        .hero h2 {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }
        
        .hero p {
            font-size: 1.2rem;
            color: var(--text-light);
            max-width: 700px;
            margin: 0 auto 2rem;
        }
        
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            margin: 0 0.5rem;
        }
        
        .btn-primary {
            background: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .btn-secondary {
            background: white;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }
        
        .btn-secondary:hover {
            background: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* Features Section */
        .features {
            padding: 3rem 0;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: transform 0.3s;
        }
        
        .feature-card:hover {
            transform: translateY(-5px);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .feature-card h3 {
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }
        
        /* Announcements Section */
        .announcements {
            padding: 3rem 0;
            background: var(--light-color);
        }
        
        .announcements h2 {
            text-align: center;
            color: var(--secondary-color);
            margin-bottom: 2rem;
        }
        
        .announcement-card {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 1.5rem;
        }
        
        .announcement-card h3 {
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
        }
        
        .announcement-date {
            color: var(--text-light);
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        /* Footer Styles */
        footer {
            background: var(--secondary-color);
            color: white;
            padding: 2rem 0;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .footer-links ul {
            display: flex;
            list-style: none;
        }
        
        .footer-links li {
            margin-left: 1.5rem;
        }
        
        .footer-links a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: var(--primary-color);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content, .footer-content {
                flex-direction: column;
                text-align: center;
            }
            
            nav ul, .footer-links ul {
                margin-top: 1rem;
            }
            
            nav ul li, .footer-links li {
                margin: 0 0.75rem;
            }
            
            .hero h2 {
                font-size: 2rem;
            }
            
            .btn {
                display: block;
                margin: 0.5rem auto;
                max-width: 200px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <a href="index.jsp" class="logo">Student Help Desk</a>
                <nav>
                    <ul>
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="container">
                <h2>Welcome to Student Help Desk</h2>
                <p>Your one-stop solution for all academic and technical support needs.</p>
                <div class="hero-buttons">
                    <a href="login.jsp" class="btn btn-primary">Login to Your Account</a>
                    <a href="register.jsp" class="btn btn-secondary">Register as New Student</a>
                </div>
            </div>
        </section>

        <section class="features">
            <div class="container">
                <h2>Our Services</h2>
                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon">⚡</div>
                        <h3>Quick Support</h3>
                        <p>Get fast responses to your queries from our dedicated support team.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">📚</div>
                        <h3>Knowledge Base</h3>
                        <p>Access our comprehensive FAQ section for instant solutions.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">👥</div>
                        <h3>Student Community</h3>
                        <p>Connect with fellow students in our discussion forums.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="announcements">
            <div class="container">
                <h2>Latest Announcements</h2>
                <div class="announcement-card">
                    <h3>System Maintenance</h3>
                    <p class="announcement-date">Posted: May 1, 2023</p>
                    <p>There will be scheduled maintenance on Saturday from 2 AM to 4 AM.</p>
                </div>
                <div class="announcement-card">
                    <h3>New Features Added</h3>
                    <p class="announcement-date">Posted: April 25, 2023</p>
                    <p>We've added a new ticket tracking system to better serve your needs.</p>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <div class="footer-content">
                <p>&copy; 2025 Student Help Desk. All rights reserved.</p>
                <div class="footer-links">
                    <ul>
                        <li><a href="privacy.jsp">Privacy Policy</a></li>
                        <li><a href="terms.jsp">Terms and Conditions</a></li>
                        <li><a href="feedback.jsp">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>