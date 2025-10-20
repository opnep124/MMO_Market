<%@ page import="java.text.DecimalFormat" %>
<header style="display:flex; justify-content:space-between; align-items:center; padding:15px 30px; background-color:#1e1e2f; color:white;">
    <!-- Logo -->
    <a href="HomeServlet" style="font-size:24px; font-weight:bold; color:white; text-decoration:none;">MMO Market</a>
    
    <!-- Menu chính (gi?a) -->
    <nav style="display:flex; gap:20px; font-weight:bold; font-size:16px;">
        <a href="ProductsServlet" style="color:white; text-decoration:none;">San pham</a>
        <a href="ServicesServlet" style="color:white; text-decoration:none;">Dich vu</a>
        <a href="TopupServlet" style="color:white; text-decoration:none;">Nap tien</a>
        <a href="SupportServlet" style="color:white; text-decoration:none;">Ho tro</a>
    </nav>

    <!-- Thông tin ng??i dùng -->
    <div class="user-menu" style="position:relative; cursor:pointer; display:flex; align-items:center; gap:10px;">
        <% 
            Object balanceObj = session.getAttribute("userBalance");
            long balance = 0;
            if (balanceObj != null) {
                balance = ((java.math.BigDecimal) balanceObj).longValue();
            }
            DecimalFormat df = new DecimalFormat("#,###");
        %>
        <span style="font-weight:bold;">
            <%= df.format(balance) %> VND
        </span>

        <img src="https://taphoammo.net/images/avatars/user.svg" alt="Avatar" 
             style="width:40px; height:40px; border-radius:50%;" id="avatarBtn">

        <div class="dropdown" id="userDropdown" 
             style="display:none; position:absolute; right:0; top:50px; background:#fff; color:#000; min-width:150px; border-radius:5px; box-shadow:0 2px 5px rgba(0,0,0,0.3);">
            <a href="ProfileServlet" style="display:block; padding:10px; text-decoration:none; color:#000;">Thông tin cá nhân</a>
            <a href="LogoutServlet" style="display:block; padding:10px; text-decoration:none; color:#000;">Logout</a>
        </div>
    </div>
</header>

<script>
const avatarBtn = document.getElementById("avatarBtn");
const userDropdown = document.getElementById("userDropdown");

avatarBtn.onclick = () => {
    userDropdown.style.display = userDropdown.style.display==='block'?'none':'block';
}

window.onclick = (event) => {
    if(event.target !== avatarBtn && !avatarBtn.contains(event.target) && !userDropdown.contains(event.target)){
        userDropdown.style.display='none';
    }
}
</script>
