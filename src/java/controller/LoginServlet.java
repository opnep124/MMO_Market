package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("username", user.getLogin());
            session.setAttribute("roleId", user.getRoleId());
            response.sendRedirect("ProfileServlet");
        } else {
            request.setAttribute("errorMessage", "Login failed! Email or password incorrect.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
