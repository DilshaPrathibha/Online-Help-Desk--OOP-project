<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #34495e;
            --accent: #3498db;
            --success: #2ecc71;
            --danger: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
        }
        
        .admin-container {
            display: grid;
            grid-template-columns: 220px 1fr;
            min-height: 100vh;
        }
        
        /* Sidebar */
        .admin-sidebar {
            background: var(--primary);
            color: white;
            padding: 20px 0;
        }
        
        .admin-brand {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .admin-nav {
            list-style: none;
            margin-top: 20px;
        }
        
        .admin-nav li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px 20px;
            transition: all 0.2s;
        }
        
        .admin-nav li a:hover {
            background: rgba(255,255,255,0.1);
        }
        
        /* Main Content */
        .admin-main {
            padding: 30px;
        }
        
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .admin-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .admin-card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .admin-card h3 {
            color: var(--text-light);
            font-size: 14px;
            margin-bottom: 10px;
        }
        
        .admin-card p {
            font-size: 24px;
            font-weight: bold;
        }
        
        .card-students { border-left: 4px solid var(--accent); }
        .card-courses { border-left: 4px solid var(--success); }
        .card-payments { border-left: 4px solid var(--danger); }
        .card-active { border-left: 4px solid #f39c12; }
        
        /* Recent Activity */
        .recent-activity {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .activity-item {
            display: flex;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--accent);
        }
        
        .activity-content h4 {
            margin-bottom: 5px;
        }
        
        .activity-content p {
            color: var(--text-light);
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <!-- Sidebar -->
        <div class="admin-sidebar">
            <div class="admin-brand">
                <h2>Admin Panel</h2>
            </div>
            <ul class="admin-nav">
                <li><a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/StudentList"><i class="fas fa-sign-out-alt"></i>Students</a></li>
                <li><a href="#"><i class="fas fa-book"></i> Courses</a></li>
                <li><a href="#"><i class="fas fa-credit-card"></i> Payments</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
        
        <!-- Main Content -->
        <div class="admin-main">
            <div class="admin-header">
                <h1>Welcome back, ${admin.fullName}!</h1>
                <div class="admin-actions">
                    <button class="btn btn-primary">New Report</button>
                </div>
            </div>
            
            <!-- Stats Cards -->
            <div class="admin-cards">
                <div class="admin-card card-students">
                    <h3>Total Students</h3>
                    <p>1,254</p>
                </div>
                <div class="admin-card card-courses">
                    <h3>Active Courses</h3>
                    <p>24</p>
                </div>
                <div class="admin-card card-payments">
                    <h3>Pending Payments</h3>
                    <p>18</p>
                </div>
                <div class="admin-card card-active">
                    <h3>Active Users</h3>
                    <p>342</p>
                </div>
            </div>
            
            <!-- Recent Activity -->
            <div class="recent-activity">
                <h2>Recent Activity</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-content">
                            <h4>New Student Registered</h4>
                            <p>John Doe just created an account</p>
                            <small>10 minutes ago</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Course Updated</h4>
                            <p>Advanced Java course materials were updated</p>
                            <small>1 hour ago</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Payment Received</h4>
                            <p>Payment of $150 received from student #2456</p>
                            <small>2 hours ago</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-exclamation-circle"></i>
                        </div>
                        <div class="activity-content">
                            <h4>System Alert</h4>
                            <p>Backup completed successfully</p>
                            <small>5 hours ago</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>