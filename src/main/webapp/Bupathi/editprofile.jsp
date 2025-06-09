<%@ include file="../partials/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f4f4f9; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .btn { background-color: #3498db; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background-color: #2980b9; }
        .message { padding: 10px; margin: 10px 0; border-radius: 4px; }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Profile</h2>
        
        <c:if test="${not empty successMessage}">
            <div class="message success">${successMessage}</div>
        </c:if>
        
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/editProfile" method="post">
            <div class="form-group">
                <label for="stdid">Student ID</label>
                <input type="text" id="stdid" name="stdid" value="${student.stdid}" readonly>
            </div>
            
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" value="${student.fullname}" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${student.email}" required>
            </div>
            
            <div class="form-group">
                <label for="phonenumber">Phone Number</label>
                <input type="text" id="phonenumber" name="phonenumber" value="${student.phonenumber}" required>
            </div>
            
            <div class="form-group">
                <label for="semester">Semester</label>
                <select id="semester" name="semester" required>
                    <option value="1" ${student.semester == 1 ? 'selected' : ''}>1</option>
                    <option value="2" ${student.semester == 2 ? 'selected' : ''}>2</option>
                    <option value="3" ${student.semester == 3 ? 'selected' : ''}>3</option>
                    <option value="4" ${student.semester == 4 ? 'selected' : ''}>4</option>
                    <option value="5" ${student.semester == 5 ? 'selected' : ''}>5</option>
                    <option value="6" ${student.semester == 6 ? 'selected' : ''}>6</option>
                    <option value="7" ${student.semester == 7 ? 'selected' : ''}>7</option>
                    <option value="8" ${student.semester == 8 ? 'selected' : ''}>8</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="fos">Field of Study</label>
                <input type="text" id="fos" name="fos" value="${student.fos}" required>
            </div>
            
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob" value="${student.dob}" required>
            </div>
            
            <button type="submit" class="btn">Update Profile</button>
            <a href="${pageContext.request.contextPath}/Bupathi/dummydash.jsp" class="btn" style="background-color: #6c757d;">Cancel</a>
        </form>
    </div>
</body>
</html>