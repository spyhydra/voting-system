package com.example.login;

import com.jdbc.conn.Dbconnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "Login", value = "/admin")
public class Admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (isValidUser(email, password)) {
            // Create a session and store the email attribute
            HttpSession session = request.getSession();
            session.setAttribute("email", email);

            // Redirect to a success page
            response.sendRedirect("/login_war_exploded");
        } else {
            // Redirect to a failure

            response.setContentType("text/html");
            out.println("<h3 style='color:red'> invalid name and password </h3>");

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.include(request, response);
        }
    }

    private boolean isValidUser(String username, String password) {
        try {
            Connection conn = Dbconnection.getConnection();
            System.out.println("database connected login");
            String query = "SELECT * FROM admin WHERE username=? AND password=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next(); // If a row is returned, the user is valid
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}

