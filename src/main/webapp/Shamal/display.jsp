<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forum Posts Table View</title>
    <style>
        /* ===== Global Styles ===== */
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --success: #4ade80;
            --danger: #f87171;
            --warning: #fbbf24;
            --info: #60a5fa;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
            --white: #ffffff;
            --border: #dee2e6;
            --shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06);
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }
        
        body {
            background-color: #f5f7fb;
            color: var(--dark);
            line-height: 1.6;
            font-size: 1rem;
        }
        
        a {
            text-decoration: none;
            color: inherit;
            transition: all 0.3s ease;
        }
        
        /* ===== Layout ===== */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        /* ===== Header ===== */
        header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: var(--white);
            padding: 1rem 0;
            box-shadow: var(--shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .logo i {
            font-size: 1.8rem;
        }
        
        .nav-links {
            display: flex;
            gap: 1.5rem;
        }
        
        .nav-links a {
            color: rgba(255,255,255,0.9);
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .nav-links a:hover {
            background: rgba(255,255,255,0.1);
            transform: translateY(-2px);
        }
        
        .nav-links a.active {
            background: rgba(255,255,255,0.2);
            font-weight: 600;
        }
        
        /* ===== Main Content ===== */
        main {
            padding: 2rem 0;
        }
        
        /* ===== Page Header ===== */
        .page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 2rem;
        }
        
        .page-title {
            display: flex;
            align-items: center;
            gap: 1rem;
            font-size: 1.75rem;
            color: var(--dark);
        }
        
        /* ===== Alerts ===== */
        .alert {
            padding: 1rem;
            margin: 1.5rem 0;
            border-radius: 0.5rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            box-shadow: var(--shadow);
        }
        
        .alert i {
            font-size: 1.25rem;
        }
        
        .alert-danger {
            background-color: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #ef4444;
        }
        
        /* ===== Table Section ===== */
        .table-section {
            background: var(--white);
            padding: 2rem;
            border-radius: 0.75rem;
            box-shadow: var(--shadow);
            border: 1px solid var(--border);
            overflow-x: auto;
        }
        
        /* ===== Table Styles ===== */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
            margin: 1.5rem 0;
        }
        
        .data-table thead {
            background-color: var(--primary);
            color: var(--white);
            position: sticky;
            top: 0;
        }
        
        .data-table th {
            padding: 1rem;
            text-align: left;
            font-weight: 600;
        }
        
        .data-table td {
            padding: 1rem;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }
        
        .data-table tbody tr:nth-child(even) {
            background-color: rgba(67, 97, 238, 0.05);
        }
        
        .data-table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.1);
        }
        
        /* ===== Action Buttons ===== */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            gap: 0.5rem;
        }
        
        .btn i {
            font-size: 1rem;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .btn-primary {
            background: var(--primary);
            color: var(--white);
        }
        
        .btn-primary:hover {
            background: var(--secondary);
        }
        
        .btn-danger {
            background: var(--danger);
            color: var(--white);
        }
        
        .btn-danger:hover {
            background: #ef4444;
        }
        
        /* ===== Empty State ===== */
        .empty-state {
            padding: 2rem;
            text-align: center;
            color: var(--gray);
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--gray);
        }
        
        /* ===== Back Button ===== */
        .back-btn {
            text-align: center;
            margin-top: 2rem;
        }
        
        /* ===== Footer ===== */
        footer {
            background: var(--dark);
            color: var(--white);
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
        }
        
        /* ===== Modal ===== */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        
        .modal-content {
            background: var(--white);
            padding: 2rem;
            border-radius: 0.75rem;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        
        .modal-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }
        
        .modal-message {
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        
        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
        }
        
        /* ===== Responsive Adjustments ===== */
        @media (max-width: 1024px) {
            .data-table {
                display: block;
                overflow-x: auto;
            }
        }
        
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-links {
                width: 100%;
                justify-content: center;
                flex-wrap: wrap;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
        
        /* Add these new styles */
		.search-section {
		    background: var(--white);
		    padding: 1.5rem;
		    border-radius: 0.75rem;
		    box-shadow: var(--shadow);
		    margin-bottom: 1.5rem;
		}
		
		.search-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-bottom: 1rem;
		}
		
		.search-title {
		    font-size: 1.25rem;
		    font-weight: 600;
		    color: var(--primary);
		    display: flex;
		    align-items: center;
		    gap: 0.5rem;
		}
		
		.search-form-grid {
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		    gap: 1rem;
		    margin-bottom: 1rem;
		}
		
		.search-form-row {
		    display: flex;
		    gap: 1rem;
		    align-items: flex-end;
		}
		
		.search-form-group {
		    flex: 1;
		}
		
		.search-form-group label {
		    display: block;
		    margin-bottom: 0.5rem;
		    font-size: 0.875rem;
		    font-weight: 500;
		    color: var(--dark);
		}
		
		.search-input {
		    width: 100%;
		    padding: 0.75rem 1rem;
		    border: 1px solid var(--border);
		    border-radius: 0.5rem;
		    font-size: 0.95rem;
		    transition: all 0.3s ease;
		}
		
		.search-input:focus {
		    border-color: var(--primary);
		    outline: none;
		    box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
		}
		
		.search-actions {
		    display: flex;
		    justify-content: flex-end;
		    gap: 0.75rem;
		    padding-top: 1rem;
		    border-top: 1px solid var(--border);
		}
		
		@media (max-width: 768px) {
		    .search-form-grid {
		        grid-template-columns: 1fr;
		    }
		    
		    .search-form-row {
		        flex-direction: column;
		        gap: 0.75rem;
		    }
		    
		    .search-actions {
		        justify-content: center;
		    }
		    
		    .search-actions .btn {
		        width: 100%;
		    }
		}
        
    </style>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container header-container">
            <div class="logo">
                <span class="material-icons">school</span>
                <span>StudentHelpDesk</span>
            </div>
            <nav class="nav-links">
                <a href="${pageContext.request.contextPath}/index.jsp"><span class="material-icons">home</span>Home</a>
                <a href="${pageContext.request.contextPath}/Shamal/ForumReadServlet"><span class="material-icons">forum</span>Forum View</a>
                <a href="${pageContext.request.contextPath}/Shamal/ForumReadServlet?view=table" class="active"><span class="material-icons">table_chart</span>Table View</a>
                <a href="${pageContext.request.contextPath}/profile.jsp"><span class="material-icons">person</span>Profile</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="page-header">
            <h2 class="page-title">
                <span class="material-icons">table_rows</span> Forum Posts - Table View
            </h2>
        </div>
        
        <!-- Search Section -->
		<section class="search-section">
		    <div class="search-header">
		        <h3 class="search-title">
		            <span class="material-icons">search</span> Filter Forum Posts
		        </h3>
		    </div>
		    
		    <form action="${pageContext.request.contextPath}/Shamal/ForumReadServlet" method="get">
		        <input type="hidden" name="view" value="table">
		        
		        <div class="search-form-grid">
		            <!-- Keyword Search -->
		            <div class="search-form-group">
		                <label for="searchKeyword">Search Content</label>
		                <input type="text" id="searchKeyword" name="search" 
		                       class="search-input" placeholder="Title, content or author..."
		                       value="${not empty searchKeyword ? searchKeyword : ''}">
		            </div>
		            
		            <!-- Category Filter -->
		            <div class="search-form-group">
		                <label for="searchCategory">Category</label>
		                <select id="searchCategory" name="category" class="search-input">
		                    <option value="">All Categories</option>
		                    <option value="Academic Help" ${categoryFilter eq 'Academic Help' ? 'selected' : ''}>Academic Help</option>
		                    <option value="Technical Issue" ${categoryFilter eq 'Technical Issue' ? 'selected' : ''}>Technical Issue</option>
		                    <option value="Study Group" ${categoryFilter eq 'Study Group' ? 'selected' : ''}>Study Group</option>
		                    <option value="Resource Share" ${categoryFilter eq 'Resource Share' ? 'selected' : ''}>Resource Share</option>
		                    <option value="General Discussion" ${categoryFilter eq 'General Discussion' ? 'selected' : ''}>General Discussion</option>
		                </select>
		            </div>
		            
		            <!-- Department Filter -->
		            <div class="search-form-group">
		                <label for="searchDepartment">Department</label>
		                <select id="searchDepartment" name="department" class="search-input">
		                    <option value="">All Departments</option>
		                    <option value="Computer Science" ${departmentFilter eq 'Computer Science' ? 'selected' : ''}>Computer Science</option>
		                    <option value="Information Technology" ${departmentFilter eq 'Information Technology' ? 'selected' : ''}>Information Technology</option>
		                    <option value="Electrical Engineering" ${departmentFilter eq 'Electrical Engineering' ? 'selected' : ''}>Electrical Engineering</option>
		                    <option value="Mechanical Engineering" ${departmentFilter eq 'Mechanical Engineering' ? 'selected' : ''}>Mechanical Engineering</option>
		                    <option value="Business Administration" ${departmentFilter eq 'Business Administration' ? 'selected' : ''}>Business Administration</option>
		                </select>
		            </div>
		        </div>
		        
		        <div class="search-form-row">
		            <!-- Date From -->
		            <div class="search-form-group">
		                <label for="searchDateFrom">From Date</label>
		                <input type="date" id="searchDateFrom" name="dateFrom" 
		                       class="search-input" value="${dateFrom}">
		            </div>
		            
		            <!-- Date To -->
		            <div class="search-form-group">
		                <label for="searchDateTo">To Date</label>
		                <input type="date" id="searchDateTo" name="dateTo" 
		                       class="search-input" value="${dateTo}">
		            </div>
		        </div>
		        
		        <div class="search-actions">
		            <button type="submit" class="btn btn-primary">
		                <span class="material-icons">search</span> Apply Filters
		            </button>
		            
		            <c:if test="${not empty searchKeyword or not empty categoryFilter or not empty departmentFilter or not empty dateFrom or not empty dateTo}">
		                <a href="${pageContext.request.contextPath}/Shamal/ForumReadServlet?view=table" class="btn btn-outline">
		                    <span class="material-icons">clear</span> Reset
		                </a>
		            </c:if>
		        </div>
		    </form>
		</section>
			
        <!-- Forum Delete Section -->>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                <span class="material-icons">error</span>
                An error occurred. Please try again.
            </div>
        </c:if>
        
        <section class="table-section">
            <c:choose>
                <c:when test="${not empty forumPosts}">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Student ID</th>
                                <th>Full Name</th>
                                <th>Department</th>
                                <th>Course</th>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Content</th>
                                <th>Date</th>
                                <th>Email</th>
                                <th>Replies</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="post" items="${forumPosts}">
                                <tr>
                                    <td>${post.postId}</td>
                                    <td>${post.studentId}</td>
                                    <td>${post.fullname}</td>
                                    <td>${post.department}</td>
                                    <td>${post.course}</td>
                                    <td>${post.postTitle}</td>
                                    <td>${post.postCategory}</td>
                                    <td>
                                        <div style="max-width: 300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                            ${post.postContent}
                                        </div>
                                    </td>
                                    <td>${post.postDate}</td>
                                    <td>${post.contactEmail}</td>
                                    <td>${post.replies.size()}</td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="${pageContext.request.contextPath}/Shamal/ForumEditServlet?id=${post.postId}" class="btn btn-primary">
                                                <span class="material-icons">edit</span>
                                            </a>
                                            <form action="${pageContext.request.contextPath}/Shamal/ForumDeleteServlet" method="POST" style="display: inline;">
                                                <input type="hidden" name="postId" value="${post.postId}">
                                                <button type="submit" class="btn btn-danger" 
                                                        onclick="return confirm('Are you sure you want to delete this post?')">
                                                    <span class="material-icons">delete</span>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <span class="material-icons">info</span>
                        <p>No forum posts found.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>
        
        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/Shamal/ForumReadServlet" class="btn btn-primary">
                <span class="material-icons">forum</span> Back to Forum View
            </a>
        </div>
    </main>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h3 class="modal-title">
                <span class="material-icons">warning</span> Confirm Deletion
            </h3>
            <p class="modal-message">Are you sure you want to delete this post? This action cannot be undone.</p>
            <div class="modal-actions">
                <button onclick="closeModal()" class="btn btn-outline">
                    <span class="material-icons">cancel</span> Cancel
                </button>
                <a id="confirmDeleteBtn" href="#" class="btn btn-danger">
                    <span class="material-icons">delete</span> Delete
                </a>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2025 StudentHelpDesk - All Rights Reserved</p>
        </div>
    </footer>

    <script>
        // Delete confirmation modal
        function confirmDelete(postId) {
            const modal = document.getElementById('deleteModal');
            const confirmBtn = document.getElementById('confirmDeleteBtn');
            
            confirmBtn.href = `${pageContext.request.contextPath}/Shamal/ForumDeleteServlet?postId=${postId}`;
            modal.style.display = 'flex';
        }
        
        function closeModal() {
            document.getElementById('deleteModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('deleteModal');
            if (event.target == modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>