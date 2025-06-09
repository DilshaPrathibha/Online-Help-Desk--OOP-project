package servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ForumPostModel;
import services.ForumController;

@WebServlet("/ForumReadServlet")
public class ForumReadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String search = request.getParameter("search");
        String category = request.getParameter("category");
        String department = request.getParameter("department");
        
        List<ForumPostModel> forumPosts = null;
        
        if (search != null || category != null || department != null) {
            try {
				forumPosts = ForumController.searchPosts(search, category, department);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else {
            try {
				forumPosts = ForumController.getAllPosts();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        
        request.setAttribute("forumPosts", forumPosts);
        request.setAttribute("searchKeyword", search);
        request.setAttribute("categoryFilter", category);
        request.setAttribute("departmentFilter", department);
        
        request.getRequestDispatcher("Shamal/forum.jsp").forward(request, response);
    }
}