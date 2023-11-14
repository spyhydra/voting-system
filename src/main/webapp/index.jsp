<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%

    String email= (String)session.getAttribute("email");

    if(email!=null){
        response.sendRedirect("/login_war_exploded/profile.jsp");
    }

%>
<h1><%= "singup  page" %>
</h1>
<br/>


<form action="signup" method="post">
    Name: <input type="text" name="name" required><br>
    Division: <input type="text" name="div"><br>
    Roll No: <input type="text" name="roll" required><br>
    Email: <input type="email" name="email" required><br>
    Phone No: <input type="tel" name="phone"><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Signup">
</form>

<a href="/login_war_exploded/login.jsp">Login here</a>
</body>
</html>