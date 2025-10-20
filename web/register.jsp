<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO, model.User" %>
<%@ page import="java.security.MessageDigest, java.math.BigInteger" %>
<%
    // Giá trị mặc định của form
    String loginVal="", nameVal="", emailVal="", phoneVal="", passwordVal="", confirmPasswordVal="";
    // Thông báo lỗi từng field
    String loginErr="", nameErr="", emailErr="", passwordErr="", confirmErr="", generalMsg="";

  if(request.getMethod().equalsIgnoreCase("POST")){
        loginVal = request.getParameter("login");
        nameVal = request.getParameter("name");
        emailVal = request.getParameter("email");
        phoneVal = request.getParameter("phone");
        passwordVal = request.getParameter("password");
        confirmPasswordVal = request.getParameter("confirmPassword");

        boolean hasError = false;

        // Validate Login
        if(loginVal == null || loginVal.trim().isEmpty()){
            loginErr = "Login không được để trống!";
            loginVal = "";
            hasError = true;
        } else {
            UserDAO dao = new UserDAO();
            if(dao.getUserByLogin(loginVal) != null){  // kiểm tra login trùng
                loginErr = "Login đã tồn tại!";
                loginVal = "";
                hasError = true;
            }
        }

        // Validate Name
        if(nameVal == null || nameVal.trim().isEmpty()){
            nameErr = "Họ & Tên không được để trống!";
            nameVal = "";
            hasError = true;
        }

        // Validate Email
        if(emailVal == null || !emailVal.matches("^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$")){
            emailErr = "Email không hợp lệ!";
            emailVal = "";
            hasError = true;
        } else {
            UserDAO dao = new UserDAO();
            if(dao.getUserByEmail(emailVal)!=null){
                emailErr = "Email đã tồn tại!";
                emailVal = "";
                hasError = true;
            }
        }

        // Validate Password
        if(passwordVal == null || passwordVal.isEmpty()){
            passwordErr = "Mật khẩu không được để trống!";
            passwordVal = "";
            hasError = true;
        }

        // Validate Confirm Password
        if(!passwordVal.equals(confirmPasswordVal)){
            confirmErr = "Mật khẩu không khớp!";
            confirmPasswordVal = "";
            hasError = true;
        }

        // Nếu không có lỗi, insert user
        if(!hasError){
            String hashedPassword="";
            try{
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(passwordVal.getBytes());
                byte[] digest = md.digest();
                hashedPassword = String.format("%064x", new BigInteger(1,digest));
            }catch(Exception e){ e.printStackTrace(); }

            User u = new User();
            u.setLogin(loginVal);
            u.setName(nameVal);
            u.setEmail(emailVal);
            u.setPhone(phoneVal);
            u.setPassword(hashedPassword);
            u.setRoleId(3);
            u.setAccountBalance(new java.math.BigDecimal("0.00"));
            u.setFlag(true);

            UserDAO dao = new UserDAO();
            boolean success = dao.insertUser(u);
            if(success){
                generalMsg = "Đăng ký thành công! <a href='login.jsp'>Đăng nhập tại đây</a>";
                loginVal = nameVal = emailVal = phoneVal = passwordVal = confirmPasswordVal = "";
            } else {
                generalMsg = "Đăng ký thất bại!";
            }
        }
    }
%>
<!DOCTYPE html>
<html class="no-js" lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MMO Market - Đăng ký</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome-all.min.css">
<link rel="stylesheet" href="style.css">
<style>
.togglePassword{ position:absolute; right:10px; top:50%; transform:translateY(-50%); cursor:pointer; color:#999; }
.errorMsg{ color:red; font-size:0.9em; margin-top:3px; }
</style>
</head>
<body id="sherah-dark-light">

<section class="sherah-wc sherah-wc__full sherah-bg-cover" style="background-image: url('img/credential-bg.svg');">
<div class="container-fluid p-0">
<div class="row g-0">

    <!-- Trái -->
    <div class="col-lg-6 col-md-6 col-12 sherah-wc-col-one">
        <div class="sherah-wc__inner" style="background-image: url('img/welcome-bg.png');">
            <div class="sherah-wc__logo">
                <a href="HomeServlet" style="color:#fff; font-size:28px; font-weight:bold; text-decoration:none;">MMO Market</a>
            </div>
            <div class="sherah-wc__middle">
                <a href="HomeServlet"><img src="img/welcome-vector.png" alt="#"></a>
            </div>
            <h2 class="sherah-wc__title">Chào mừng đến MMO Market <br> Đăng ký tài khoản</h2>
        </div>
    </div>

    <!-- Phải -->
    <div class="col-lg-6 col-md-6 col-12 sherah-wc-col-two">
        <div class="sherah-wc__form">
            <div class="sherah-wc__form-inner">
                <h3 class="sherah-wc__form-title sherah-wc__form-title__one">Tạo tài khoản mới</h3>

                <div style="color:green; text-align:center;"><%= generalMsg %></div>

                <form class="sherah-wc__form-main p-0" action="register.jsp" method="post">

                    <div class="form-group">
                        <label class="sherah-wc__form-label">Login *</label>
                        <div class="form-group__input">
                            <input class="sherah-wc__form-input" type="text" name="login" value="<%= loginVal %>" required>
                            <div class="errorMsg"><%= loginErr %></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="sherah-wc__form-label">Họ & Tên *</label>
                        <div class="form-group__input">
                            <input class="sherah-wc__form-input" type="text" name="name" value="<%= nameVal %>" required>
                            <div class="errorMsg"><%= nameErr %></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="sherah-wc__form-label">Email *</label>
                        <div class="form-group__input">
                            <input class="sherah-wc__form-input" type="email" name="email" value="<%= emailVal %>"
                                   required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                   title="Email không hợp lệ">
                            <div class="errorMsg"><%= emailErr %></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="sherah-wc__form-label">Số điện thoại</label>
                        <div class="form-group__input">
                            <input class="sherah-wc__form-input" type="text" name="phone" value="<%= phoneVal %>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="sherah-wc__form-label">Mật khẩu *</label>
                        <div class="form-group__input" style="position:relative;">
                            <input class="sherah-wc__form-input" type="password" id="password-field" name="password" value="<%= passwordVal %>" required>
                            <span class="fa fa-eye togglePassword" data-target="password-field"></span>
                            <div class="errorMsg"><%= passwordErr %></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="sherah-wc__form-label">Xác nhận mật khẩu *</label>
                        <div class="form-group__input" style="position:relative;">
                            <input class="sherah-wc__form-input" type="password" id="confirm-password-field" name="confirmPassword" value="<%= confirmPasswordVal %>" required>
                            <span class="fa fa-eye togglePassword" data-target="confirm-password-field"></span>
                            <div class="errorMsg"><%= confirmErr %></div>
                        </div>
                    </div>

                    <div class="form-group form-mg-top25">
                        <div class="sherah-wc__button sherah-wc__button--bottom">
                            <button class="ntfmax-wc__btn" type="submit">Đăng ký</button>
                        </div>
                    </div>

                    <div class="form-group mg-top-20">
                        <div class="sherah-wc__bottom">
                            <p class="sherah-wc__text">Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>

</div>
</div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

<script>
const toggleButtons = document.querySelectorAll(".togglePassword");
toggleButtons.forEach(btn=>{
    btn.addEventListener("click", function(){
        const targetId = this.getAttribute("data-target");
        const field = document.getElementById(targetId);
        const type = field.getAttribute("type")==="password"?"text":"password";
        field.setAttribute("type", type);
        this.classList.toggle("fa-eye-slash");
    });
});
</script>

</body>
</html>
