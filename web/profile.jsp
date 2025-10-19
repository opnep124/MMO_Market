<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User user = (User) request.getAttribute("user");
    if (user == null) { out.println("<p style='color:red'>User not found!</p>"); return; }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MMO Market - Profile Popup</title>
    <style>
        body { font-family: Arial, sans-serif; margin:0; padding:0; }
        .welcome-container { text-align: center; margin-top: 50px; }
        .avatar-large { width: 150px; border-radius: 50%; }

        /* Modal styles */
        .modal { display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.5); }
        .modal-content { background-color: #fefefe; margin: 10% auto; padding: 20px; border-radius: 8px; width: 400px; position: relative; }
        .close { position: absolute; top: 10px; right: 15px; font-size: 24px; font-weight: bold; cursor: pointer; }
        input { width: 100%; padding: 8px; margin: 8px 0; box-sizing: border-box; }
        button { padding: 10px 15px; margin-top: 10px; cursor: pointer; }
    </style>
</head>
<body>

<div class="welcome-container">
    <img src="assets/img/avatar_default.png" class="avatar-large" alt="Avatar">
    <h2>Welcome back, <%= user.getName() %>!</h2>
    <p>Manage your personal information, account balance, and contact details easily.</p>
    <button id="btnProfile">View My Profile</button>
</div>

<!-- Modal -->
<div id="profileModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeModal">&times;</span>
        <h3>Edit Profile</h3>
        <form method="post" action="ProfileServlet">
            <input type="hidden" name="userId" value="<%= user.getUserId() %>">
            <label>Name:</label>
            <input type="text" name="name" value="<%= user.getName() %>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required>

            <label>Phone:</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>">

            <label>Balance:</label>
            <input type="text" name="balance" value="<%= user.getAccountBalance() %>" readonly>

            <button type="submit">Update Profile</button>
        </form>
    </div>
</div>

<script>
    const modal = document.getElementById("profileModal");
    const btn = document.getElementById("btnProfile");
    const span = document.getElementById("closeModal");

    btn.onclick = function() { modal.style.display = "block"; }
    span.onclick = function() { modal.style.display = "none"; }
    window.onclick = function(event) { if (event.target == modal) modal.style.display = "none"; }
</script>

</body>
</html>
