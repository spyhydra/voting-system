<%--
  Created by IntelliJ IDEA.
  User: cheta
  Date: 07-11-2023
  Time: 11:15 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String email= (String)session.getAttribute("email"); %>
<h1> about us </h1>
<h3> welcome <%=email%> </h3>
<br>
<a href="profile.jsp">profile</a>
<br>
<a href="title.jsp">title</a>
</body>
</html>
