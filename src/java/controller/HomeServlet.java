package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class HomeServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        User user = userDAO.getUserById(userId);

        if (user != null) {
            request.setAttribute("userName", user.getName());
            request.setAttribute("userEmail", user.getEmail());
            request.setAttribute("userPhone", user.getPhone());
            request.setAttribute("userBalance", user.getAccountBalance());
        }

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
