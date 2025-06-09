<%@ include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Post</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }

        .forum-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 30px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }

        .forum-header h2 {
            font-size: 24px;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #4b5563;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            box-sizing: border-box;
            resize: vertical;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .form-group textarea {
            height: 200px;
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
            gap: 6px;
            padding: 12px 24px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
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

        .material-icons {
            vertical-align: middle;
            font-size: 18px;
        }

        .error-message {
            color: #ef4444;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .container {
                padding: 20px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>
    <main class="container">
        <div class="forum-header">
            <h2><span class="material-icons">create</span> Create New Post</h2>
        </div>

        <form id="createPostForm" action="${pageContext.request.contextPath}/ForumCreateServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="post_title"><span class="material-icons">title</span> Post Title</label>
                <input type="text" id="post_title" name="post_title" required placeholder="Brief title of your post">
                <div id="titleError" class="error-message">Title must be between 5 and 100 characters</div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="department"><span class="material-icons">school</span> Department</label>
                    <select id="department" name="department" required>
                        <option value="">Select Department</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Electrical Engineering">Electrical Engineering</option>
                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                        <option value="Business Administration">Business Administration</option>
                    </select>
                    <div id="departmentError" class="error-message">Please select a department</div>
                </div>

                <div class="form-group">
                    <label for="course"><span class="material-icons">menu_book</span> Course</label>
                    <input type="text" id="course" name="course" required placeholder="Course code or name">
                    <div id="courseError" class="error-message">Course name is required</div>
                </div>
            </div>

            <div class="form-group">
                <label for="post_category"><span class="material-icons">category</span> Category</label>
                <select id="post_category" name="post_category" required>
                    <option value="">Select Category</option>
                    <option value="Academic Help">Academic Help</option>
                    <option value="Technical Issue">Technical Issue</option>
                    <option value="Study Group">Study Group</option>
                    <option value="Resource Share">Resource Share</option>
                    <option value="General Discussion">General Discussion</option>
                </select>
                <div id="categoryError" class="error-message">Please select a category</div>
            </div>

            <div class="form-group">
                <label for="post_content"><span class="material-icons">description</span> Content</label>
                <textarea id="post_content" name="post_content" required placeholder="Describe your question or topic in detail"></textarea>
                <div id="contentError" class="error-message">Content must be between 10 and 5000 characters</div>
            </div>

            <div class="form-group">
                <label for="contact_email"><span class="material-icons">email</span> Contact Email</label>
                <input type="email" id="contact_email" name="contact_email" 
                       value="${sessionScope.student.email}" required>
                <div id="emailError" class="error-message">Please enter a valid email address</div>
            </div>

            <div class="form-actions">
                <a href="${pageContext.request.contextPath}/ForumReadServlet" class="btn btn-outline">
                    <span class="material-icons">cancel</span> Cancel
                </a>
                <button type="submit" class="btn btn-primary">
                    <span class="material-icons">send</span> Submit Post
                </button>
            </div>
        </form>
    </main>
    
    <script>
        function validateForm() {
            let isValid = true;
            
            // Validate title
            const title = document.getElementById('post_title').value.trim();
            const titleError = document.getElementById('titleError');
            if (title.length < 5 || title.length > 100) {
                titleError.style.display = 'block';
                isValid = false;
            } else {
                titleError.style.display = 'none';
            }
            
            // Validate department
            const department = document.getElementById('department').value;
            const departmentError = document.getElementById('departmentError');
            if (!department) {
                departmentError.style.display = 'block';
                isValid = false;
            } else {
                departmentError.style.display = 'none';
            }
            
            // Validate course
            const course = document.getElementById('course').value.trim();
            const courseError = document.getElementById('courseError');
            if (!course) {
                courseError.style.display = 'block';
                isValid = false;
            } else {
                courseError.style.display = 'none';
            }
            
            // Validate category
            const category = document.getElementById('post_category').value;
            const categoryError = document.getElementById('categoryError');
            if (!category) {
                categoryError.style.display = 'block';
                isValid = false;
            } else {
                categoryError.style.display = 'none';
            }
            
            // Validate content
            const content = document.getElementById('post_content').value.trim();
            const contentError = document.getElementById('contentError');
            if (content.length < 10 || content.length > 5000) {
                contentError.style.display = 'block';
                isValid = false;
            } else {
                contentError.style.display = 'none';
            }
            
            // Validate email
            const email = document.getElementById('contact_email').value.trim();
            const emailError = document.getElementById('emailError');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                emailError.style.display = 'block';
                isValid = false;
            } else {
                emailError.style.display = 'none';
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
        const textarea = document.getElementById('post_content');
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
                } else if (error === "invalid_email") {
                    errorMessage = "Please enter a valid email address";
                }
                
                alert(errorMessage);
            });
        </c:if>
    </script>
</body>
</html>