<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <h1>Registered Students</h1>
    <div class="card">
        <table>
            <tr><th>GR No</th><th>Name</th><th>Phone</th><th>Email</th><th>Branch</th><th>Semester</th><th>Department</th><th>Club ID</th></tr>
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");
                    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `student register`");
                    while(rs.next()){
                        out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getLong(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getInt(6) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getInt(8) + "</td></tr>");
                    }
                    con.close();
                } catch(Exception e) { out.print("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>"); }
            %>
        </table>
    </div>
<%@ include file="footer.jsp" %>