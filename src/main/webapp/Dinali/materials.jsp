<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Help Desk</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="styleD.css">

    <script src="./script/fontawe.js" crossorigin="anonymous"></script>

</head>
<body class="mbody">


    <input type="search" placeholder="Search study materials..." class="search-bar" >
    
    <main>
        <section class="materials">
            <div class="category" onclick="toggleDetails('notes')">
                <h2>Lecture Notes</h2>
                <ul id="notes">
                    <li><a href="https://courseweb.sliit.lk/course/index.php?categoryid=27">Computing</a></li>
                    <li><a href="https://courseweb.sliit.lk/course/index.php?categoryid=254">Engineering</a></li>
                    <li><a href="https://courseweb.sliit.lk/course/index.php?categoryid=160">Business</a></li>
                </ul>
            </div>
            
            <div class="category" onclick="toggleDetails('books')">
                <h2>E-Books</h2>
                <ul id="books">
                    <li><a href="https://learning.oreilly.com/home/">O' Reilly</a></li>
                    <li><a href="https://admin.elibrary.in.pearson.com/sso/signup;jsessionid=EEEE1FB709289C13125D000E98636C09?
                        eulogin=true&service=https://ebooks.elibrary.in.pearson.com/wr/index.html">Pearson</a></li>
                    <li><a href="https://www.sciencedirect.com/browse/journals-and-books">Elsevier</a></li>
                    <li><a href="https://www.asmedigitalcollection.asme.org/ebooks">ASME</a></li>
                    <li><a href="https://onlinelibrary.wiley.com/action/showPublications">Wiley e-Books</a></li>
                    <li><a href="https://www.free-ebooks.net/">Other...</a></li>
                </ul>
            </div>
            
            <div class="category" onclick="toggleDetails('videos')">
                <h2>Video Tutorials</h2>
                <ul id="videos">
                    <li><a href="https://lecturecapture.sliit.lk/"><i class="fa-solid fa-video"></i></a></li>
                </ul>
            </div>
            
            <div class="category" onclick="toggleDetails('papers')">
                <h2>Past Exam Papers</h2>
                <ul id="papers">
                    <li><a href="https://courseweb.sliit.lk/course/view.php?id=18&section=5&singlesec=5">2024</a></li>
                    <li><a href="https://courseweb.sliit.lk/course/view.php?id=18&section=5&singlesec=5">2023</a></li>
                    <li><a href="https://courseweb.sliit.lk/course/view.php?id=18&section=5&singlesec=5">2022</a></li>
                    <li><a href="https://courseweb.sliit.lk/course/view.php?id=18&section=5&singlesec=5">2021</a></li>
                    <li><a href="https://courseweb.sliit.lk/course/view.php?id=18&section=5&singlesec=5">2020</a></li>
                </ul>
            </div>
        </section>
        
        <aside class="recommended" onclick="toggleDetails('resources')">
            <h2>Recommended Resources</h2>
            <ul id="resources">
                <li><a href="https://ieeexplore.ieee.org/">IEEE</a></li>
                <li><a href="https://library.sliit.lk/pages/databases">DataBases</a></li>
                <li><a href="https://github.com/">GitHub Resorces</a></li>
                <li><a href="https://library.sliit.lk/pages/turnitin">Turnitin</a></li>
                <li><a href="https://www.jetbrains.com/">MJetBrains IDEs</a></li>
                <li><a href="autodesk.com">AutoDesk</a></li>
                <li><a href="https://aws.amazon.com/">AWS Educate</a></li>
            </ul>
        </aside>
    </main>

    <script>
        function toggleDetails(id) {
            var section = document.getElementById(id);
            if (section.style.display === "none" || section.style.display === "") {
                section.style.display = "block";
            } else {
                section.style.display = "none";
            }
        }
    </script>
</body>
</html>

<%@ include file="../partials/footer.jsp"%>