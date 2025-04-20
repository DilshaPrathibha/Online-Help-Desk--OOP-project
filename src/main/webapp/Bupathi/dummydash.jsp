<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
        }
        
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }
        
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
        }
        
        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid #34495e;
        }
        
        .sidebar-nav {
            padding: 20px 0;
        }
        
        .nav-item {
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .nav-item:hover {
            background-color: #34495e;
        }
        
        .nav-item.active {
            background-color: #3498db;
        }
        
        .main-content {
            flex: 1;
            padding: 30px;
        }
        
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .dashboard-title {
            font-size: 24px;
            font-weight: 600;
        }
        
        .logout-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .dashboard-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }
        
        .info-item {
            margin-bottom: 10px;
        }
        
        .info-label {
            font-weight: 600;
            color: #7f8c8d;
            margin-bottom: 5px;
            font-size: 14px;
        }
        
        .info-value {
            font-size: 16px;
        }
        
        .payment-status {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
        }
        
        .status-paid {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .add-payment-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar Navigation -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>User Dashboard</h2>
            </div>
            <div class="sidebar-nav">
                <div class="nav-item active">Profile</div>
                <div class="nav-item">Payments</div>
                <div class="nav-item">Settings</div>
                <div class="nav-item">Support</div>
            </div>
        </div>
        
        <!-- Main Content Area -->
        <div class="main-content">
            <div class="dashboard-header">
                <div class="dashboard-title">Welcome back, John Doe!</div>
                <button class="logout-btn">Logout</button>
            </div>
            
            <!-- Registration Information Card -->
            <div class="dashboard-card">
                <div class="card-title">Registration Information</div>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Full Name</div>
                        <div class="info-value">John Doe</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Email</div>
                        <div class="info-value">john.doe@example.com</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Registration Date</div>
                        <div class="info-value">January 15, 2023</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">User ID</div>
                        <div class="info-value">USR-789456</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Account Status</div>
                        <div class="info-value">Active</div>
                    </div>
                </div>
            </div>
            
            <!-- Payment Information Card -->
            <div class="dashboard-card">
                <div class="card-title">Payment Information</div>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Payment Method</div>
                        <div class="info-value">VISA **** 4242</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Billing Address</div>
                        <div class="info-value">123 Main St, Apt 4B<br>New York, NY 10001</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Last Payment</div>
                        <div class="info-value">$99.00 on March 1, 2023</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Next Billing Date</div>
                        <div class="info-value">April 1, 2023</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Payment Status</div>
                        <div class="info-value">
                            <span class="payment-status status-paid">Paid</span>
                        </div>
                    </div>
                </div>
                <button class="add-payment-btn">Update Payment Method</button>
            </div>
        </div>
    </div>
</body>
</html>