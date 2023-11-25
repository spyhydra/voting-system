<%--
  Created by IntelliJ IDEA.
  User: cheta
  Date: 18-11-2023
  Time: 08:44 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body>
<style>
  .styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  }
  .styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
  }
  .styled-table th,
  .styled-table td {
    padding: 12px 15px;
  }
  .styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
  }

  .styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
  }

  .styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
  }
  .styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
  }
</style>

<h1 style="background-color: red;">Hello World!</h1>
<p>This is a paragraph.</p>

<table class="styled-table">
  <thead>
  <tr>
    <th>Name</th>
    <th>Points</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>Dom</td>
    <td>6000</td>
  </tr>
  <tr class="active-row">
    <td>Melissa</td>
    <td>5150</td>
  </tr>
  <!-- and so on... -->
  </tbody>
</table>
</body>
</html>
