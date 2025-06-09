<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../partials/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Forum</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fafb;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            padding: 20px;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .alert {
            padding: 12px 16px;
            border-radius: 6px;
            margin: 10px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-success {
            background-color: #d1fae5;
            color: #065f46;
            border-left: 4px solid #10b981;
        }

        .alert-danger {
            background-color: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #ef4444;
        }

        .alert-info {
            background-color: #e0f2fe;
            color: #0369a1;
            border-left: 4px solid #0ea5e9;
        }

        .search-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin: 20px auto;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
        }

        .search-form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .search-form-group {
            flex: 1;
            min-width: 250px;
        }

        .search-form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
            color: #4b5563;
        }

        .search-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .search-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            outline: none;
        }

        .search-actions {
            margin-top: 20px;
            text-align: right;
        }

        .btn {
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #3b82f6;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2563eb;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid #3b82f6;
            color: #3b82f6;
        }

        .btn-outline:hover {
            background-color: #eff6ff;
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: #ef4444;
            color: white;
        }

        .btn-danger:hover {
            background-color: #dc2626;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .forum-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e5e7eb;
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
            color: #374151;
        }

        .post-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .post-item {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .post-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .post-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 6px;
            color: #1e293b;
        }

        .post-title a {
            color: inherit;
            text-decoration: none;
        }

        .post-title a:hover {
            color: #3b82f6;
        }

        .post-meta {
            font-size: 14px;
            color: #6b7280;
            display: flex;
            gap: 15px;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }

        .post-meta span {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .post-content {
            font-size: 15px;
            color: #374151;
            margin-bottom: 10px;
            line-height: 1.6;
        }

        .post-category {
            background-color: #e5e7eb;
            padding: 4px 10px;
            display: inline-block;
            font-size: 13px;
            border-radius: 12px;
            margin-bottom: 10px;
            color: #4b5563;
            font-weight: 500;
        }

        .post-actions {
            text-align: right;
            margin-top: 15px;
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .material-icons {
            font-size: 18px;
            vertical-align: middle;
        }

        .forum-actions {
            text-align: right;
        }
        
        .reply-form {
            margin-top: 20px; 
            padding: 15px; 
            background: #f8f9fa; 
            border-radius: 8px;
            border-left: 3px solid #3b82f6;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #4b5563;
        }
        
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            min-height: 80px;
            resize: vertical;
            transition: border-color 0.3s;
        }
        
        .form-group textarea:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }
        
        .replies {
            margin-top: 20px;
            border-top: 1px solid #e5e7eb;
            padding-top: 15px;
        }
        
        .reply {
            padding: 15px;
            border-bottom: 1px solid #eee; 
            margin-bottom: 10px;
            background: #f9fafb;
            border-radius: 6px;
        }
        
        .reply-content {
            margin-bottom: 5px;
            line-height: 1.6;
        }
        
        .reply-meta {
            font-size: 12px; 
            color: #6b7280;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .reply-actions {
            display: flex;
            gap: 10px;
        }
        
        .reply-actions a {
            color: #6b7280;
            text-decoration: none;
            font-size: 12px;
            transition: color 0.3s;
        }
        
        .reply-actions a:hover {
            color: #3b82f6;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
        }
        
        .empty-state-icon {
            font-size: 48px;
            color: #9ca3af;
            margin-bottom: 15px;
        }
        
        .empty-state-text {
            color: #6b7280;
            margin-bottom: 20px;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 5px;
        }
        
        .pagination a, .pagination span {
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            text-decoration: none;
            color: #4b5563;
            transition: all 0.3s;
        }
        
        .pagination a:hover {
            background-color: #f3f4f6;
            border-color: #9ca3af;
        }
        
        .pagination .active {
            background-color: #3b82f6;
            color: white;
            border-color: #3b82f6;
        }
        
        @media (max-width: 768px) {
            .search-form-grid {
                flex-direction: column;
            }
            
            .post-meta {
                flex-direction: column;
                gap: 5px;
            }
            
            .post-actions {
                flex-direction: column;
                align-items: flex-end;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body> 
    <!-- Messages -->
    <c:if test="${not empty param.create}">
        <div class="alert alert-success">
            <span class="material-icons">check_circle</span>
            Post created successfully!
        </div>
    </c:if>
    <c:if test="${not empty param.update}">
        <div class="alert alert-success">
            <span class="material-icons">check_circle</span>
            Post updated successfully!
        </div>
    </c:if>
    <c:if test="${not empty param.delete}">
        <div class="alert alert-success">
            <span class="material-icons">check_circle</span>
            Post deleted successfully!
        </div>
    </c:if>
    <c:if test="${not empty param.reply}">
        <div class="alert alert-success">
            <span class="material-icons">check_circle</span>
            Reply posted successfully!
        </div>
    </c:if>
    
    <c:if test="${not empty param.reply_delete}">
    <div class="alert alert-success">
        <span class="material-icons">check_circle</span>
        Reply deleted successfully!
    </div>
	</c:if>

    <c:if test="${not empty param.error}">
        <div class="alert alert-danger">
            <span class="material-icons">error</span>
            <c:choose>
                <c:when test="${param.error == 'unauthorized'}">You are not authorized to perform this action</c:when>
                <c:when test="${param.error == 'empty_fields'}">Please fill all required fields</c:when>
                <c:otherwise>An error occurred. Please try again.</c:otherwise>
            </c:choose>
        </div>
    </c:if>
    
    <!-- Search Section -->
    <section class="search-section">
        <form id="searchForm" action="${pageContext.request.contextPath}/ForumReadServlet" method="get">
            <div class="search-form-grid">
                <div class="search-form-group">
                    <label for="searchKeyword">Search Content</label>
                    <input type="text" id="searchKeyword" name="search" 
                           class="search-input" placeholder="Title, content or author..."
                           value="${not empty searchKeyword ? searchKeyword : ''}">
                </div>
                
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
            
            <div class="search-actions">
                <button type="submit" class="btn btn-primary">
                    <span class="material-icons">search</span> Search
                </button>
                <button type="reset" class="btn btn-outline" id="resetBtn">
                    <span class="material-icons">refresh</span> Reset
                </button>
            </div>
        </form>
    </section>
    
    <main class="container">
        <div class="forum-header">
            <h2>Forum Posts</h2>
            <div class="forum-actions">
                <a href="${pageContext.request.contextPath}/ForumCreateServlet" class="btn btn-primary">
                    <i class="material-icons">add</i> New Post
                </a>
            </div>
        </div>

        <div class="section">
            <div class="section-title">
                <i class="material-icons">forum</i>
                Recent Discussions
            </div>

            <div class="post-list">
                <c:choose>
                    <c:when test="${not empty forumPosts}">
                        <c:forEach var="post" items="${forumPosts}">
                            <div class="post-item" id="post-${post.postId}">
                                <div class="post-title"><a href="${pageContext.request.contextPath}/Shamal/ForumReadServlet?view=table&postId=${post.postId}">${post.postTitle}</a></div>
                                <div class="post-meta">
                                    <span><i class="material-icons">person</i> ${post.fullname}</span>
                                    <span><i class="material-icons">schedule</i> ${post.postDate}</span>
                                    <span><i class="material-icons">comment</i> ${post.replies.size()} replies</span>
                                    <span><i class="material-icons">school</i> ${post.department}</span>
                                </div>
                                <div class="post-content">
                                    ${post.postContent}
                                </div>
                                <div class="post-category">${post.postCategory}</div>                           
                                <div class="post-actions">
                               
                                    
                                    <!-- Edit/Delete - only for post owner -->
                                    <c:if test="${not empty student && student.stdid eq post.studentId}">
                                        <a href="ForumEditServlet?postId=${post.postId}" class="btn btn-outline">
                                            <i class="material-icons">edit</i> Edit
                                        </a>
                                        <form action="ForumDeleteServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="postId" value="${post.postId}">
                                            <button type="submit" class="btn btn-danger" 
                                                    onclick="return confirm('Are you sure you want to delete this post? This action cannot be undone.')">
                                                <i class="material-icons">delete</i> Delete
                                            </button>
                                        </form>
                                    </c:if>
                                </div>

                                <!-- Reply form - for logged in users -->
                                <c:if test="${not empty student}">
                                    <div class="reply-form">
                                        <form class="reply-form-${post.postId}" action="ForumReplyServlet" method="post" onsubmit="return validateReplyForm(${post.postId})">
                                            <input type="hidden" name="postId" value="${post.postId}">
                                            <div class="form-group">
                                                <label>Your Reply</label>
                                                <textarea name="replyContent" id="replyContent-${post.postId}" required 
                                                          placeholder="Write your reply here..."></textarea>
                                            </div>
                                            <div style="text-align: right;">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="material-icons">send</i> Post Reply
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </c:if>
                                
                                <!-- Display replies -->
                                <div class="replies">
                                    <c:forEach items="${post.replies}" var="reply">
                                        <div class="reply">
                                            <div class="reply-content">${reply.replyContent}</div>
                                            <div class="reply-meta">
                                                <span><i class="material-icons" style="font-size:14px;">person</i> ${reply.fullname} • ${reply.replyDate}</span>
                                                <c:if test="${not empty student && student.stdid eq reply.studentId}">
                                                    <div class="reply-actions">
                                                        <a href="DeleteReplyServlet?replyId=${reply.replyId}&postId=${post.postId}" 
                                                           onclick="return confirm('Are you sure you want to delete this reply?')">
                                                            <i class="material-icons" style="font-size:14px;">delete</i> Delete
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                        
                        <!-- Pagination -->
                        <c:if test="${totalPages > 1}">
                            <div class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <a href="?page=${currentPage - 1}&search=${searchKeyword}&category=${categoryFilter}&department=${departmentFilter}">
                                        <i class="material-icons">chevron_left</i>
                                    </a>
                                </c:if>
                                
                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                            <span class="active">${i}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="?page=${i}&search=${searchKeyword}&category=${categoryFilter}&department=${departmentFilter}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                
                                <c:if test="${currentPage < totalPages}">
                                    <a href="?page=${currentPage + 1}&search=${searchKeyword}&category=${categoryFilter}&department=${departmentFilter}">
                                        <i class="material-icons">chevron_right</i>
                                    </a>
                                </c:if>
                            </div>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <div class="empty-state-icon">
                                <i class="material-icons">forum</i>
                            </div>
                            <h3>No posts found</h3>
                            <p class="empty-state-text">There are no posts matching your criteria. Be the first to create one!</p>
                            <a href="${pageContext.request.contextPath}/ForumCreateServlet" class="btn btn-primary">
                                <i class="material-icons">add</i> Create Post
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <script>
        // Reset form handler
        document.getElementById('resetBtn').addEventListener('click', function() {
            document.getElementById('searchForm').reset();
            window.location.href = "${pageContext.request.contextPath}/ForumReadServlet";
        });
        
        // Validate reply form
        function validateReplyForm(postId) {
            const replyContent = document.getElementById('replyContent-' + postId).value.trim();
            
            if (replyContent.length < 5) {
                alert('Reply must be at least 5 characters long.');
                return false;
            }
            
            if (replyContent.length > 1000) {
                alert('Reply cannot exceed 1000 characters.');
                return false;
            }
            
            return true;
        }
        
        // Auto-resize textareas
        document.querySelectorAll('textarea').forEach(textarea => {
            textarea.addEventListener('input', function() {
                this.style.height = 'auto';
                this.style.height = (this.scrollHeight) + 'px';
            });
        });
        
        // Show success message if redirected from successful action
        if (window.location.search.includes('success=')) {
            setTimeout(() => {
                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(alert => {
                    alert.style.transition = 'opacity 0.5s';
                    alert.style.opacity = '0';
                    setTimeout(() => alert.remove(), 500);
                });
            }, 3000);
        }
    </script>
    
    <%@ include file="../partials/footer.jsp" %>
</body>
</html>