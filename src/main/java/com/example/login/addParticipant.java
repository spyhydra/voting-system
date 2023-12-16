package com.example.login;

import com.jdbc.conn.Dbconnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "addParticipant", value = "/addParticipant")
public class addParticipant extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String name = req.getParameter("name");
        String compi = req.getParameter("competition");

        PrintWriter out = res.getWriter();
        try {
            Connection con = Dbconnection.getConnection();
            System.out.println("Database connected successfully");
            PreparedStatement ps = con.prepareStatement("INSERT INTO participants (Name,CompetitionName) VALUES (?,?)");
            ps.setString(1, name);
            ps.setString(2, compi);

            int count = ps.executeUpdate();

            if (count > 0) {
                res.setContentType("text/html");
                out.println("<h3 style='color:green'> participator  successfully add</h3>");

                RequestDispatcher rd = req.getRequestDispatcher("/displayParticipants.jsp");
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
}
