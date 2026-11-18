<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <h1>University Clubs</h1>
    <div class="card">
        <table>
            <tr><th>Club ID</th><th>Club Name</th><th>Location</th><th>Head ID</th></tr>
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");
                    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `clubs`");
                    while(rs.next()){
                        out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getInt(4) + "</td></tr>");
                    }
                    con.close();
                } catch(Exception e) { out.print("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>"); }
            %>
        </table>
    </div>
<%@ include file="footer.jsp" %>