<!-- header.jsp -->
<header style="display:flex; justify-content:space-between; align-items:center; padding:15px 30px; background-color:#1e1e2f; color:white;">
    <a href="HomeServlet" style="font-size:24px; font-weight:bold; color:white; text-decoration:none;">MMO Market</a>
    <div>
        <button onclick="openProfileModal()">My Profile</button>
        <a href="LogoutServlet" style="margin-left:10px; color:white;">Logout</a>
    </div>
</header>

<script>
function openProfileModal() {
    document.getElementById('profileModal').style.display = 'block';
}
</script>
