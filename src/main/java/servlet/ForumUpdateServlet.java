package servlet;

import java.io.IOException;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ForumPostModel;
import services.ForumController;

@WebServlet("/Shamal/ForumUpdateServlet")
public class ForumUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int postId = Integer.parseInt(request.getParameter("post_id"));
            String studentId = request.getParameter("student_id");
            String fullname = request.getParameter("fullname");
            String department = request.getParameter("department");
            String course = request.getParameter("course");
            String postTitle = request.getParameter("post_title");
            String postCategory = request.getParameter("post_category");
            String postContent = request.getParameter("post_content");
            String postDate = request.getParameter("post_date");
            String contactEmail = request.getParameter("contact_email");
            
            System.out.println("Updating post ID: " + postId);
            
            // Validate student_id format (2 letters followed by 8 digits)
            if (!studentId.matches("^[a-zA-Z]{2}\\d{8}$")) {
                response.sendRedirect(request.getContextPath() + "/Shamal/forum_edit.jsp?id=" + postId + "&error=invalid_student_id");
                return;
            }

            // Validate post date is not in the future
            try {
                LocalDate inputDate = LocalDate.parse(postDate);
                LocalDate currentDate = LocalDate.now();
                
                if (inputDate.isAfter(currentDate)) {
                    response.sendRedirect(request.getContextPath() + "/Shamal/forum_edit.jsp?id=" + postId + "&error=future_date");
                    return;
                }
            } catch (DateTimeParseException e) {
                response.sendRedirect(request.getContextPath() + "/Shamal/forum_edit.jsp?id=" + postId + "&error=invalid_date");
                return;
            }
            
            ForumPostModel post = new ForumPostModel();
            post.setPostId(postId);
            post.setStudentId(studentId);
            post.setFullname(fullname);
            post.setDepartment(department);
            post.setCourse(course);
            post.setPostTitle(postTitle);
            post.setPostCategory(postCategory);
            post.setPostContent(postContent);
            post.setPostDate(postDate);
            post.setContactEmail(contactEmail);
            
            boolean isSuccess = ForumController.updatePost(post);
            
            if (isSuccess) {
                response.sendRedirect(request.getContextPath() + "/Shamal/ForumReadServlet?update=success");
            } else {
                response.sendRedirect(request.getContextPath() + "/Shamal/forum_edit.jsp?id=" + postId + "&error=update_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Shamal/forum.jsp?error=update_error");
        }
    }
}