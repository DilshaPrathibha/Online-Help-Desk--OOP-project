<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Student Help Desk</title>
    <style>
        /* Base Styles */
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #f5f5f5;
            --dark-color: #333;
            --text-color: #555;
            --white: #fff;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            background-color: var(--light-color);
            color: var(--dark-color);
            line-height: 1.6;
        }
        
        .container {
            width: 85%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        /* Header Styles */
        header {
            background: var(--primary-color);
            color: var(--white);
            padding: 1rem 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        header h1 {
            font-size: 1.8rem;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 1.5rem;
        }
        
        nav ul li a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        nav ul li a:hover, 
        nav ul li a.active {
            color: var(--secondary-color);
        }
        
        /* Content Styles */
        .content-section {
            background: var(--white);
            padding: 2rem;
            margin: 2rem 0;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        h1, h2, h3 {
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        h1 { font-size: 2.2rem; }
        h2 { font-size: 1.8rem; }
        h3 { font-size: 1.4rem; }
        
        p {
            color: var(--text-color);
            margin-bottom: 1rem;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        
        /* Team Section */
        .team {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin: 2rem 0;
        }
        
        .team-member {
            background: var(--light-color);
            padding: 1.5rem;
            border-radius: 8px;
            text-align: center;
            transition: transform 0.3s;
        }
        
        .team-member:hover {
            transform: translateY(-5px);
        }
        
        /* Lists */
        .feature-list {
            list-style: none;
        }
        
        .feature-list li {
            background: var(--light-color);
            padding: 0.8rem 1rem;
            margin: 0.5rem 0;
            border-radius: 5px;
            border-left: 4px solid var(--secondary-color);
        }
        
        /* Testimonials */
        .testimonial {
            font-style: italic;
            background: var(--light-color);
            padding: 1.5rem;
            border-left: 5px solid var(--secondary-color);
            margin: 1rem 0;
        }
        
        /* Footer */
        footer {
            background: var(--primary-color);
            color: var(--white);
            padding: 2rem 0;
            margin-top: 3rem;
        }
        
        footer .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        
        footer nav ul {
            margin-top: 1rem;
        }
        
        footer nav ul li {
            margin: 0 0.8rem;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            header .container {
                flex-direction: column;
                text-align: center;
            }
            
            nav ul {
                margin-top: 1rem;
            }
            
            nav ul li {
                margin: 0 0.5rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>Student Help Desk</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="about.jsp" class="active">About Us</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="container">
        <section class="content-section">
            <h1>About Us</h1>
            <p>Welcome to the Student Help Desk, your trusted solution for academic support and guidance. Our mission is to provide seamless assistance to students throughout their educational journey.</p>
            <p>We are dedicated to offering top-notch support through a user-friendly platform, ensuring smooth communication between students and our expert team.</p>
        </section>

        <section class="content-section">
            <h2>Our Mission</h2>
            <p>Our mission is to provide fast, reliable, and efficient support solutions to ensure student success. We strive to enhance the academic experience through innovative solutions and professional assistance.</p>
        </section>

        <section class="content-section">
            <h2>Our Core Values</h2>
            <ul class="feature-list">
                <li>Student Success First</li>
                <li>Innovation and Efficiency</li>
                <li>Integrity and Transparency</li>
                <li>24/7 Support Availability</li>
                <li>Continuous Improvement</li>
            </ul>
        </section>

        <section class="content-section">
            <h2>Our Team</h2>
            <div class="team">
                <div class="team-member">
                    <h3>John Doe</h3>
                    <p>Founder and CEO</p>
                </div>
                <div class="team-member">
                    <h3>Jane Smith</h3>
                    <p>Support Manager</p>
                </div>
                <div class="team-member">
                    <h3>Michael Lee</h3>
                    <p>Academic Lead</p>
                </div>
                <div class="team-member">
                    <h3>Emily Davis</h3>
                    <p>Student Relations</p>
                </div>
            </div>
        </section>

        <section class="content-section">
            <h2>Our Services</h2>
            <ul class="feature-list">
                <li>24/7 Academic Support</li>
                <li>Live Chat Assistance</li>
                <li>Email Support System</li>
                <li>Technical Troubleshooting</li>
                <li>Resource Library and FAQs</li>
            </ul>
        </section>

        <section class="content-section">
            <h2>Student Testimonials</h2>
            <blockquote class="testimonial">
                "The Student Help Desk has transformed my academic experience. Quick and reliable support whenever I need it!" - Sarah L.
            </blockquote>
            <blockquote class="testimonial">
                "The support team is incredibly responsive and knowledgeable. They've helped me through many tough assignments!" - David R.
            </blockquote>
        </section>

        <section class="content-section">
            <h2>Contact Us</h2>
            <p>Email: support@studenthelpdesk.edu</p>
            <p>Phone: +123 456 7890</p>
            <p>Address: 123 Campus Drive, University City, UC 45678</p>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Student Help Desk. All rights reserved.</p>
            <nav>
                <ul>
                    <li><a href="privacy.jsp">Privacy Policy</a></li>
                    <li><a href="terms.jsp">Terms</a></li>
                    <li><a href="feedback.jsp">Feedback</a></li>
                </ul>
            </nav>
        </div>
    </footer>
</body>
</html>