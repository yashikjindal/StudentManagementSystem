package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/TestDBServlet")
public class TestDBServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Connection con = DBConnection.getConnection();
            if (con != null && !con.isClosed()) {
                out.println("<h3 style='color:green;'>Database Connection Successful!</h3>");
                con.close();
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Database Connection Failed: " + e.getMessage() + "</h3>");
        }
    }
}
