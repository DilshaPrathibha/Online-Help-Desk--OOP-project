package servlet;

import java.io.IOException;


import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ForumReply;
import model.Student;
import services.ForumController;

@WebServlet("/ForumReplyServlet")
public class ForumReplyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        ForumReply reply = new ForumReply();
        reply.setPostId(Integer.parseInt(request.getParameter("postId")));
        reply.setStudentId(student.getStdid());
        reply.setFullname(student.getFullname());
        reply.setReplyContent(request.getParameter("replyContent"));
        reply.setReplyDate(new Date(System.currentTimeMillis()).toString());
        
        boolean success = false;
		try {
			success = ForumController.addReply(reply);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String redirect = "ForumReadServlet?postId=" + reply.getPostId();
        response.sendRedirect(redirect + (success ? "&reply=success" : "&error=reply_failed"));
    }
}