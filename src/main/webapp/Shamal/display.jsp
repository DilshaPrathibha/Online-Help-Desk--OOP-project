<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../partials/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Post - Student Forum</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 20px;
        }
        
        .edit-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }
        
        h1 {
            color: #2c3e50;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 24px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #4b5563;
        }
        
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        
        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }
        
        textarea {
            min-height: 200px;
            resize: vertical;
            line-height: 1.6;
        }
        
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            border: none;
        }
        
        .btn-primary {
            background-color: #2ecc71;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #27ae60;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .btn-outline {
            background-color: transparent;
            border: 1px solid #d1d5db;
            color: #4b5563;
        }
        
        .btn-outline:hover {
            background-color: #f3f4f6;
            transform: translateY(-1px);
        }
        
        .error-message {
            color: #ef4444;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }
        
        .material-icons {
            vertical-align: middle;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h1>
            <i class="material-icons">edit</i>
            Edit Post
        </h1>
        
        <form id="editPostForm" action="ForumEditServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="postId" value="${post.postId}">
            
            <div class="form-group">
                <label for="title"><span class="material-icons">title</span> Post Title</label>
                <input type="text" id="title" name="title" value="${post.postTitle}" required>
                <div id="titleError" class="error-message">Title must be between 5 and 100 characters</div>
            </div>
            
            <div class="form-group">
                <label for="category"><span class="material-icons">category</span> Category</label>
                <select id="category" name="category" required>
                    <option value="Academic Help" ${post.postCategory eq 'Academic Help' ? 'selected' : ''}>Academic Help</option>
                    <option value="Technical Issue" ${post.postCategory eq 'Technical Issue' ? 'selected' : ''}>Technical Issue</option>
                    <option value="Study Group" ${post.postCategory eq 'Study Group' ? 'selected' : ''}>Study Group</option>
                    <option value="Resource Share" ${post.postCategory eq 'Resource Share' ? 'selected' : ''}>Resource Share</option>
                    <option value="General Discussion" ${post.postCategory eq 'General Discussion' ? 'selected' : ''}>General Discussion</option>
                </select>
                <div id="categoryError" class="error-message">Please select a category</div>
            </div>
            
            <div class="form-group">
                <label for="content"><span class="material-icons">description</span> Content</label>
                <textarea id="content" name="content" required>${post.postContent}</textarea>
                <div id="contentError" class="error-message">Content must be between 10 and 5000 characters</div>
            </div>
            
            <div class="form-actions">
                <a href="ForumReadServlet?postId=${post.postId}" class="btn btn-outline">
                    <i class="material-icons">cancel</i>
                    Cancel
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="material-icons">save</i>
                    Update Post
                </button>
            </div>
        </form>
    </div>
    
    <script>
        function validateForm() {
            let isValid = true;
            
            // Validate title
            const title = document.getElementById('title').value.trim();
            const titleError = document.getElementById('titleError');
            if (title.length < 5 || title.length > 100) {
                titleError.style.display = 'block';
                isValid = false;
            } else {
                titleError.style.display = 'none';
            }
            
            // Validate category
            const category = document.getElementById('category').value;
            const categoryError = document.getElementById('categoryError');
            if (!category) {
                categoryError.style.display = 'block';
                isValid = false;
            } else {
                categoryError.style.display = 'none';
            }
            
            // Validate content
            const content = document.getElementById('content').value.trim();
            const contentError = document.getElementById('contentError');
            if (content.length < 10 || content.length > 5000) {
                contentError.style.display = 'block';
                isValid = false;
            } else {
                contentError.style.display = 'none';
            }
            
            if (!isValid) {
                // Scroll to the first error
                const firstError = document.querySelector('.error-message[style="display: block;"]');
                if (firstError) {
                    firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
            
            return isValid;
        }
        
        // Auto-resize textarea
        const textarea = document.getElementById('content');
        textarea.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
        
        // Initialize textarea height
        textarea.style.height = 'auto';
        textarea.style.height = (textarea.scrollHeight) + 'px';
        
        // Show error messages from server if any
        <c:if test="${not empty param.error}">
            window.addEventListener('DOMContentLoaded', function() {
                const error = "${param.error}";
                let errorMessage = "An error occurred. Please try again.";
                
                if (error === "empty_fields") {
                    errorMessage = "Please fill all required fields";
                } else if (error === "unauthorized") {
                    errorMessage = "You are not authorized to edit this post";
                }
                
                alert(errorMessage);
            });
        </c:if>
    </script>
</body>
</html>

<%@ include file="../partials/footer.jsp" %>