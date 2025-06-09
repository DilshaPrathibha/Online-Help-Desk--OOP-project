<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQs - Student Help Desk</title>
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
        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
                
        /* FAQ Section */
        .faq-container {
            padding: 3rem 0;
        }
        
        .faq-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .faq-header h1 {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }
        
        .faq-header p {
            color: var(--text-light);
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .faq-section {
            margin-bottom: 3rem;
        }
        
        .faq-section h2 {
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--light-color);
        }
        
        .faq-item {
            margin-bottom: 1rem;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            background: white;
        }
        
        .faq-question {
            padding: 1.5rem;
            background: var(--primary-color);
            color: white;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .faq-answer {
            padding: 1.5rem;
            background: white;
            display: block;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .faq-header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

    <main class="faq-container">
        <div class="container">
            <div class="faq-header">
                <h1>Frequently Asked Questions</h1>
                <p>Find answers to common questions about our Student Help Desk services</p>
            </div>
            
            <div class="faq-section">
                <h2>General Questions</h2>
                
                <div class="faq-item">
                    <div class="faq-question">What is an online help desk?</div>
                    <div class="faq-answer">
                        <p>An online help desk is a platform where users can submit inquiries, request assistance, and receive support from customer service representatives in real time or through tickets. Our Student Help Desk is specifically designed to address academic and technical issues faced by students.</p>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">How does the support system work?</div>
                    <div class="faq-answer">
                        <p>Our support system allows you to submit a ticket or chat with a representative. Once your issue is submitted, our team will respond and resolve it in a timely manner. You can track the progress of your ticket through your account dashboard.</p>
                    </div>
                </div>
            </div>
            
            <div class="faq-section">
                <h2>Account and Login</h2>
                
                <div class="faq-item">
                    <div class="faq-question">How do I create an account?</div>
                    <div class="faq-answer">
                        <p>To create an account, click on the "Register" button on the homepage, fill out the necessary details including your student ID, email address, and create a password. After submitting the form, you will receive a confirmation email to activate your account.</p>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">What should I do if I forget my password?</div>
                    <div class="faq-answer">
                        <p>If you forget your password, click the "Forgot Password" link on the login page. Enter your registered email address and follow the instructions sent to your email to reset your password securely.</p>
                    </div>
                </div>
            </div>
            
            <div class="faq-section">
                <h2>Technical Support</h2>
                
                <div class="faq-item">
                    <div class="faq-question">How do I troubleshoot issues with my account?</div>
                    <div class="faq-answer">
                        <p>If you're experiencing issues with your account, try these steps first: 1) Clear your browser cache and cookies, 2) Try logging in from a different browser, 3) Ensure your internet connection is stable. If the problem persists, submit a ticket with detailed information about the issue, and our support team will assist you promptly.</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
<%@ include file="../partials/footer.jsp"%>