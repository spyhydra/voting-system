package com.example.login;
import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.*;

@WebServlet(name = "hello-bhi",urlPatterns = "/chetan")
public class annotation extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("url pattern successful");
    }

}
