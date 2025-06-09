package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ForumPostModel;
import model.Student;
import services.ForumController;

@WebServlet("/ForumEditServlet")
public class ForumEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Authorization check
        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;
        
        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        // Get post and verify ownership
        int postId = Integer.parseInt(request.getParameter("postId"));
        ForumPostModel post = null;
        try {
            post = ForumController.getPostById(postId);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving post");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        
        if (post == null || !post.getStudentId().equals(student.getStdid())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You can only edit your own posts");
            return;
        }
        
        request.setAttribute("post", post);
        request.getRequestDispatcher("/Shamal/editPost.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Authorization check
        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;
        
        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        // Get post ID from form
        int postId = Integer.parseInt(request.getParameter("postId"));
        
        // Verify post exists and belongs to current user
        ForumPostModel existingPost = null;
        try {
            existingPost = ForumController.getPostById(postId);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving post");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        
        if (existingPost == null || !existingPost.getStudentId().equals(student.getStdid())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You can only edit your own posts");
            return;
        }
        
        // Get updated values from form
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String content = request.getParameter("content");
        
        // Create updated post object
        ForumPostModel updatedPost = new ForumPostModel();
        updatedPost.setPostId(postId);
        updatedPost.setStudentId(student.getStdid());
        updatedPost.setFullname(existingPost.getFullname());
        updatedPost.setDepartment(existingPost.getDepartment());
        updatedPost.setCourse(existingPost.getCourse());
        updatedPost.setPostTitle(title);
        updatedPost.setPostCategory(category);
        updatedPost.setPostContent(content);
        updatedPost.setPostDate(existingPost.getPostDate());
        updatedPost.setContactEmail(existingPost.getContactEmail());
        
        // Update post in database
        boolean success = false;
        try {
            success = ForumController.updatePost(updatedPost);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating post");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/ForumReadServlet?postId=" + postId + "&update=success");
        } else {
            request.setAttribute("errorMessage", "Failed to update post");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}