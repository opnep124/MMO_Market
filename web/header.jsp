<%@ page import="java.text.DecimalFormat" %>
<header style="display:flex; justify-content:space-between; align-items:center; padding:15px 30px; background-color:#1e1e2f; color:white;">
    <a href="HomeServlet" style="font-size:24px; font-weight:bold; color:white; text-decoration:none;">MMO Market</a>
    
    <div class="user-menu" style="position:relative; cursor:pointer; display:flex; align-items:center;">
        <% 
            Object balanceObj = session.getAttribute("userBalance");
            long balance = 0;
            if (balanceObj != null) {
                balance = ((java.math.BigDecimal) balanceObj).longValue();
            }
            DecimalFormat df = new DecimalFormat("#,###");
        %>
        <span style="margin-right:10px; font-weight:bold;">
            <%= df.format(balance) %> VND
        </span>

        <img src="https://taphoammo.net/images/avatars/user.svg" alt="Avatar" 
             style="width:40px; height:40px; border-radius:50%;" id="avatarBtn">

        <div class="dropdown" id="userDropdown" 
             style="display:none; position:absolute; right:0; top:50px; background:#fff; color:#000; min-width:150px; border-radius:5px; box-shadow:0 2px 5px rgba(0,0,0,0.3);">
            <a href="ProfileServlet">Thông tin cá nhân</a>
            <a href="LogoutServlet">Logout</a>
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
