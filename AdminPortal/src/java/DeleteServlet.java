import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clubIdStr = request.getParameter("club_id");       
        if (clubIdStr == null || clubIdStr.isEmpty()) {
            request.setAttribute("message", "Invalid Request. Please provide a Club ID.");
            request.setAttribute("type", "error");
            request.getRequestDispatcher("message.jsp").forward(request, response);
            return;
        }        
        try {
            int clubId = Integer.parseInt(clubIdStr);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");
            con.setAutoCommit(false);            
            try {
                PreparedStatement psStudents = con.prepareStatement("DELETE FROM `student register` WHERE `Club ID` = ?");
                psStudents.setInt(1, clubId); psStudents.executeUpdate();
                PreparedStatement psHead = con.prepareStatement("DELETE FROM `program head` WHERE `Club ID` = ?");
                psHead.setInt(1, clubId); int rowsHeads = psHead.executeUpdate();
                PreparedStatement psClub = con.prepareStatement("DELETE FROM `clubs` WHERE `Club ID` = ?");
                psClub.setInt(1, clubId); int rowsClubs = psClub.executeUpdate();
                con.commit();
                if (rowsClubs > 0 || rowsHeads > 0) {
                    request.setAttribute("message", "Success: Club, Program Head, and enrolled Students were permanently deleted.");
                    request.setAttribute("type", "success");
                } else {
                    request.setAttribute("message", "Error: Club ID not found in the database.");
                    request.setAttribute("type", "error");
                }
            } catch (Exception e) {
                con.rollback();
                request.setAttribute("message", "Transaction failed. Database Error: " + e.getMessage());
                request.setAttribute("type", "error");
            } finally {
                con.close();
            }
        } catch (Exception e) {
            request.setAttribute("message", "System Exception: " + e.getMessage());
            request.setAttribute("type", "error");
        }
        RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
        rd.forward(request, response);
    }
}