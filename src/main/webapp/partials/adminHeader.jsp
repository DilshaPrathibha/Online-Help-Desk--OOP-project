<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HelpAura</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/partials/media/logo.png">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f5f5f5;
            color: #333;
        }

        .header-title {
            background: #0077cc;
            padding: 15px 0;
            color: white;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 10px;
            padding-left: 40px;
        }

        .header-title img {
            height: 36px;
        }

        .header-title h1 {
            font-size: 1.8rem;
            font-weight: 600;
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="header-title">
        <a href="${pageContext.request.contextPath}/Bupathi/index.jsp" style="text-decoration: none; color: white; display: flex; align-items: center; gap: 10px;">
            <img src="${pageContext.request.contextPath}/partials/media/logo.png" alt="Logo">
            <h1>HelpAura</h1>
        </a>
    </div>
</body>
</html>
