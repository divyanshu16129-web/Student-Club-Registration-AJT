<%@ include file="header.jsp" %>
    <h1>Add New Club & Program Head</h1>
    <form action="AddEntityServlet" method="POST">
        <div class="card">
            <h3>1. Program Head Details</h3>
            Head ID: <input type="number" name="head_id" required>
            Head Name: <input type="text" name="head_name" required>
            Head Phone: <input type="number" name="head_phone" required>
            Head Email: <input type="email" name="head_email" required>
        </div>
        <div class="card">
            <h3>2. Club Details</h3>
            Club ID: <input type="number" name="club_id" required>
            Club Name: <input type="text" name="club_name" required>
            Club Location: <input type="text" name="club_location" required>
            
            <br><br>
            <input type="submit" value="Save to Database" class="btn" style="width: 100%;">
        </div>
    </form>
<%@ include file="footer.jsp" %>