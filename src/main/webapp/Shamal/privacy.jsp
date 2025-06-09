<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Privacy Policy - Student Help Desk</title>
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
        
        /* Main Content */
        .privacy-content {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            margin: 2rem 0;
        }
        
        .privacy-content h1 {
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .privacy-content h2 {
            color: var(--secondary-color);
            margin: 2rem 0 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--light-color);
        }
        
        .privacy-content p {
            margin-bottom: 1rem;
        }
        
        .privacy-content ul {
            margin-bottom: 1.5rem;
            padding-left: 1.5rem;
        }
        
        .privacy-content li {
            margin-bottom: 0.5rem;
        }
        
        address {
            font-style: normal;
            margin: 1.5rem 0;
        }
        
        address a {
            color: var(--primary-color);
            text-decoration: none;
        }
        
        address a:hover {
            text-decoration: underline;
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
                        <li><a href="privacy.jsp" class="active">Privacy Policy</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="privacy-content">
                <h1>Privacy Policy</h1>
                
                <h2>1. Information We Collect</h2>
                <p>We may collect the following types of information:</p>
                <ul>
                    <li>Personal Information: Name, email address, student ID, department, and contact details.</li>
                    <li>Academic Information: Course enrollment and other academic records relevant to support requests.</li>
                    <li>Technical Information: IP address, browser type, device information, and usage data.</li>
                    <li>Support Tickets: Information you provide when submitting support requests.</li>
                </ul>
                
                <h2>2. How We Use Your Information</h2>
                <p>We use the information we collect for the following purposes:</p>
                <ul>
                    <li>To provide, operate, and maintain our services</li>
                    <li>To improve, personalize, and expand our services</li>
                    <li>To respond to your inquiries and support requests</li>
                    <li>To communicate important updates and announcements</li>
                </ul>
                
                <h2>3. Data Security</h2>
                <p>We implement appropriate security measures to protect your personal information:</p>
                <ul>
                    <li>Encryption of sensitive data in transit and at rest</li>
                    <li>Regular security audits and vulnerability assessments</li>
                    <li>Strict access controls and authentication protocols</li>
                </ul>
                
                <h2>4. Contact Us</h2>
                <p>If you have questions about this Privacy Policy:</p>
                <address>
                    Data Protection Officer<br>
                    Student Help Desk<br>
                    Email: <a href="mailto:dpo@studenthelpdesk.edu">dpo@studenthelpdesk.edu</a>
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