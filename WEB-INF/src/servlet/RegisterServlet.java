package servlet;
 
import db.DBConnection;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        response.setContentType("text/html");
        
 
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
 
        if (fullname == null || fullname.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {
            try (PrintWriter out = response.getWriter()) {
                out.println("<h3>All fields are required.</h3>");
                out.println("<a href='register.jsp'>Go Back</a>");
            }
            return;
        }
 
        if (!password.equals(confirmPassword)) {
            try (PrintWriter out = response.getWriter()) {
                out.println("<h3>Passwords do not match.</h3>");
                out.println("<a href='register.jsp'>Go Back</a>");
            }
            return;
        }
 
        String sql = "INSERT INTO users (fullname, email, phone, username, password) "
                   + "VALUES (?, ?, ?, ?, ?)";
 
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
 
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, password);
 
            int x = ps.executeUpdate();
 
            if (x > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("failure.jsp");
            }
 
        } catch (Exception e) {
            e.printStackTrace();
            try (PrintWriter out = response.getWriter()) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            }
        }
    }
}