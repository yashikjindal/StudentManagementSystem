package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/StudentCRUDServlet")
public class StudentCRUDServlet extends HttpServlet {
    
    // GET Request: डिलीट ऑपरेशन के लिए
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        
        if ("delete".equals(action) && id != null) {
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("DELETE FROM students WHERE id=?");
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("student.jsp");
    }

    // POST Request: अपडेट (Edit) ऑपरेशन के लिए
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("update".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String rollno = request.getParameter("rollno");
            String course = request.getParameter("course");
            
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("UPDATE students SET name=?, rollno=?, course=? WHERE id=?");
                ps.setString(1, name);
                ps.setString(2, rollno);
                ps.setString(3, course);
                ps.setInt(4, Integer.parseInt(id));
                ps.executeUpdate();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("student.jsp");
    }
}
