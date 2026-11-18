<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <h1>Filter Students by Club</h1>
    <div class="card">
        <form method="GET" action="filter.jsp">
            <label style="font-weight: bold;">Enter Club ID:</label>
            <input type="number" name="search_id" required>
            <input type="submit" value="Search Students" class="btn">
        </form>
    </div>    
    <%
        String searchId = request.getParameter("search_id");
        if(searchId != null && !searchId.isEmpty()){
    %>
    <div class="card">
        <h3>Results for Club ID: <%= searchId %></h3>
        <table>
            <tr><th>GR No</th><th>Name</th><th>Branch</th></tr>
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");
                    PreparedStatement ps = con.prepareStatement("SELECT `Student GR No.`, `Name`, `Branch` FROM `student register` WHERE `Club ID` = ?");
                    ps.setInt(1, Integer.parseInt(searchId));
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td></tr>");
                    }
                    con.close();
                } catch(Exception e) { out.print("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>"); }
            %>
        </table>
    </div>
    <% } %>
<%@ include file="footer.jsp" %>