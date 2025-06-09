package servlet;


	
	

	import services.Studentservice;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.*;
	import java.io.IOException;

	@WebServlet("/deleteStudent")
	public class DeleteStudentServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        String stid = request.getParameter("stid");
	        if (stid != null && !stid.trim().isEmpty()) {
	            Studentservice service = new Studentservice();
	            boolean success = service.deleteStudentById(stid);

	            if (success) {
	                request.getSession().setAttribute("message", "Student deleted successfully.");
	            } else {
	                request.getSession().setAttribute("error", "Failed to delete student.");
	            }
	        }
	        
	        response.sendRedirect(request.getContextPath() + "/Bupathi/students.jsp");  // Adjust to your actual student list page
	    }
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        String stid = request.getParameter("stid");
	        if (stid != null && !stid.trim().isEmpty()) {
	            Studentservice service = new Studentservice();
	            boolean success = service.deleteStudentById(stid);

	            if (success) {
	                request.getSession().setAttribute("message", "Student deleted successfully.");
	            } else {
	                request.getSession().setAttribute("error", "Failed to delete student.");
	            }
	        }
	        
	        response.sendRedirect(request.getContextPath() + "/StudentList");  // Your student list page
	    }
	 }
	 
	
	



