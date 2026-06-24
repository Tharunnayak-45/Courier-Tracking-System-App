package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TrackCourierServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String courierId = request.getParameter("courierId");

        if (courierId == null || courierId.trim().length() == 0) {
            response.sendRedirect("trackCourier.jsp?error=missingFields");
            return;
        }

        try {
            Integer.parseInt(courierId);
        } catch (NumberFormatException ex) {
            response.sendRedirect("trackCourier.jsp?error=invalidId");
            return;
        }

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Track Courier</title>");
        out.println("<style>");
        out.println("body{font-family:Arial;background:#f4f6f9;margin:0;padding:0;}");
        out.println(".container{width:500px;margin:50px auto;background:white;padding:30px;border-radius:15px;box-shadow:0 4px 15px rgba(0,0,0,0.2);}");
        out.println("h2{text-align:center;color:#2563eb;}");
        out.println(".row{padding:10px 0;border-bottom:1px solid #eee;}");
        out.println(".label{font-weight:bold;color:#444;}");
        out.println(".status{color:green;font-weight:bold;font-size:18px;}");
        out.println(".btn{display:block;text-align:center;background:#2563eb;color:white;padding:10px;text-decoration:none;border-radius:5px;margin-top:20px;}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tharun",
                    "root",
                    "root");

            ps = con.prepareStatement(
                    "SELECT * FROM courier WHERE courier_id=?");

            ps.setInt(1, Integer.parseInt(courierId));

            rs = ps.executeQuery();

            out.println("<div class='container'>");

            if (rs.next()) {

                out.println("<h2>Courier Tracking Result</h2>");

                out.println("<div class='row'><span class='label'>Courier ID:</span> "
                        + rs.getInt("courier_id") + "</div>");

                out.println("<div class='row'><span class='label'>Sender:</span> "
                        + rs.getString("sender_name") + "</div>");

                out.println("<div class='row'><span class='label'>Receiver:</span> "
                        + rs.getString("receiver_name") + "</div>");

                out.println("<div class='row'><span class='label'>Source:</span> "
                        + rs.getString("source_city") + "</div>");

                out.println("<div class='row'><span class='label'>Destination:</span> "
                        + rs.getString("destination_city") + "</div>");

                out.println("<div class='row'><span class='label'>Status:</span> "
                        + "<span class='status'>"
                        + rs.getString("status")
                        + "</span></div>");

            } else {

                out.println("<h2 style='color:red;'>&#10060; Courier Not Found</h2>");
            }

            out.println("<a class='btn' href='trackCourier.jsp'>Track Another Courier</a>");
            out.println("</div>");

        } catch (Exception e) {

            out.println("<div class='container'>");
            out.println("<h2 style='color:red;'>Error</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
            out.println("</div>");

        } finally {

            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
            }

            try {
                if (ps != null)
                    ps.close();
            } catch (Exception e) {
            }

            try {
                if (con != null)
                    con.close();
            } catch (Exception e) {
            }
        }

        out.println("</body>");
        out.println("</html>");
    }
}