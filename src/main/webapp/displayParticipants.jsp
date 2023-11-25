<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import ="com.jdbc.conn.Dbconnection" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 80vh;
      background-color: #d9ddf0;
    }

    .styled-table {
      border-collapse: collapse;
      margin: 25px 0;
      font-size: 0.9em;
      font-family: sans-serif;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
      width: 80%;
    }

    .styled-table thead tr {
      background-color: #009879;
      color: #ffffff;
      text-align: left;
    }

    .styled-table th,
    .styled-table td {
      padding: 12px 15px;
      white-space: nowrap; /* Prevent text wrapping */
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

    @media (max-width: 768px) {
      /* Adjust styles for smaller screens */
      .styled-table {
        font-size: 0.8em;
      }
      .styled-table th,
      .styled-table td {
        padding: 10px;
      }
    }
  </style>
  <title>Participator Data</title>
</head>
<body>
<table class="styled-table">
  <thead>
  <tr>
    <th>Id</th>
    <th>Name</th>
    <th>Votes Count</th>
    <th>Competition name</th>

  </tr>
  </thead>
  <%
    try{
     Connection con = Dbconnection.getConnection();
      System.out.println("connected");

      Statement st= con.createStatement();
      ResultSet rs= st.executeQuery("select * from participants");
      //PrintWriter pw = response.getWriter();

      while(rs.next()){
  %>
  <tr>
    <td><b><% out.println(rs.getString("ID")); %></b></td>
    <td><b><% out.println(rs.getString("Name")); %></b></td>
    <td><b><% out.println(rs.getString("VoteCount")); %></b></td>
    <td><b><% out.println(rs.getString("CompetitionName")); %></b></td>


  </tr>
  <%     }
  }
  catch (Exception e){
    e.printStackTrace();
  }
  %>
  <tbody>

  <!-- and so on... -->
  </tbody>
</table>
</body>
</html>
