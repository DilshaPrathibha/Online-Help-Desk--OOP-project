<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Error - Something Went Wrong</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet" />
    <style>

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            color: #004085; 
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #cce5ff;  
            border: 1px solid #b8daff; 
            padding: 40px 50px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 123, 255, 0.4);
            max-width: 450px;
            text-align: center;
        }

        h1 {
            font-weight: 600;
            font-size: 2rem;
            color: #004085;
            margin-bottom: 15px;
        }

        p {
            font-weight: 400;
            font-size: 1rem;
            margin-bottom: 30px;
            color: #004085;
        }

        a.button {
            display: inline-block;
            background-color: #0056b3; 
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 5px;
            font-weight: 600;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,86,179,0.4);
        }

        a.button:hover {
            background-color: #003d80; 
            box-shadow: 0 6px 12px rgba(0,61,128,0.5);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Oops! Something went wrong.</h1>
        <p>We are sorry for the inconvenience. Please try again later or contact support if the problem persists.</p>
        <a href="${pageContext.request.contextPath}/Bupathi/index.jsp" class="button">Go to Home</a>
    </div>
</body>

</html>
