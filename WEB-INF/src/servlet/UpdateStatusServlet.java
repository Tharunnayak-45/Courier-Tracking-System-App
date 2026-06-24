package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

public class UpdateStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String courierId = request.getParameter("courierId");
        String status = request.getParameter("status");

        System.out.println("Courier ID = " + courierId);
        System.out.println("Status = " + status);

        if (courierId == null || courierId.trim().isEmpty()) {

            response.sendRedirect(
                "trackResult.jsp?error="
                + URLEncoder.encode("Courier ID Missing", "UTF-8"));

            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = DBConnection.getConnection();

            String sql =
                "UPDATE courier SET status=? WHERE id=?";

            ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(courierId));

            int rows = ps.executeUpdate();

            System.out.println("Rows Updated = " + rows);

            if (rows > 0) {

                response.sendRedirect(
                    "trackResult.jsp?courierId="
                    + courierId
                    + "&success="
                    + URLEncoder.encode(
                        "Status Updated Successfully",
                        "UTF-8"));

            } else {

                response.sendRedirect(
                    "trackResult.jsp?courierId="
                    + courierId
                    + "&error="
                    + URLEncoder.encode(
                        "Courier Not Found",
                        "UTF-8"));
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "trackResult.jsp?courierId="
                + courierId
                + "&error="
                + URLEncoder.encode(
                    "Database Error",
                    "UTF-8"));

        } finally {

            try {
                if (ps != null)
                    ps.close();
            } catch (Exception e) {}

            try {
                if (con != null)
                    con.close();
            } catch (Exception e) {}
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
}