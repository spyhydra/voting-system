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
<% String name= (String)session.getAttribute("name"); %>
<h1> profile page </h1>
<h3> welcome <%=name%> </h3>
<br>
<a href="about.jsp">about</a>
<br>
<a href="profile.jsp">title</a>
</body>
</html>
