<%--
  Created by IntelliJ IDEA.
  User: cheta
  Date: 06-11-2023
  Time: 07:38 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<%

    String email= (String)session.getAttribute("email");
    if(email==null){
        response.sendRedirect("/login_war_exploded");
    }

%>
<h1> profile page </h1>
<h3> welcome <%=email%> </h3>
<br>
<a href="about.jsp">about</a>
<br>
<a href="title.jsp">title</a>
<br>
<a href="logout">Logout</a>
</body>
</html>
