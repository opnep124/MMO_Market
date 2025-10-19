<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - MMO System</title>
</head>
<body>
<h2>Login</h2>
<form method="post" action="LoginServlet">
    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Login">
</form>

<% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
</body>
</html>
