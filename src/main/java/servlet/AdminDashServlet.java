package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String redirectPath = request.getContextPath() + "/Bupathi/login.jsp";

        if (session == null || session.getAttribute("admin") == null) {
            if (session != null) {
                session.setAttribute("redirectUrl", request.getRequestURI());
                session.setAttribute("error", "Please login as admin to view this page");
            }
            response.sendRedirect(redirectPath);
            return;
        }

        request.getRequestDispatcher("/Bupathi/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
