<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MMO Market - Home</title>
</head>
<body>

<jsp:include page="header.jsp" />

<section>
    <h1>Welcome, <%= request.getAttribute("userName") %>!</h1>

</section>

<!-- Popup View Profile -->
<div id="profileModal" style="display:none;">
    <div>
        <span onclick="document.getElementById('profileModal').style.display='none'">&times;</span>
        <h2>Thông tin cá nhân</h2>
        <form method="post" action="ProfileServlet">
            <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
            <label>Name:</label>
            <input type="text" name="name" value="<%= request.getAttribute("userName") %>" readonly>
            <label>Email:</label>
            <input type="email" name="email" value="<%= request.getAttribute("userEmail") %>" readonly>
            <label>Phone:</label>
            <input type="text" name="phone" value="<%= request.getAttribute("userPhone") %>">
            <label>Balance:</label>
            <input type="text" name="balance" value="<%= request.getAttribute("userBalance") %>" readonly>
            <button type="submit">Update Phone</button>
        </form>
    </div>
</div>

<script>
    const modal = document.getElementById("profileModal");
    document.getElementById("btnProfile").onclick = () => modal.style.display='block';
    window.onclick = (event) => { if(event.target==modal) modal.style.display='none'; }
</script>

<jsp:include page="footer.jsp" />
</body>
</html>
