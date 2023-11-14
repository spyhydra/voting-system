package com.example.login;

import java.io.*;
import java.sql.Connection;

import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.jdbc.conn.Dbconnection;


@WebServlet(name = "helloServlet", value = "/signup")
//@WebServlet(name = "helloServlet", value = {"/hello-servlet", "/login-servlet"})


public class HelloServlet extends HttpServlet {


    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        //Signup logic for me
        String name = req.getParameter("name");
        String div = req.getParameter("div");
        String roll = req.getParameter("roll");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");


        PrintWriter out = res.getWriter();

        try {
            Connection con = Dbconnection.getConnection();
            System.out.println("Database connected successfully");
            PreparedStatement ps = con.prepareStatement("INSERT INTO user (name, division, rollno, email, phone_no, password) VALUES (?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, div);
            ps.setString(3, roll);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, password);


            int count = ps.executeUpdate();

            if (count > 0) {
                res.setContentType("text/html");
                out.println("<h3 style='color:green'> user successfully register </h3>");

                RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                rd.include(req, res);

            } else {
                res.setContentType("text/html");
                out.println("<h3 style='color:green'> failed </h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
                rd.include(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void destroy() {
    }
}