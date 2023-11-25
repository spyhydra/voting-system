package com.example.login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    //we use delete session information from
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("enter in logout");
        HttpSession session= req.getSession();
        session.invalidate();
        // use request dispacher for the transfer user to login page
        RequestDispatcher rd= req.getRequestDispatcher("/index.jsp");
        rd.forward(req,res);


    }
}
