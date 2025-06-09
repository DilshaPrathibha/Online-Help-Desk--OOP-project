<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback - Student Help Desk</title>
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
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 4rem 2rem;
            text-align: center;
            border-radius: 8px;
            margin: 2rem 0;
        }
        
        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        
        .hero p {
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto 2rem;
        }
        
        .btn {
            display: inline-block;
            background: white;
            color: var(--primary-color);
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* Feedback Form */
        .feedback-form {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 3rem;
        }
        
        .feedback-form h2 {
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--light-color);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        
        .form-group textarea {
            min-height: 150px;
            resize: vertical;
        }
        
        .submit-btn {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .submit-btn:hover {
            background: #2980b9;
        }
        
        /* Testimonials */
        .testimonials {
            margin-bottom: 3rem;
        }
        
        .testimonials h2 {
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        
        .testimonial-card {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        }
        
        .testimonial-text {
            font-style: italic;
            margin-bottom: 1rem;
            position: relative;
            padding-left: 1.5rem;
        }
        
        .testimonial-text:before {
            content: '"';
            font-size: 3rem;
            color: var(--primary-color);
            opacity: 0.2;
            position: absolute;
            left: -0.5rem;
            top: -1rem;
        }
        
        .testimonial-author {
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .testimonial-role {
            color: var(--text-light);
            font-size: 0.9rem;
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
            
            .hero h1 {
                font-size: 2rem;
            }
        }
        
        /* Feedback Features Grid */
        .feedback-features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin: 50px 0;
        }

        .feature-card {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: #3498db;
            margin-bottom: 20px;
        }

        .feature-card h3 {
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 15px;
        }

        /* Testimonials Carousel */
        .testimonials-section {
            margin: 60px 0;
        }

        .testimonials-container {
            display: flex;
            overflow-x: auto;
            gap: 30px;
            padding: 20px 0;
            scroll-snap-type: x mandatory;
        }

        .testimonial-card {
            min-width: 300px;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            scroll-snap-align: start;
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
            position: relative;
        }

        .testimonial-text:before {
            content: '"';
            font-size: 3rem;
            color: #3498db;
            opacity: 0.2;
            position: absolute;
            top: -15px;
            left: -10px;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
        }

        .author-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #3498db;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-weight: bold;
        }

        .author-info h4 {
            margin: 0;
            color: #2c3e50;
        }

        .author-info p {
            margin: 5px 0 0;
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        /* Stats Section */
        .stats-section {
            background: #2c3e50;
            color: white;
            padding: 60px 20px;
            border-radius: 8px;
            margin: 50px 0;
            text-align: center;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            max-width: 900px;
            margin: 0 auto;
        }

        .stat-item {
            padding: 20px;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #3498db;
            margin-bottom: 10px;
        }

        /* FAQ Section */
        .faq-section {
            margin: 60px 0;
        }

        .faq-item {
            background: white;
            margin-bottom: 15px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }

        .faq-question {
            padding: 20px;
            background: #f8f9fa;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .faq-question:after {
            content: '+';
            font-size: 1.5rem;
        }

        .faq-answer {
            padding: 0 20px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .faq-item.active .faq-answer {
            padding: 20px;
            max-height: 500px;
        }

        .faq-item.active .faq-question:after {
            content: '-';
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
                        <li><a href="forum.jsp">Forum</a></li>
                        <li><a href="resources.jsp">Resources</a></li>
                        <li><a href="feedback.jsp" class="active">Feedback</a></li>
                        <li><a href="login.jsp">Login</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <section class="hero">
            <h1>Your Feedback Matters</h1>
            <p>Help us improve the Student Help Desk by sharing your experience. We value every suggestion and use your feedback to enhance our services.</p>
            <a href="#feedback-form" class="btn">Share Your Thoughts</a>
        </section>
		
		  <!-- Features Grid -->
        <section id="feedback-options" class="feedback-features">
            <div class="feature-card">
                <div class="feature-icon">★</div>
                <h3>Quick Rating</h3>
                <p>Rate your experience with our services in just a few clicks. Your satisfaction score helps us measure our performance.</p>
                <a href="rating.html" class="btn">Rate Now</a>
            </div>

            <div class="feature-card">
                <div class="feature-icon">✏️</div>
                <h3>Detailed Feedback</h3>
                <p>Share specific comments about what worked well and what we can improve. Your detailed input is invaluable to us.</p>
                <a href="detailed-feedback.html" class="btn">Provide Feedback</a>
            </div>

            <div class="feature-card">
                <div class="feature-icon">💡</div>
                <h3>Suggestions</h3>
                <p>Have an idea to make our services better? We'd love to hear your suggestions for new features or improvements.</p>
                <a href="suggestions.html" class="btn">Share Ideas</a>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="testimonials-section">
            <h2>What Our Students Say</h2>
            <p>Here's feedback from students who've used our services:</p>
            
            <div class="testimonials-container">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        The Help Desk team resolved my technical issue within minutes of submitting my ticket. Their response was professional and exactly what I needed to get back to my studies.
                    </div>
                    <div class="testimonial-author">
                        <div class="author-avatar">SJ</div>
                        <div class="author-info">
                            <h4>Sarah Johnson</h4>
                            <p>Computer Science, Senior</p>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        I was struggling with my research paper until I found the academic resources section. The curated materials saved me hours of searching and significantly improved my work.
                    </div>
                    <div class="testimonial-author">
                        <div class="author-avatar">MC</div>
                        <div class="author-info">
                            <h4>Michael Chen</h4>
                            <p>Engineering, Junior</p>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        The discussion forum connected me with study partners for my advanced math courses. It's become an essential part of my learning process this semester.
                    </div>
                    <div class="testimonial-author">
                        <div class="author-avatar">DM</div>
                        <div class="author-info">
                            <h4>David Martinez</h4>
                            <p>Business, Sophomore</p>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        I suggested a feature for the resource portal last semester, and I was thrilled to see it implemented this term. It's clear they really listen to student feedback!
                    </div>
                    <div class="testimonial-author">
                        <div class="author-avatar">AK</div>
                        <div class="author-info">
                            <h4>Aisha Khan</h4>
                            <p>Biology, Freshman</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="stats-section">
            <h2>Our Impact By The Numbers</h2>
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number">4.8/5</div>
                    <p>Average Student Rating</p>
                </div>
                <div class="stat-item">
                    <div class="stat-number">98%</div>
                    <p>Issues Resolved</p>
                </div>
                <div class="stat-item">
                    <div class="stat-number">2,450+</div>
                    <p>Feedback Responses</p>
                </div>
                <div class="stat-item">
                    <div class="stat-number">120+</div>
                    <p>Improvements Made</p>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section class="faq-section">
            <h2>Feedback FAQs</h2>
            <div class="faq-item">
                <div class="faq-question">How is my feedback used?</div>
                <div class="faq-answer">
                    <p>We analyze all feedback to identify common issues and opportunities for improvement. Your suggestions directly influence our service roadmap and help prioritize new features.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Can I provide anonymous feedback?</div>
                <div class="faq-answer">
                    <p>Yes, all our feedback options allow you to submit anonymously if you prefer. However, providing your contact information allows us to follow up if we have questions.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">How often should I provide feedback?</div>
                <div class="faq-answer">
                    <p>We welcome feedback anytime you use our services. For regular users, we suggest providing detailed feedback at least once per semester to help us track improvements.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Will I receive a response to my feedback?</div>
                <div class="faq-answer">
                    <p>While we can't respond to every submission, we do review all feedback. If you include contact information and request a response, we'll follow up within 3-5 business days.</p>
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
                        <li><a href="terms.jsp">Terms of Service</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>