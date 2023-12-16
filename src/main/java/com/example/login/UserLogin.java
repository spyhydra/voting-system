package com.example.login;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.*;
import com.jdbc.conn.Dbconnection;
//
@WebServlet(name = "user",value = "/login" )
//@WebServlet(name = "Login", value = "/admin" )
public class UserLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("enter in login page");
        if (isValidUser(email, password, request)) {
            // Redirect to a success page
            response.sendRedirect("voting.jsp");
        } else {
            // Redirect to a failure page
            response.sendRedirect("about.jsp");
        }
    }

    private boolean isValidUser(String email, String password, HttpServletRequest request) {
        try {
            Connection conn = Dbconnection.getConnection();
            System.out.println("database connected login");

            String query = "SELECT user_id FROM user WHERE email=? AND password=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // If a row is returned, the user is valid
                int userId = resultSet.getInt("user_id");

                // Create a session and store the email and user_id attributes
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("user_id", userId);

                return true;
            } else {
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}