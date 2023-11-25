<%--
  Created by IntelliJ IDEA.
  User: cheta
  Date: 15-11-2023
  Time: 10:02 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/admin.css">
  <title> CSS Login Screen Tutorial </title>
</head>
<body>
<body>
<div class="login-page">
  <div class="form">
    <div class="login">
      <div class="login-header">
        <h3>LOGIN</h3>
        <p>Please enter your credentials to login.</p>
      </div>
    </div>
    <form class="login-form" method="get" action="admin">
      <input type="text" placeholder="email" name="email"/>
      <input type="password" placeholder="password" name="password"/>
      <input type="submit" placeholder="submit">
      <p class="message">Login user? <a href="/login_war_exploded/login.jsp">Create an account</a></p>
    </form>
  </div>
</div>
</body>
</body>
</html>