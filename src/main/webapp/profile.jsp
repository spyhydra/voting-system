<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String email = (String) session.getAttribute("email");

    // Check if email or userIdObject is null
    if (email == null ) {
        response.sendRedirect("/login_war_exploded");
    }
%>
<h1> profile page </h1>
<h3> welcome <%= email %> </h3>
<h4><%= email %></h4>
<br>
<a href="about.jsp">about</a>
<br>
<a href="title.jsp">title</a>
<br>
<a href="logout">Logout</a>

</body>
</html>
