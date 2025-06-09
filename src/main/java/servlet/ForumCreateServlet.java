package servlet;

import java.io.IOException;

import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ForumPostModel;
import model.Student;
import services.ForumController;

@WebServlet("/ForumCreateServlet")
public class ForumCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Show empty form for new post
    	
    	  HttpSession session = request.getSession(false);
    	    if (session == null || session.getAttribute("student") == null) {
    	        response.sendRedirect(request.getContextPath() + 
    	            "/Bupathi/login.jsp?redirect=" + request.getRequestURI());
    	        return;
    	    }
        request.getRequestDispatcher("/Shamal/forumCreate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        ForumPostModel post = new ForumPostModel();
        post.setStudentId(student.getStdid());
        post.setFullname(student.getFullname());
        post.setDepartment(request.getParameter("department"));
        post.setCourse(request.getParameter("course"));
        post.setPostTitle(request.getParameter("post_title"));
        post.setPostCategory(request.getParameter("post_category"));
        post.setPostContent(request.getParameter("post_content"));
        post.setPostDate(LocalDate.now().toString());
        post.setContactEmail(request.getParameter("contact_email"));
        
        boolean success = false;
		try {
			success = ForumController.createPost(post);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if (success) {
            response.sendRedirect("ForumReadServlet?create=success");
        } else {
            response.sendRedirect("forum.jsp?error=create_failed");
        }
    }
}