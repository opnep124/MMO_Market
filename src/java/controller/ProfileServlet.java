package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

public class ProfileServlet extends HttpServlet {
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

    if (user == null) {
        response.getWriter().println("User not found!");
        return;
    }

    request.setAttribute("user", user);
    request.getRequestDispatcher("profile.jsp").forward(request, response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id = (int) session.getAttribute("userId");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

        // Server-side validation số điện thoại
    if (phone == null || !phone.matches("^0\\d{9,10}$")) {
        request.setAttribute("errorMessage", "Số điện thoại không hợp lệ!");
        request.setAttribute("user", userDAO.getUserById(id));
        request.getRequestDispatcher("profile.jsp").forward(request, response);
        return;
    }
    
    User u = new User();
    u.setUserId(id);
    u.setName(name);
    u.setEmail(email);
    u.setPhone(phone);

    userDAO.updateUser(u);
    response.sendRedirect("ProfileServlet");
}

}
