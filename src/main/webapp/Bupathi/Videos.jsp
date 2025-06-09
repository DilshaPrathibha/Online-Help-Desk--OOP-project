<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Learning Videos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-text: #2c3e50;
            --light-text: #ecf0f1;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--light-bg);
            color: var(--dark-text);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background-color: var(--secondary-color);
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .search-container {
            margin: 20px auto;
            max-width: 600px;
        }
        
        #searchInput {
            width: 100%;
            padding: 12px 20px;
            border: 2px solid #ddd;
            border-radius: 25px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s;
        }
        
        #searchInput:focus {
            border-color: var(--primary-color);
        }
        
        .category-tabs {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 30px;
            gap: 10px;
        }
        
        .tab-btn {
            padding: 10px 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .tab-btn:hover, .tab-btn.active {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        
        .videos-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }
        
        .video-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .video-thumbnail {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 aspect ratio */
            height: 0;
            overflow: hidden;
        }
        
        .video-thumbnail iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .video-info {
            padding: 15px;
        }
        
        .video-title {
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--secondary-color);
        }
        
        .video-channel {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
        
        .video-desc {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .category-section {
            margin-bottom: 40px;
        }
        
        .category-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-color);
            color: var(--secondary-color);
        }
        
        @media (max-width: 768px) {
            .videos-container {
                grid-template-columns: 1fr;
            }
            
            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="../partials/header.jsp" %>
    
    <header>
        <div class="container">
            <h1>Learning Resources</h1>
            <p>Curated collection of educational videos</p>
        </div>
    </header>
    
    <div class="container">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Search videos..." onkeyup="searchVideos()">
        </div>
        
        <div class="category-tabs">
            <button class="tab-btn active" onclick="filterVideos('all')">All</button>
            <button class="tab-btn" onclick="filterVideos('java')">Java</button>
            <button class="tab-btn" onclick="filterVideos('oop')">OOP</button>
            <button class="tab-btn" onclick="filterVideos('mern')">MERN Stack</button>
            <button class="tab-btn" onclick="filterVideos('se')">Software Engineering</button>
            <button class="tab-btn" onclick="filterVideos('web')">Web Development</button>
        </div>
        
        <!-- Java Videos -->
        <div class="category-section" data-category="java">
            <h2 class="category-title">Java Programming</h2>
            <div class="videos-container">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/eIrMbAQSU34" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Java Tutorial for Beginners</h3>
                        <p class="video-channel">Programming with Mosh</p>
                        <p class="video-desc">Learn Java programming basics in this beginner-friendly tutorial.</p>
                    </div>
                </div>
                
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/grEKMHGYyns" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Advanced Java Concepts</h3>
                        <p class="video-channel">Java Brains</p>
                        <p class="video-desc">Deep dive into advanced Java programming concepts.</p>
                    </div>
                </div>
                
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/hBh_CC5y8-s" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Java Collections Framework</h3>
                        <p class="video-channel">Coding with John</p>
                        <p class="video-desc">Complete guide to Java Collections framework.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- OOP Videos -->
        <div class="category-section" data-category="oop">
            <h2 class="category-title">Object-Oriented Programming</h2>
            <div class="videos-container">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/pTB0EiLXUC8" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">OOP Concepts Explained</h3>
                        <p class="video-channel">Derek Banas</p>
                        <p class="video-desc">Learn the four pillars of OOP with clear examples.</p>
                    </div>
                </div>
                
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/1H2oyIYhN3I" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Design Patterns in OOP</h3>
                        <p class="video-channel">Christopher Okhravi</p>
                        <p class="video-desc">Common design patterns explained with real-world examples.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- MERN Stack Videos -->
        <div class="category-section" data-category="mern">
            <h2 class="category-title">MERN Stack Development</h2>
            <div class="videos-container">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/7CqJlxBYj-M" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">MERN Stack Full Course</h3>
                        <p class="video-channel">freeCodeCamp.org</p>
                        <p class="video-desc">Complete MERN stack tutorial with project.</p>
                    </div>
                </div>
                
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/98BzS5Oz5E4" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">React with Node.js Backend</h3>
                        <p class="video-channel">The Net Ninja</p>
                        <p class="video-desc">Building full-stack applications with MERN.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Software Engineering Videos -->
        <div class="category-section" data-category="se">
            <h2 class="category-title">Software Engineering</h2>
            <div class="videos-container">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/O753uuutqH8" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Software Engineering Basics</h3>
                        <p class="video-channel">CS Dojo</p>
                        <p class="video-desc">Fundamentals of software engineering.</p>
                    </div>
                </div>
                
                <div class="video-card">
                    <div class="video-thumbnail">
                        <iframe src="https://www.youtube.com/embed/LLoq8X6WMaY" allowfullscreen></iframe>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Clean Code Principles</h3>
                        <p class="video-channel">Web Dev Simplified</p>
                        <p class="video-desc">Writing maintainable and clean code.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Filter videos by category
        function filterVideos(category) {
            // Update active tab
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
                if (btn.textContent.toLowerCase().includes(category) {
                    btn.classList.add('active');
                }
            });
            
            // Show/hide categories
            document.querySelectorAll('.category-section').forEach(section => {
                if (category === 'all' || section.getAttribute('data-category') === category) {
                    section.style.display = 'block';
                } else {
                    section.style.display = 'none';
                }
            });
        }
        
        // Search functionality
        function searchVideos() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const videos = document.querySelectorAll('.video-card');
            
            videos.forEach(video => {
                const title = video.querySelector('.video-title').textContent.toLowerCase();
                const desc = video.querySelector('.video-desc').textContent.toLowerCase();
                
                if (title.includes(filter) || desc.includes(filter)) {
                    video.style.display = 'block';
                } else {
                    video.style.display = 'none';
                }
            });
        }
    </script>
    
    <%@ include file="../partials/footer.jsp" %>
</body>
</html>