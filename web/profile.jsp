<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User user = (User) request.getAttribute("user");
    if (user == null) { out.println("<p>User not found!</p>"); return; }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MMO Market - Profile</title>
<style>
body { font-family: Arial, sans-serif; margin:0; padding:0; }
.container { max-width:600px; margin:30px auto; padding:20px; border:1px solid #ccc; border-radius:8px; background:#f9f9f9; }
input { width:100%; padding:8px; margin:8px 0; box-sizing:border-box; }
input[readonly] { background:#e9ecef; }
button { padding:10px 15px; margin-top:10px; cursor:pointer; background:#28a745; color:white; border:none; border-radius:5px; }
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container">
    <h2>Thông tin cá nhân</h2>
    <form method="post" action="ProfileServlet" id="profileForm">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">

        <label>Họ và tên:</label>
        <input type="text" name="name" value="<%= user.getName() %>" readonly required>

        <label>Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" readonly>

        <label>Số Điện Thoại:</label>
        <input type="text" name="phone" value="<%= user.getPhone() %>" readonly>
        <div id="phoneError" style="color:red; font-size:0.9em; margin-top:4px;"></div>


        <button type="button" id="editBtn">Chỉnh sửa</button>
        <button type="submit" id="saveBtn" style="display:none;">Lưu Thay Đổi</button>
    </form>
</div>

<script>
const editBtn = document.getElementById('editBtn');
const saveBtn = document.getElementById('saveBtn');
const formInputs = document.querySelectorAll('#profileForm input');

// bật chỉnh sửa các field khi nhấn "Chỉnh sửa"
editBtn.onclick = function() {
    // bật readonly = false cho các input ngoại trừ email
    formInputs.forEach(input => {
        if(input.name !== 'email' && input.name !== 'userId') {
            input.removeAttribute('readonly');
        }
    });

    // ẩn nút chỉnh sửa, hiện nút lưu
    editBtn.style.display = 'none';
    saveBtn.style.display = 'inline-block';
};

// Validate số điện thoại
const form = document.getElementById('profileForm');
const phoneErrorDiv = document.getElementById('phoneError');

form.addEventListener('submit', function(event) {
    const phoneInput = form.querySelector('input[name="phone"]');
    const phone = phoneInput.value.trim();

    const phoneRegex = /^0\d{8,9}$/;

    if (!phoneRegex.test(phone)) {
        phoneErrorDiv.textContent = 'Số điện thoại không hợp lệ! Vui lòng nhập 9-10 chữ số và bắt đầu bằng số 0.';
        phoneInput.focus();
        event.preventDefault(); // ngăn form submit
    } else {
        phoneErrorDiv.textContent = ''; // xóa thông báo nếu hợp lệ
    }
});

</script>


<jsp:include page="footer.jsp" />

</body>
</html>
