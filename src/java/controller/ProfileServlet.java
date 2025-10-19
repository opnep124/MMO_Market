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
        // Giả sử đang xem profile của user_id=2 (có thể thay bằng session)
        int userId = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.getUserById(userId);
        request.setAttribute("user", user);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        BigDecimal balance = new BigDecimal(request.getParameter("balance"));

        User u = new User();
        u.setUserId(id);
        u.setName(name);
        u.setEmail(email);
        u.setPhone(phone);
        u.setAccountBalance(balance);

        userDAO.updateUser(u);
        response.sendRedirect("ProfileServlet?id=" + id);
    }
}
