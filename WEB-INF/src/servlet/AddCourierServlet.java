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

@WebServlet("/AddCourierServlet")
public class AddCourierServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        response.setContentType("text/html");

        try {

            System.out.println("================================");
            System.out.println("=== AddCourierServlet Started ===");
            System.out.println("================================");

            String senderName =
                    request.getParameter("senderName");

            String receiverName =
                    request.getParameter("receiverName");

            String sourceCity =
                    request.getParameter("sourceCity");

            String destinationCity =
                    request.getParameter("destinationCity");

            String status =
                    request.getParameter("status");

            System.out.println("Sender      = " + senderName);
            System.out.println("Receiver    = " + receiverName);
            System.out.println("Source      = " + sourceCity);
            System.out.println("Destination = " + destinationCity);
            System.out.println("Status      = " + status);

            con = DBConnection.getConnection();

            if(con == null){

                response.getWriter().println(
                        "<h2>Database Connection Failed</h2>"
                );
                return;
            }

            String sql =
                "INSERT INTO courier " +
                "(sender_name, receiver_name, source_city, destination_city, status) " +
                "VALUES (?,?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, senderName);
            ps.setString(2, receiverName);
            ps.setString(3, sourceCity);
            ps.setString(4, destinationCity);
            ps.setString(5, status);

            System.out.println("Executing Insert...");

            int rows = ps.executeUpdate();

            System.out.println("Rows Inserted = " + rows);

            if(rows > 0){

                response.getWriter().println(
                    "<h2 style='color:green'>Courier Added Successfully</h2>"
                );

            }else{

                response.getWriter().println(
                    "<h2 style='color:red'>Insert Failed</h2>"
                );
            }

        }
        catch(Exception e){

            response.getWriter().println(
                "<h2 style='color:red'>ERROR OCCURRED</h2>"
            );

            response.getWriter().println("<pre>");

            e.printStackTrace(
                new java.io.PrintWriter(response.getWriter())
            );

            response.getWriter().println("</pre>");

            e.printStackTrace();
        }
        finally{

            try{
                if(ps != null)
                    ps.close();
            }catch(Exception e){

            }

            try{
                if(con != null)
                    con.close();
            }catch(Exception e){}
        }
    }
}