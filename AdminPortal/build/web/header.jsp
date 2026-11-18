<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>University Admin Portal</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; background-color: #f4f7f6; display: flex; min-height: 100vh; }
        .sidebar { width: 260px; background-color: #003366; color: white; padding-top: 20px; box-shadow: 2px 0 5px rgba(0,0,0,0.1); flex-shrink: 0; }
        .sidebar h2 { text-align: center; font-size: 22px; margin-bottom: 30px; border-bottom: 1px solid #005b9f; padding-bottom: 15px; letter-spacing: 1px;}
        .sidebar a { display: block; color: #dcdcdc; padding: 15px 25px; text-decoration: none; font-size: 16px; border-bottom: 1px solid #004b87; transition: 0.3s;}
        .sidebar a:hover { background-color: #005b9f; color: white; padding-left: 30px; }
        .main-content { flex-grow: 1; padding: 40px; overflow-y: auto; }
        h1, h2, h3 { color: #003366; }
        .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); margin-top: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
        th, td { border: 1px solid #e0e0e0; padding: 12px 15px; text-align: left; }
        th { background-color: #004b87; color: white; font-weight: 500; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        input[type="text"], input[type="number"], input[type="email"], select { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { background-color: #004b87; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; transition: 0.3s; }
        .btn:hover { background-color: #002244; }
        .alert { padding: 15px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 4px; margin-bottom: 20px; }
        .alert-error { background-color: #f8d7da; color: #721c24; border-color: #f5c6cb; }
    </style>
    <script>
        function promptDelete() {
            let id = prompt("Enter the Club ID to delete the Club and its Program Head:");
            if (id != null && id !== "") {
                window.location.href = "DeleteServlet?club_id=" + id;
            }
        }
    </script>
</head>
<body>
<div class="sidebar">
    <h2>Admin Portal</h2>
    <a href="index.jsp">Dashboard Home</a>
    <a href="viewStudents.jsp">1. View All Students</a>
    <a href="viewClubs.jsp">2. View All Clubs</a>
    <a href="viewHeads.jsp">3. View Program Heads</a>
    <a href="filter.jsp">4. Filter Students</a>
    <a href="addEntity.jsp">5. Add Club & Head</a>
    <a href="#" onclick="promptDelete(); return false;">6. Delete Records</a>
</div>
<div class="main-content">