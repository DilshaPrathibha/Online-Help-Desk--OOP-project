<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Terms and Conditions - Student Help Desk</title>
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
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem 0;
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
        
        /* Content Styles */
        .terms-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .terms-header h1 {
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }
        
        .terms-header p {
            color: var(--text-light);
        }
        
        .terms-content {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        }
        
        .terms-section {
            margin-bottom: 2.5rem;
        }
        
        .terms-section h2 {
            color: var(--secondary-color);
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--light-color);
        }
        
        .terms-section h3 {
            color: var(--secondary-color);
            margin: 1.5rem 0 0.75rem;
        }
        
        .terms-section p,
        .terms-section ul {
            margin-bottom: 1rem;
        }
        
        .terms-section ul {
            padding-left: 1.5rem;
        }
        
        .terms-section li {
            margin-bottom: 0.5rem;
        }
        
        /* Table of Contents */
        .toc {
            background: var(--light-color);
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
        }
        
        .toc h2 {
            color: var(--secondary-color);
            margin-top: 0;
            margin-bottom: 1rem;
        }
        
        .toc ul {
            list-style: none;
            padding: 0;
            columns: 2;
        }
        
        .toc li {
            margin-bottom: 0.75rem;
        }
        
        .toc a {
            color: var(--primary-color);
            text-decoration: none;
        }
        
        .toc a:hover {
            text-decoration: underline;
        }
        
        /* Footer Styles */
        footer {
            background: var(--secondary-color);
            color: white;
            padding: 2rem 0;
            margin-top: 3rem;
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
            
            .toc ul {
                columns: 1;
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
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                        <li><a href="terms.jsp" class="active">Terms</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="terms-header">
            <h1>Terms and Conditions</h1>
            <p>Last updated: May 5, 2025</p>
        </div>
        
        <div class="toc">
            <h2>Table of Contents</h2>
            <ul>
                <li><a href="#acceptance">1. Acceptance of Terms</a></li>
                <li><a href="#service">2. Service Description</a></li>
                <li><a href="#accounts">3. User Accounts</a></li>
                <li><a href="#conduct">4. User Conduct</a></li>
                <li><a href="#privacy">5. Privacy Policy</a></li>
                <li><a href="#modifications">6. Modifications</a></li>
                <li><a href="#termination">7. Termination</a></li>
                <li><a href="#contact">8. Contact Us</a></li>
            </ul>
        </div>
        
        <div class="terms-content">
            <div class="terms-section" id="acceptance">
                <h2>1. Acceptance of Terms</h2>
                <p>By accessing or using the Student Help Desk system ("Service"), you agree to be bound by these Terms and Conditions ("Terms"). If you do not agree to all of these Terms, do not use this Service.</p>
            </div>
            
            <div class="terms-section" id="service">
                <h2>2. Service Description</h2>
                <p>The Student Help Desk provides academic and technical support services to registered students of the university. Services include but are not limited to:</p>
                <ul>
                    <li>Technical support for university systems</li>
                    <li>Academic support and guidance</li>
                    <li>Online discussion forums</li>
                    <li>Ticket-based support system</li>
                </ul>
            </div>
            
            <div class="terms-section" id="accounts">
                <h2>3. User Accounts</h2>
                <p>To access certain features of the Service, you must register for an account using your university credentials or other approved methods. You agree to:</p>
                <ul>
                    <li>Provide accurate, current, and complete information during registration</li>
                    <li>Maintain and promptly update your account information</li>
                    <li>Maintain the security of your account credentials</li>
                    <li>Be responsible for all activities that occur under your account</li>
                </ul>
            </div>
            
            <div class="terms-section" id="conduct">
                <h2>4. User Conduct</h2>
                <p>You agree not to use the Service to:</p>
                <ul>
                    <li>Upload or transmit any content that is unlawful, harmful, or offensive</li>
                    <li>Impersonate any person or entity</li>
                    <li>Interfere with or disrupt the Service or servers</li>
                    <li>Attempt to gain unauthorized access to any accounts or systems</li>
                </ul>
            </div>
            
            <div class="terms-section" id="privacy">
                <h2>5. Privacy Policy</h2>
                <p>Your use of the Service is also governed by our Privacy Policy, which explains how we collect, use, and protect your personal information. Please review our <a href="privacy.jsp">Privacy Policy</a>.</p>
            </div>
            
            <div class="terms-section" id="modifications">
                <h2>6. Modifications</h2>
                <p>We reserve the right to modify these Terms at any time. We will provide notice of significant changes through the Service or by email. Your continued use of the Service after such modifications constitutes your acceptance of the new Terms.</p>
            </div>
            
            <div class="terms-section" id="termination">
                <h2>7. Termination</h2>
                <p>We may terminate or suspend your access to the Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach these Terms.</p>
            </div>
            
            <div class="terms-section" id="contact">
                <h2>8. Contact Us</h2>
                <p>If you have any questions about these Terms, please contact us:</p>
                <address>
                    Student Help Desk Administrator<br>
                    Email: <a href="mailto:helpdesk@university.edu">helpdesk@university.edu</a><br>
                    Phone: (123) 456-7890
                </address>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <div class="footer-content">
                <p>&copy; 2025 Student Help Desk. All rights reserved.</p>
                <div class="footer-links">
                    <ul>
                        <li><a href="privacy.jsp">Privacy Policy</a></li>
                        <li><a href="terms.jsp">Terms and Conditions</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>