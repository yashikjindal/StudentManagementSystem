<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.example.DBConnection"%>
<%
    HttpSession sess = request.getSession(false);
    if(sess == null || sess.getAttribute("userEmail") == null) {
        response.sendRedirect("login.html");
        return;
    }

    // एडिट/अपडेट लॉजिक के लिए पुराने डेटा को निकालना
    String editId = request.getParameter("editId");
    String extName = "", editRoll = "", editCourse = "";
    if (editId != null) {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id=?");
            ps.setInt(1, Integer.parseInt(editId));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                extName = rs.getString("name");
                editRoll = rs.getString("rollno");
                editCourse = rs.getString("course");
            }
            con.close();
        } catch(Exception e) { e.printStackTrace(); }
    }

    // सर्च क्वेरी को पकड़ना
    String searchKeyword = request.getParameter("searchQuery");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
</head>
<body style="font-family: Arial; margin: 40px;">
    <h2>Welcome, <%= sess.getAttribute("userEmail") %> | <a href="LogoutServlet">Logout</a></h2>
    
    <% if (editId != null) { %>
        <h3>Update Student Record</h3>
        <form action="StudentCRUDServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= editId %>">
            Name: <input type="text" name="name" value="<%= extName %>" required> 
            Roll No: <input type="text" name="rollno" value="<%= editRoll %>" required> 
            Course: <input type="text" name="course" value="<%= editCourse %>" required> 
            <input type="submit" value="Update Student">
            <a href="student.jsp">Cancel</a>
        </form>
    <% } else { %>
        <h3>Add New Student</h3>
        <form action="AddStudentServlet" method="post">
            Name: <input type="text" name="name" required> 
            Roll No: <input type="text" name="rollno" required> 
            Course: <input type="text" name="course" required> 
            <input type="submit" value="Add Student">
        </form>
    <% } %>
    
    <br><hr><br>
    
    <h3>Registered Students List</h3>
    
    <!-- सर्च बार (Search Bar) -->
    <form action="student.jsp" method="get">
        <input type="text" name="searchQuery" placeholder="Search by name or roll no..." value="<%= (searchKeyword != null) ? searchKeyword : "" %>">
        <input type="submit" value="Search">
        <a href="student.jsp">Clear</a>
    </form>
    <br>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Roll No</th>
            <th>Course</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps;
                
                // अगर सर्च बॉक्स में कुछ टाइप किया है तो फ़िल्टर करो, नहीं तो पूरा डेटा दिखाओ
                if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                    ps = con.prepareStatement("SELECT * FROM students WHERE name LIKE ? OR rollno LIKE ?");
                    ps.setString(1, "%" + searchKeyword + "%");
                    ps.setString(2, "%" + searchKeyword + "%");
                } else {
                    ps = con.prepareStatement("SELECT * FROM students");
                }
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    int id = rs.getInt("id");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("rollno") %></td>
            <td><%= rs.getString("course") %></td>
            <td>
                <a href="student.jsp?editId=<%= id %>">Edit</a> | 
                <a href="StudentCRUDServlet?action=delete&id=<%= id %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='5'>Error loading data: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
