<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile | Student Help Desk</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: auto;
            overflow: hidden;
        }

        header {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: #fff;
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            float: left;
            font-weight: 600;
        }

        nav {
            float: right;
            margin-top: 0.5rem;
        }

        nav ul {
            list-style: none;
        }

        nav ul li {
            display: inline;
            margin-left: 1.5rem;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            padding: 0.5rem 0;
            position: relative;
        }

        nav ul li a:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: #fff;
            bottom: 0;
            left: 0;
            transition: width 0.3s;
        }

        nav ul li a:hover:after,
        nav ul li a.active:after {
            width: 100%;
        }

        .btn {
            display: inline-block;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            padding: 0.6rem 1.2rem;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s;
            font-weight: 500;
            box-shadow: 0 4px 15px rgba(106, 17, 203, 0.3);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(106, 17, 203, 0.4);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid #6a11cb;
            color: #6a11cb;
        }

        .btn-outline:hover {
            background: #6a11cb;
            color: #fff;
        }

        .btn-danger {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
        }

        .btn-danger:hover {
            box-shadow: 0 6px 20px rgba(255, 65, 108, 0.4);
        }

        .btn-success {
            background: linear-gradient(to right, #00b09b, #96c93d);
        }

        .btn-success:hover {
            box-shadow: 0 6px 20px rgba(0, 176, 155, 0.4);
        }

        footer {
            background: #343a40;
            color: #fff;
            text-align: center;
            padding: 2rem 0;
            margin-top: 3rem;
        }

        footer p {
            margin-bottom: 1rem;
        }

        .social-icons {
            margin: 1rem 0;
        }

        .social-icons a {
            color: #fff;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: all 0.3s;
        }

        .social-icons a:hover {
            color: #2575fc;
        }

        /* Dashboard Styles */
        .dashboard {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 2rem;
            margin: 2rem 0;
        }

        .sidebar {
            background: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .sidebar h3 {
            color: #6a11cb;
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .sidebar h3:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 0.8rem;
        }

        .sidebar ul li a {
            display: flex;
            align-items: center;
            padding: 0.8rem 1rem;
            color: #555;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s;
        }

        .sidebar ul li a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .sidebar ul li a:hover,
        .sidebar ul li a.active {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.2);
        }

        .main-content {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        /* Profile Styles */
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid #eee;
        }

        .profile-pic {
            position: relative;
            margin-right: 2rem;
            text-align: center;
        }

        .profile-pic img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .profile-pic .btn {
            margin-top: 1rem;
            padding: 0.4rem 0.8rem;
            font-size: 0.9rem;
        }

        .profile-info h3 {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .profile-info p {
            color: #666;
            margin-bottom: 0.5rem;
        }

        .profile-info .badge {
            display: inline-block;
            background: linear-gradient(to right, #00b09b, #96c93d);
            color: #fff;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            margin-top: 0.5rem;
        }

        /* Profile Form */
        .profile-form h3 {
            color: #6a11cb;
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .profile-form h3:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
        }

        .form-group {
            flex: 0 0 50%;
            padding: 0 15px;
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
            outline: none;
        }

        .form-actions {
            text-align: right;
            margin-top: 2rem;
        }

        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1.5rem;
            margin: 2rem 0;
        }

        .stat-card {
            background: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .stat-card i {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #6a11cb;
        }

        .stat-card h4 {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 0.5rem;
        }

        .stat-card p {
            font-size: 1.8rem;
            font-weight: 600;
            color: #333;
        }

        /* Academic Info */
        .academic-info {
            margin: 2rem 0;
        }

        .info-card {
            background: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 1.5rem;
        }

        .info-card h4 {
            color: #6a11cb;
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }

        .info-item {
            margin-bottom: 1rem;
        }

        .info-item label {
            display: block;
            color: #777;
            font-size: 0.9rem;
            margin-bottom: 0.3rem;
        }

        .info-item p {
            font-weight: 500;
            color: #333;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .dashboard {
                grid-template-columns: 1fr;
            }
            
            .profile-header {
                flex-direction: column;
                text-align: center;
            }
            
            .profile-pic {
                margin-right: 0;
                margin-bottom: 1.5rem;
            }
            
            .form-group {
                flex: 0 0 100%;
            }
            
            .stats-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            header h1,
            nav {
                float: none;
                text-align: center;
            }
            
            nav ul li {
                display: block;
                margin: 0.5rem 0;
            }
            
            .stats-container {
                grid-template-columns: 1fr;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Additional Styles */
        .alert {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 8px;
            font-weight: 500;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .progress-container {
            margin: 2rem 0;
        }

        .progress-title {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .progress-bar {
            height: 10px;
            background: #e9ecef;
            border-radius: 5px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            border-radius: 5px;
        }

        /* Tabs */
        .tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-bottom: 1.5rem;
        }

        .tab {
            padding: 0.8rem 1.5rem;
            cursor: pointer;
            font-weight: 500;
            color: #666;
            border-bottom: 3px solid transparent;
            transition: all 0.3s;
        }

        .tab.active {
            color: #6a11cb;
            border-bottom-color: #6a11cb;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>Student Help Desk</h1>
            <nav>
                <ul>
                    <li><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="profile.jsp" class="active">Profile</a></li>
                    <li><a href="forum.jsp">Forum</a></li>
                    <li><a href="resources.jsp">Resources</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="dashboard">
            <div class="sidebar">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="profile.jsp" class="active"><i class="fas fa-user"></i> My Profile</a></li>
                    <li><a href="courses.jsp"><i class="fas fa-book"></i> My Courses</a></li>
                    <li><a href="forum.jsp"><i class="fas fa-comments"></i> Discussion Forum</a></li>
                    <li><a href="assignments.jsp"><i class="fas fa-tasks"></i> Assignments</a></li>
                    <li><a href="feedback.jsp"><i class="fas fa-comment-alt"></i> Submit Feedback</a></li>
                    <li><a href="faq.jsp"><i class="fas fa-question-circle"></i> FAQs</a></li>
                    <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
                    <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </div>

            <div class="main-content">
                <c:if test="${not empty param.success}">
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> Profile updated successfully!
                    </div>
                </c:if>
                
                <div class="profile-header">
                    <div class="profile-pic">
                        <img src="https://ui-avatars.com/api/?name=${user.fullname}&background=6a11cb&color=fff&size=150" alt="Profile Picture">
                        <button class="btn btn-outline"><i class="fas fa-camera"></i> Change Photo</button>
                    </div>
                    <div class="profile-info">
                        <h3>${user.fullname}</h3>
                        <p><i class="fas fa-graduation-cap"></i> ${user.department} Department</p>
                        <p><i class="fas fa-id-card"></i> Student ID: ${user.student_id}</p>
                        <p><i class="fas fa-envelope"></i> ${user.email}</p>
                        <span class="badge"><i class="fas fa-star"></i> Honors Student</span>
                    </div>
                </div>

                <div class="tabs">
                    <div class="tab active" onclick="openTab(event, 'personal')">Personal Info</div>
                    <div class="tab" onclick="openTab(event, 'academic')">Academic Info</div>
                    <div class="tab" onclick="openTab(event, 'performance')">Performance</div>
                </div>

                <div id="personal" class="tab-content active">
                    <form action="ProfileUpdateServlet" method="post">
                        <h3>Personal Information</h3>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="fullname">Full Name</label>
                                <input type="text" id="fullname" name="fullname" class="form-control" value="${user.fullname}" required placeholder = "Ashinsana SGS">
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" name="email" class="form-control" value="${user.email}" required placeholder = "Gavin345@gmail.com">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" id="phone" name="phone" class="form-control" value="${user.phone}" placeholder = "0729874563">
                            </div>
                            <div class="form-group">
                                <label for="dob">Date of Birth</label>
                                <input type="text" id="dob" name="dob" class="form-control" value="${user.dob}" placeholder = "2001/02/04">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea id="address" name="address" class="form-control" rows="3" placeholder="Kandy">${user.address}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="bio">Bio</label>
                                <textarea id="bio" name="bio" class="form-control" rows="3" placeholder="Tell us about yourself...">${user.bio}</textarea>
                            </div>
                        </div>
                        
                        <h3 style="margin-top: 2rem;">Emergency Contact</h3>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="emergencyName">Contact Name</label>
                                <input type="text" id="emergencyName" name="emergencyName" class="form-control" value="${user.emergencyName}" placeholder = "Abeykoon DMV">
                            </div>
                            <div class="form-group">
                                <label for="emergencyPhone">Contact Phone</label>
                                <input type="tel" id="emergencyPhone" name="emergencyPhone" class="form-control" value="${user.emergencyPhone}" placeholder = "0117894564">
                            </div>
                        </div>
                       
                        
                     
                    </form>
                </div>

                <div id="academic" class="tab-content">
                    <div class="academic-info">
                        <div class="info-card">
                            <h4>Academic Details</h4>
                            <div class="info-grid">
                                <div class="info-item">
                                    <label>Student ID</label>
                                    <p>${user.student_id}</p>
                                </div>
                                <div class="info-item">
                                    <label>Department</label>
                                    <p>${user.department}</p>
                                </div>
                                <div class="info-item">
                                    <label>Program</label>
                                    <p>Bachelor of Science in Computer Science</p>
                                </div>
                                <div class="info-item">
                                    <label>Major</label>
                                    <p>Artificial Intelligence</p>
                                </div>
                                <div class="info-item">
                                    <label>Admission Year</label>
                                    <p>2022</p>
                                </div>
                                <div class="info-item">
                                    <label>Expected Graduation</label>
                                    <p>May 2026</p>
                                </div>
                                <div class="info-item">
                                    <label>Academic Standing</label>
                                    <p>Good Standing</p>
                                </div>
                                <div class="info-item">
                                    <label>Advisor</label>
                                    <p>Dr. Sarah Johnson</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="info-card">
                            <h4>Current Semester Courses</h4>
                            <div class="info-grid">
                                <div class="info-item">
                                    <label>CS 401 - Advanced Algorithms</label>
                                    <p>Prof. Michael Chen</p>
                                </div>
                                <div class="info-item">
                                    <label>CS 405 - Machine Learning</label>
                                    <p>Prof. Emily Davis</p>
                                </div>
                                <div class="info-item">
                                    <label>MATH 310 - Linear Algebra</label>
                                    <p>Prof. Robert Wilson</p>
                                </div>
                                <div class="info-item">
                                    <label>PHIL 210 - Ethics in Technology</label>
                                    <p>Prof. James Peterson</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="performance" class="tab-content">
                    <div class="stats-container">
                        <div class="stat-card">
                            <i class="fas fa-graduation-cap"></i>
                            <h4>GPA</h4>
                            <p>3.78</p>
                        </div>
                        <div class="stat-card">
                            <i class="fas fa-book"></i>
                            <h4>Courses Completed</h4>
                            <p>24</p>
                        </div>
                        <div class="stat-card">
                            <i class="fas fa-award"></i>
                            <h4>Credits Earned</h4>
                            <p>78</p>
                        </div>
                    </div>
                    
                    <div class="progress-container">
                        <h4>Degree Progress</h4>
                        <div class="progress-title">
                            <span>Bachelor of Science in Computer Science</span>
                            <span>65%</span>
                        </div>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 65%"></div>
                        </div>
                    </div>
                    
                    <div class="info-card">
                        <h4>Recent Grades</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Course</th>
                                    <th>Semester</th>
                                    <th>Grade</th>
                                    <th>Credits</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>CS 301 - Data Structures</td>
                                    <td>Fall 2023</td>
                                    <td>A</td>
                                    <td>4</td>
                                </tr>
                                <tr>
                                    <td>MATH 250 - Discrete Math</td>
                                    <td>Fall 2023</td>
                                    <td>A-</td>
                                    <td>3</td>
                                </tr>
                                <tr>
                                    <td>PHYS 201 - Physics I</td>
                                    <td>Fall 2023</td>
                                    <td>B+</td>
                                    <td>4</td>
                                </tr>
                                <tr>
                                    <td>HUM 101 - Humanities</td>
                                    <td>Fall 2023</td>
                                    <td>A</td>
                                    <td>3</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2025 Student Help Desk. All rights reserved.</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin"></i></a>
            </div>
            <nav>
                <ul>
                    <li><a href="privacy.jsp">Privacy Policy</a></li>
                    <li><a href="terms.jsp">Terms and Conditions</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                </ul>
            </nav>
        </div>
    </footer>

    <script>
        function openTab(evt, tabName) {
            // Hide all tab content
            var tabcontent = document.getElementsByClassName("tab-content");
            for (var i = 0; i < tabcontent.length; i++) {
                tabcontent[i].classList.remove("active");
            }
            
            // Remove active class from all tabs
            var tabs = document.getElementsByClassName("tab");
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove("active");
            }
            
            // Show the current tab and add active class
            document.getElementById(tabName).classList.add("active");
            evt.currentTarget.classList.add("active");
        }
        
        // Initialize the first tab as active
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelector(".tab").click();
        });
    </script>
</body>
</html>