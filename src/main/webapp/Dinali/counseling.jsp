<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counseling Services - Online Help Desk</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Online Help Desk</h1>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="forum.html">Forum</a></li>
                <li><a href="materials.html">Study Materials</a></li>
                <li><a href="videos.html">Videos</a></li>
                <li><a href="tickets.html">Support Tickets</a></li>
                <li><a href="announcements.html">Live Announcements</a></li>
                <li><a href="contact.html">Contact us</a></li>
                <li><a href="faq.html">FAQ</a></li>
                <li><a href="counseling.html">Counseling Services</a></li>
            </ul>
        </nav>
    </header>

    <section class="counseling-info">
        <h2>Student Counseling Services</h2>
        <p>We understand that academic life can be stressful. If you're feeling overwhelmed, we're here to help. Our counseling services are available to support you through any personal or academic challenges.</p>
        
        <h3>How We Can Help</h3>
        <ul>
            <li>One-on-one counseling sessions with licensed professionals</li>
            <li>Workshops on stress management, time management, and mental health</li>
            <li>Resources for coping with academic pressure and personal stress</li>
        </ul>

        <h3>Book a Session</h3>
        <form action="bookSession.php" method="POST">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <label for="time">Preferred Session Time:</label>
            <input type="datetime-local" id="time" name="time" required><br><br>

            <label for="message">Tell Us About Your Concerns:</label><br>
            <textarea id="message" name="message" rows="5" required></textarea><br><br>

            <button type="submit">Book Session</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2025 Online Help Desk | All rights reserved.</p>
    </footer>
</body>
</html>
