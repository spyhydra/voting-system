package com.example.login;

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
import com.jdbc.conn.Dbconnection;

@WebServlet(name = "vote",value = "/Voting" )

public class Voting extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get the participant ID from the form
        String participantId=req.getParameter("id");
        System.out.println(participantId);
        PrintWriter out = res.getWriter();

        // Check if the user has already voted
        HttpSession session = req.getSession(false);
        if (session.getAttribute("voted") != null) {
            out.println("<h2>You have already voted!</h2>");
        } else {
            // Update the votes in the database
            updateVotes(Integer.parseInt(participantId));

//            // Set a session attribute to mark that the user has voted
            session.setAttribute("voted", true);

            out.println("<h2>Thank you for voting!</h2>");
        }

        out.close();
    }
    private void updateVotes(int participantId) {
        try {
            // JDBC code to update votes in the database
            Connection con = Dbconnection.getConnection();

            // Update votes for the selected participant
            String query = "UPDATE participants SET VoteCount = VoteCount + 1 WHERE id = ?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setInt(1, participantId);
                pst.executeUpdate();
            }

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }




}

