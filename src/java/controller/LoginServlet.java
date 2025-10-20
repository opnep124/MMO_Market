package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private static final int COOKIE_MAX_AGE = 7 * 24 * 60 * 60; // 7 ngày

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember"); // checkbox

        User user = userDAO.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            // tạo session
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("username", user.getLogin());
            session.setAttribute("roleId", user.getRoleId());

            // xử lý cookie ghi nhớ
            if ("on".equals(rememberMe)) {
                Cookie cookie = new Cookie("userId", String.valueOf(user.getUserId()));
                cookie.setMaxAge(COOKIE_MAX_AGE);
                cookie.setPath("/"); // áp dụng cho toàn bộ site
                response.addCookie(cookie);
            }

            response.sendRedirect("HomeServlet");
        } else {
            request.setAttribute("errorMessage", "Đăng nhập thất bại! Email hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userId") != null) {
            response.sendRedirect("HomeServlet");
            return;
        }

        // Kiểm tra cookie để auto login
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("userId".equals(c.getName())) {
                    try {
                        int userId = Integer.parseInt(c.getValue());
                        User user = userDAO.getUserById(userId);
                        if (user != null) {
                            session = request.getSession();
                            session.setAttribute("userId", user.getUserId());
                            session.setAttribute("username", user.getLogin());
                            session.setAttribute("roleId", user.getRoleId());
                            response.sendRedirect("HomeServlet");
                            return;
                        }
                    } catch (NumberFormatException e) { }
                }
            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
