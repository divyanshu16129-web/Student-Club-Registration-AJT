<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>University Student Club Registration</title>
    <style>
        body {
            font-family: 'Georgia', serif;
            background-color: #e9ecef;
            color: #333;
            margin: 0;
            padding: 40px 20px;
        }
        .container {
            max-width: 700px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 40px;
            border: 1px solid #dcdcdc;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-top: 8px solid #004b87; /* Classic University Blue */
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #004b87;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .header h1 {
            color: #004b87;
            margin: 0 0 10px 0;
            font-size: 28px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .header p {
            color: #666;
            font-style: italic;
            margin: 0;
        }
        table.form-table {
            width: 100%;
            border-spacing: 0 15px;
        }
        table.form-table td {
            padding: 5px;
            vertical-align: middle;
        }
        table.form-table td:first-child {
            font-weight: bold;
            width: 35%;
            color: #004b87;
        }
        input[type="text"], input[type="email"], select {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-family: 'Arial', sans-serif;
            font-size: 14px;
        }
        .submit-btn {
            background-color: #004b87;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            font-family: 'Georgia', serif;
            width: 100%;
            margin-top: 15px;
        }
        .submit-btn:hover {
            background-color: #003366;
        }
        .club-info-section {
            margin-top: 40px;
            padding-top: 30px;
            border-top: 2px dashed #ccc;
        }
        .club-info-section h3 {
            color: #004b87;
            text-align: center;
            margin-bottom: 20px;
        }
        table.club-table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Arial', sans-serif;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        table.club-table th, table.club-table td {
            border: 1px solid #dcdcdc;
            padding: 12px;
            text-align: center;
        }
        table.club-table th {
            background-color: #004b87;
            color: #ffffff;
            text-transform: uppercase;
            font-size: 14px;
        }
        table.club-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Student Club Registration</h1>
        <p>Your Interests, Your Community, Your Campus!</p>
    </div>
    <!-- Registration Form -->
    <form action="RegisterServlet" method="POST">
        <table class="form-table">
            <tr>
                <td>Student GR No:</td>
                <td><input type="text" name="gr_no" placeholder="Enter GR Number" required></td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><input type="text" name="name" placeholder="Enter Full Name" required></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td><input type="text" name="phone" placeholder="10-digit Mobile Number" required></td>
            </tr>
            <tr>
                <td>University Email:</td>
                <td><input type="email" name="email" placeholder="student@university.ac.in" required></td>
            </tr>
            <tr>
                <td>Branch:</td>
                <td>
                    <select name="branch" required>
                        <option value="" disabled selected>-- Select Branch --</option>
                        <option value="B.Tech">B.Tech</option>
                        <option value="BBA">BBA</option>
                        <option value="BA">BA</option>
                        <option value="BSc">BSc</option>
                        <option value="BCom">BCom</option>
                        <option value="LLB">LLB</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td>
                    <select name="semester" required>
                        <option value="" disabled selected>-- Select Semester --</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <select name="department" required>
                        <option value="" disabled selected>-- Select Department --</option>
                        <option value="CSE">CSE</option>
                        <option value="CSE-AIMLA">CSE-AIML</option>
                        <option value="CE">CE</option>
                        <option value="ECE">ECE</option>
                        <option value="Business Analytics">Business Analytics</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Club ID:</td>
                <td>
                    <select name="club_id" required>
                        <option value="" disabled selected>-- Select Club ID --</option>
                            <%
                             try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT `Club ID`, `Club Name` FROM `clubs`"); // Fetches dynamic club list
                    
                                while(rs.next()){
                                    int id = rs.getInt("Club ID");
                                    String name = rs.getString("Club Name");
                                    out.print("<option value='" + id + "'>" + id + " (" + name + ")</option>");
                                }
                                con.close();
                            } catch(Exception e) {
                                out.print("<option disabled>Error loading clubs</option>");
                            }
                            %>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="1" style="text-align: center;">
                    <input type="submit" value="SUBMIT REGISTRATION" class="submit-btn">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>