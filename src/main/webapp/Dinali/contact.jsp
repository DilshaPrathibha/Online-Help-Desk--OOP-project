<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../partials/header.jsp"%>
    
    <div class="contact-container">
        <h2>We'd love to hear from you!</h2>
        <p>If you have any questions, comments, or need support, feel free to reach out to us using the form below.</p>

        <form action="submitContactForm.php" method="POST">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required placeholder="Your Full Name">
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Your Email Address">
            </div>

            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" required placeholder="Subject of your message">
            </div>

            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" required rows="5" placeholder="Your Message"></textarea>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>

   	<%@ include file="../partials/footer.jsp"%>
