package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.math.BigInteger;

public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private static final int COOKIE_MAX_AGE = 7 * 24 * 60 * 60; // 7 ngày

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember");

        User user = userDAO.getUserByEmail(email);

        if (user == null) {
            // Email không tồn tại → giữ mật khẩu, xóa email
            request.setAttribute("errorMessage", "Email không tồn tại!");
            request.setAttribute("passwordValue", password); // có thể giữ password
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Hash mật khẩu nhập vào
        String hashedInput = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            hashedInput = String.format("%064x", new BigInteger(1, digest));
        } catch(Exception e) {
            e.printStackTrace();
        }

        if (!user.getPassword().equals(hashedInput)) {
            // Sai mật khẩu → giữ email, xóa password
            request.setAttribute("errorMessage", "Mật khẩu không đúng!");
            request.setAttribute("emailValue", email);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Đăng nhập thành công
        HttpSession session = request.getSession();
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("username", user.getLogin());
        session.setAttribute("roleId", user.getRoleId());

        if ("on".equals(rememberMe)) {
            Cookie cookie = new Cookie("userId", String.valueOf(user.getUserId()));
            cookie.setMaxAge(COOKIE_MAX_AGE);
            cookie.setPath("/");
            response.addCookie(cookie);
        }

        response.sendRedirect("HomeServlet");
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
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
