import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final String URL =
            "jdbc:mysql://localhost:3306/club registration";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    @Override
    protected void doPost(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String grNo = request.getParameter("gr_no");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String branch = request.getParameter("branch");
        String semester = request.getParameter("semester");
        String department = request.getParameter("department");
        String clubId = request.getParameter("club_id");
        String sql = "INSERT INTO `student register` "
                + "(`Student GR No.`, `Name`, `Student Ph No.`, "
                + "`University Email`, `Branch`, `Semester`, "
                + "`Department`, `Club ID`) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                        URL, USER, PASSWORD);
                 PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(grNo));
                ps.setString(2, name);
                ps.setLong(3, Long.parseLong(phone));
                ps.setString(4, email);
                ps.setString(5, branch);
                ps.setInt(6, Integer.parseInt(semester));
                ps.setString(7, department);
                ps.setInt(8, Integer.parseInt(clubId));
                int result = ps.executeUpdate(); 
                if (result > 0) {
                    request.getRequestDispatcher("success.jsp").forward(request, response);
                } else {
                    System.out.println("<h3>Registration Failed!</h3>");
                }
            }
        } catch (NumberFormatException e) {
            response.getWriter().println(
                    "<h3>Invalid GR No., phone, semester, or club ID.</h3>");
        } catch (ClassNotFoundException | SQLException e) {
            log("Registration error", e);
            response.getWriter().println(
                    "<h3>Database error. Please try again.</h3>");
        }
    }
}
