package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get the current session (don't create new if doesn't exist)
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // 2. Invalidate the session (clears all attributes)
            session.invalidate();
            System.out.println("User logged out successfully");
        }
        
        // 3. Redirect to login page
        response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Allow GET requests to also handle logout (common practice)
        doPost(request, response);
    }
}


