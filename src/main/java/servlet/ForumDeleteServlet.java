package servlet;
import model.ForumPostModel;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Student;
import services.ForumController;

@WebServlet("/ForumDeleteServlet")
public class ForumDeleteServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int postId = Integer.parseInt(request.getParameter("postId"));
        ForumPostModel post = null;
		try {
			post = ForumController.getPostById(postId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if (post == null || !post.getStudentId().equals(student.getStdid())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        
        boolean success = false;
		try {
			success = ForumController.deletePost(postId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("ForumReadServlet?" + (success ? "delete=success" : "error=delete_failed"));
    }
}