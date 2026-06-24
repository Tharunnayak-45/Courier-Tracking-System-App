package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

@WebServlet("/ViewCourierServlet")
public class ViewCourierServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();

            String sql = "SELECT * FROM courier";
            ResultSet rs = st.executeQuery(sql);

            out.println("<h2>All Couriers</h2>");
            out.println("<table border='1' cellpadding='10'>");
            out.println("<tr>"
                    + "<th>Courier ID</th>"
                    + "<th>Sender Name</th>"
                    + "<th>Receiver Name</th>"
                    + "<th>From Address</th>"
                    + "<th>To Address</th>"
                    + "<th>Status</th>"
                    + "</tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("courier_id") + "</td>");
                out.println("<td>" + rs.getString("sender_name") + "</td>");
                out.println("<td>" + rs.getString("receiver_name") + "</td>");
                out.println("<td>" + rs.getString("from_address") + "</td>");
                out.println("<td>" + rs.getString("to_address") + "</td>");
                out.println("<td>" + rs.getString("status") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            rs.close();
            st.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
