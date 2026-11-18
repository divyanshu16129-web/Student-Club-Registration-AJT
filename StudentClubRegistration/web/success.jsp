<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
    <style>
        body { font-family: 'Georgia', serif; background-color: #e9ecef; color: #333; padding: 40px; }
        .success-container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-top: 8px solid #28a745; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h1 { color: #28a745; text-align: center; }
        h3 { border-bottom: 1px solid #ccc; padding-bottom: 5px; color: #004b87; }
        .details-list { list-style: none; padding: 0; }
        .details-list li { margin-bottom: 10px; font-family: 'Arial', sans-serif; }
    </style>
</head>
<body>
<div class="success-container">
    <h1>Registration Successful!</h1>   
    <h3>Your Registration Details</h3>
    <ul class="details-list">
        <li><strong>GR No:</strong> <%= request.getParameter("gr_no") %></li>
        <li><strong>Name:</strong> <%= request.getParameter("name") %></li>
        <li><strong>Phone:</strong> <%= request.getParameter("phone") %></li>
        <li><strong>Email:</strong> <%= request.getParameter("email") %></li>
        <li><strong>Branch:</strong> <%= request.getParameter("branch") %></li>
        <li><strong>Semester:</strong> <%= request.getParameter("semester") %></li>
        <li><strong>Department:</strong> <%= request.getParameter("department") %></li>
    </ul>
    <h3>Your Club Details</h3>
    <ul class="details-list">
        <%
            String clubId = request.getParameter("club_id");
            if (clubId != null) {
                try {
                    // Load driver and create connection[span_5](start_span)[span_5](end_span)
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");
                    
                    // Retrieve club details from the clubs table[span_6](start_span)[span_6](end_span)
                    PreparedStatement ps = con.prepareStatement("SELECT `Club Name`, `Club Location` FROM `clubs` WHERE `Club ID` = ?");
                    ps.setInt(1, Integer.parseInt(clubId));
                    ResultSet rs = ps.executeQuery(); // Returns ResultSet traversed row by row[span_7](start_span)[span_7](end_span)
                    
                    if (rs.next()) {
                        out.println("<li><strong>Club ID:</strong> " + clubId + "</li>");
                        out.println("<li><strong>Club Name:</strong> " + rs.getString("Club Name") + "</li>");
                        out.println("<li><strong>Club Location:</strong> " + rs.getString("Club Location") + "</li>");
                    } else {
                        out.println("<li>Club details not found.</li>");
                    }
                    
                    con.close();
                } catch (Exception e) {
                    out.println("<li>Error loading club data: " + e.getMessage() + "</li>");
                }
            }
        %>
    </ul>    
</div>
</body>
</html>