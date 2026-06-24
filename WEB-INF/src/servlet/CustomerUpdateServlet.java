package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import db.DBConnection;

public class CustomerUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cid = request.getParameter("cid");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT status, location FROM courier WHERE courier_id = ?"
            );

            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String status = rs.getString("status");
                String location = rs.getString("location");

                request.setAttribute("cid", cid);
                request.setAttribute("status", status);
                request.setAttribute("location", location);

                request.getRequestDispatcher("trackResult.jsp")
                    .forward(request, response);

            } else {
                response.sendRedirect("customerUpdate.jsp?error=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customerUpdate.jsp?error=db");
        }
    }
}