package servlet;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCourierServlet")
public class DeleteCourierServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            int cid = Integer.parseInt(request.getParameter("cid"));

            con = DBConnection.getConnection();

            ps = con.prepareStatement("DELETE FROM courier WHERE courier_id=?");

            ps.setInt(1, cid);

            int x = ps.executeUpdate();

            if (x > 0) {
                response.sendRedirect("Success.jsp");
            } else {
                response.sendRedirect("failure.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Always send a response, even on failure, otherwise the browser shows a blank/404 page.
            try {
                response.sendRedirect("failure.jsp");
            } catch (IOException ignored) {}
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}