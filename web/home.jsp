<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MMO Market - Home</title>
<style>
/* header */
header { display:flex; justify-content:space-between; align-items:center; padding:10px 20px; background:#007bff; color:white; }
header .logo { font-size:24px; font-weight:bold; }
header .user-menu { position:relative; cursor:pointer; }
header .user-menu img { width:40px; height:40px; border-radius:50%; vertical-align:middle; }
header .dropdown { display:none; position:absolute; right:0; top:50px; background:#fff; color:#000; min-width:150px; border-radius:5px; box-shadow:0 2px 5px rgba(0,0,0,0.3); }
header .dropdown a { display:block; padding:10px; text-decoration:none; color:#000; }
header .dropdown a:hover { background:#f1f1f1; }

/* content */
section { padding:30px; text-align:center; }
</style>
</head>
<body>

<header>
    <div class="logo">MMO Market</div>
    <div class="user-menu" id="userMenu">
        <img src="assets/img/avatar_default.png" alt="Avatar">
        <span><%= user.getName() %></span>
        <div class="dropdown" id="userDropdown">
            <a href="#" id="profileBtn">Thông tin cá nhân</a>
        </div>
    </div>
</header>

<section>
    <h1>Welcome, <%= user.getName() %>!</h1>
    <p>Manage your account, orders, and profile easily.</p>
</section>

<!-- profile modal -->
<div id="profileModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:1000;">
    <div style="background:#fff; margin:10% auto; padding:20px; width:400px; border-radius:8px; position:relative;">
        <span style="position:absolute; top:10px; right:15px; font-size:20px; cursor:pointer;" onclick="document.getElementById('profileModal').style.display='none'">&times;</span>
        <h2>Thông tin cá nhân</h2>
        <form action="ProfileServlet" method="post">
            <input type="hidden" name="userId" value="<%= user.getUserId() %>">
            <label>Name:</label>
            <input type="text" name="name" value="<%= user.getName() %>" required>
            <label>Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required>
            <label>Phone:</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>">
            <label>Balance:</label>
            <input type="text" name="balance" value="<%= user.getAccountBalance() %>" readonly>
            <div style="text-align:center; margin-top:15px;">
                <button type="submit" style="background:#28a745; color:white;">Save</button>
                <button type="button" style="background:#dc3545; color:white;" onclick="document.getElementById('profileModal').style.display='none'">Cancel</button>
            </div>
        </form>
    </div>
</div>

<script>
const userMenu = document.getElementById("userMenu");
const dropdown = document.getElementById("userDropdown");
const profileBtn = document.getElementById("profileBtn");
const profileModal = document.getElementById("profileModal");

userMenu.onclick = function() {
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
}
profileBtn.onclick = function() {
    dropdown.style.display = "none";
    profileModal.style.display = "block";
}
window.onclick = function(event) {
    if(event.target !== userMenu && !userMenu.contains(event.target)) {
        dropdown.style.display = "none";
    }
    if(event.target === profileModal) {
        profileModal.style.display = "none";
    }
}
</script>

</body>
</html>
