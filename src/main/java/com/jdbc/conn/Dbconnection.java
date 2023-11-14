package com.jdbc.conn;

import jakarta.servlet.http.HttpServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Dbconnection {
    public static Connection getConnection() throws SQLException ,ClassNotFoundException{
        // Your database connection details
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/voting";
        String username = "root";
        String password = "root";

        // Establish the database connection
        return DriverManager.getConnection(url, username, password);
    }
    public static Connection getConnectionAdmin() throws SQLException ,ClassNotFoundException{
        // Your database connection details
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/admin";
        String username = "root";
        String password = "root";

        // Establish the database connection
        return DriverManager.getConnection(url, username, password);
    }
}
