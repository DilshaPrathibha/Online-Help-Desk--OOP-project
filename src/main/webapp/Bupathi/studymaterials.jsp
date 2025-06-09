
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../partials/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Study Materials Hub</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;

            background-color: #f5f5f5;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .header1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
        }
        .section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .section h2 {
            color: #3498db;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
            margin-top: 0;
        }
        .material-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .material-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            background: white;
        }
        .material-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .material-card img {
            width: 100%;
            height: 120px;
            object-fit: contain;
            margin-bottom: 15px;
        }
        .material-card h3 {
            margin: 10px 0;
            color: #2c3e50;
        }
        .material-card p {
            color: #7f8c8d;
            margin: 5px 0;
            font-size: 0.9em;
        }
        .btn {
            display: inline-block;
            padding: 8px 15px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
            font-weight: bold;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #2980b9;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
            font-size: 1.2em;
            margin: 10px 0;
        }
        .free-badge {
            background: #2ecc71;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .category-filter {
            text-align: center;
            margin-bottom: 20px;
        }
        .category-filter button {
            padding: 8px 15px;
            margin: 0 5px;
            background: #ecf0f1;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .category-filter button.active {
            background: #3498db;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="header1">Study Materials Hub</h1>
        
        <!-- Free Materials Section -->
        <div class="section">
            <h2>Free Resources</h2>
            <div class="material-grid">
                <div class="material-card">
                    <img src="https://www.w3schools.com/images/w3schools_logo_436_2.png" alt="W3Schools">
                    <h3>W3Schools</h3>
                    <p>Web development tutorials</p>
                    <span class="free-badge">FREE</span>
                    <a href="https://www.w3schools.com" class="btn">Access</a>
                </div>
                
                <div class="material-card">
                    <img src="https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.png" alt="Stack Overflow">
                    <h3>Stack Overflow</h3>
                    <p>Programming Q&A</p>
                    <span class="free-badge">FREE</span>
                    <a href="https://stackoverflow.com" class="btn">Access</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Khan_Academy_Logo_Old_2017.png/1200px-Khan_Academy_Logo_Old_2017.png" alt="Khan Academy">
                    <h3>Khan Academy</h3>
                    <p>Free online courses</p>
                    <span class="free-badge">FREE</span>
                    <a href="https://www.khanacademy.org" class="btn">Access</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/FreeCodeCamp_logo.png/800px-FreeCodeCamp_logo.png" alt="freeCodeCamp">
                    <h3>freeCodeCamp</h3>
                    <p>Coding tutorials & projects</p>
                    <span class="free-badge">FREE</span>
                    <a href="https://www.freecodecamp.org" class="btn">Access</a>
                </div>
            </div>
        </div>
        
        <!-- Paid Materials Section -->
        <div class="section">
            <h2>Premium Courses</h2>
            <div class="material-grid">
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Java_14_logo.svg/1200px-Java_14_logo.svg.png" alt="Java Course">
                    <h3>Java Masterclass</h3>
                    <p>Complete Java programming from basics to advanced</p>
                    <p class="price">$29.99</p>
                    <a href="payment.jsp?course=Java+Masterclass&price=29.99" class="btn">Enroll Now</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1200px-Postgresql_elephant.svg.png" alt="SQL Course">
                    <h3>SQL Database</h3>
                    <p>Database design with SQL and PostgreSQL</p>
                    <p class="price">$19.99</p>
                    <a href="payment.jsp?course=SQL+Database&price=19.99" class="btn">Enroll Now</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1200px-React-icon.svg.png" alt="React Course">
                    <h3>React Complete Guide</h3>
                    <p>Build modern web apps with React</p>
                    <p class="price">$24.99</p>
                    <a href="payment.jsp?course=React+Complete+Guide&price=24.99" class="btn">Enroll Now</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Laravel.svg/1200px-Laravel.svg.png" alt="Laravel Course">
                    <h3>Laravel Framework</h3>
                    <p>PHP web development with Laravel</p>
                    <p class="price">$22.99</p>
                    <a href="payment.jsp?course=Laravel+Framework&price=22.99" class="btn">Enroll Now</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1200px-Git_icon.svg.png" alt="Git Course">
                    <h3>Git & GitHub Mastery</h3>
                    <p>Version control system complete course</p>
                    <p class="price">$14.99</p>
                    <a href="payment.jsp?course=Git+%26+GitHub+Mastery&price=14.99" class="btn">Enroll Now</a>
                </div>
                
                <div class="material-card">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/1200px-ISO_C%2B%2B_Logo.svg.png" alt="C++ Course">
                    <h3>C++ Programming</h3>
                    <p>Object-oriented programming with C++</p>
                    <p class="price">$27.99</p>
                    <a href="payment.jsp?course=C%2B%2B+Programming&price=27.99" class="btn">Enroll Now</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@ include file="../partials/footer.jsp"%>