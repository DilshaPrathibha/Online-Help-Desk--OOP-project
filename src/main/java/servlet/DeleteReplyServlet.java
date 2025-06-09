package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Student;
import services.ForumController;

@WebServlet("/DeleteReplyServlet")
public class DeleteReplyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;
        
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int replyId = Integer.parseInt(request.getParameter("replyId"));
        int postId = Integer.parseInt(request.getParameter("postId"));
        
        try {
            boolean success = ForumController.deleteReply(replyId);
            String redirect = "ForumReadServlet?postId=" + postId;
            response.sendRedirect(redirect + (success ? "&reply_delete=success" : "&error=delete_failed"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ForumReadServlet?postId=" + postId + "&error=server_error");
        }
    }
}