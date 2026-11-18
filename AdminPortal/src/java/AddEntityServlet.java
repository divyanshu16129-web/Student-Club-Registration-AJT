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
@WebServlet("/AddEntityServlet")
public class AddEntityServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int headId = Integer.parseInt(request.getParameter("head_id"));
        String headName = request.getParameter("head_name");
        long headPhone = Long.parseLong(request.getParameter("head_phone"));
        String headEmail = request.getParameter("head_email");        
        int clubId = Integer.parseInt(request.getParameter("club_id"));
        String clubName = request.getParameter("club_name");
        String clubLoc = request.getParameter("club_location");        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/club registration", "root", "");            
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `program head` (`Head ID`, `Head Name`, `Head Ph_no.`, `Head Email`, `Club ID`) VALUES (?, ?, ?, ?, ?)");
            ps1.setInt(1, headId); ps1.setString(2, headName); ps1.setLong(3, headPhone); ps1.setString(4, headEmail); ps1.setInt(5, clubId);
            ps1.executeUpdate();
            PreparedStatement ps2 = con.prepareStatement("INSERT INTO `clubs` (`Club ID`, `Club Name`, `Club Location`, `Head ID`) VALUES (?, ?, ?, ?)");
            ps2.setInt(1, clubId); ps2.setString(2, clubName); ps2.setString(3, clubLoc); ps2.setInt(4, headId);
            ps2.executeUpdate();
            con.close();
            request.setAttribute("message", "Successfully added Program Head and Club!");
            request.setAttribute("type", "success");
        } catch (Exception e) {
            request.setAttribute("message", "Database Error: " + e.getMessage());
            request.setAttribute("type", "error");
        }
        RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
        rd.forward(request, response);
    }
}