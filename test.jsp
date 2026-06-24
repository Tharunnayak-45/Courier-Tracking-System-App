<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Database Test</title>
</head>
<body>

<%
Connection con = null;

try {

    con = DBConnection.getConnection();

    if(con != null) {

        out.println("<h2 style='color:green'>Database Connected Successfully</h2>");

    } else {

        out.println("<h2 style='color:red'>Database Connection Failed</h2>");
    }

} catch(Exception e) {

    out.println("<h2 style='color:red'>Error Occurred</h2>");
    out.println("<pre>");
    e.printStackTrace(new java.io.PrintWriter(out));
    out.println("</pre>");
}
%>

</body>
</html>