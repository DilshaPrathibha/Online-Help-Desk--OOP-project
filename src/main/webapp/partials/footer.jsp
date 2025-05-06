<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<footer style="background: #0077cc; color: white; padding: 40px 20px; margin-top: 20px;">
    <div style="display: flex; flex-wrap: wrap; justify-content: space-between; max-width: 1200px; margin: auto; gap: 30px; text-align: left;">

        <div style="flex: 1; min-width: 200px;">
            <a href="../Bupathi/index.jsp" class="footer-link" style="font-size: 22px; font-weight: 800; display: inline-block;">
    			<h3 class="footer-heading";">Online Help Desk</h3>
			</a>

            <p>Your trusted platform for academic support, counseling, and resolving issues quickly and effectively.</p>
        </div>

        <div style="flex: 1; min-width: 200px;">
            <h3 class="footer-heading">Explore</h3>
            <ul style="list-style: none; padding: 0;">
                <li><a href="${pageContext.request.contextPath}/index.jsp" class="footer-link"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="${pageContext.request.contextPath}/forum.jsp" class="footer-link"><i class="fas fa-comments"></i> Forum</a></li>
                <li><a href="${pageContext.request.contextPath}/faq.jsp" class="footer-link"><i class="fas fa-question-circle"></i> FAQ</a></li>
                <li><a href="${pageContext.request.contextPath}/contact.jsp" class="footer-link"><i class="fas fa-envelope"></i> Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp" class="footer-link"><i class="fas fa-sign-in-alt"></i> Login</a></li>
            </ul>
        </div>

        <div style="flex: 1; min-width: 200px;">
            <h3 class="footer-heading">Student Services</h3>
            <ul style="list-style: none; padding: 0;">
                <li><a href="${pageContext.request.contextPath}/counseling.jsp" class="footer-link"><i class="fas fa-user-friends"></i> Counseling Services</a></li>
                <li><a href="${pageContext.request.contextPath}/materials.jsp" class="footer-link"><i class="fas fa-book-open"></i> Study Materials</a></li>
                <li><a href="${pageContext.request.contextPath}/livechat.jsp" class="footer-link"><i class="fas fa-comments-dollar"></i> Live Chat</a></li>
                <li><a href="${pageContext.request.contextPath}/tickets.jsp" class="footer-link"><i class="fas fa-ticket-alt"></i> Ticketing</a></li>
            </ul>
        </div>

        <div style="flex: 1; min-width: 200px;">
            <h3 class="footer-heading">Connect with Us</h3>
            <div style="display: flex; gap: 15px; margin-top: 10px;">
                <a href="https://facebook.com" class="social-icon" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="https://twitter.com" class="social-icon" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="https://instagram.com" class="social-icon" target="_blank"><i class="fab fa-instagram"></i></a>
                <a href="https://linkedin.com" class="social-icon" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>

    <div style="text-align: center; margin-top: 30px; font-size: 14px;">
        <p>&copy; 2025 Online Help Desk | All rights reserved.</p>
    </div>
</footer>

<style>
    .footer-link {
        color: white;
        text-decoration: none;
        display: inline-block;
        margin-bottom: 8px;
        font-size: 14px;
        transition: color 0.3s ease;
    }

    .footer-link i {
        margin-right: 6px;
    }

    .footer-link:hover {
        color: #4CAF50;
    }

    .social-icon {
        color: white;
        font-size: 18px;
        transition: color 0.3s ease;
        text-decoration: none;
    }

    .social-icon:hover {
        color: #4CAF50;
    }

    .footer-heading {
        margin-bottom: 15px;
        font-size: 22px;
        font-weight: 800;
        position: relative;
        display: inline-block;
    }

    .footer-heading::after {
        content: '';
        display: block;
        width: 40px;
        height: 3px;
        background-color: #4CAF50;
        margin-top: 5px;
        border-radius: 2px;
    }

    @media (max-width: 768px) {
        footer div {
            flex-direction: column;
            text-align: center;
        }

        .social-icon {
            margin: 5px;
        }

        .footer-heading::after {
            margin-left: auto;
            margin-right: auto;
        }
    }
</style>
