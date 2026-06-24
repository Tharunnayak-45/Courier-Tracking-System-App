<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*" %>
        <% String adminName=(String) session.getAttribute("username"); if (adminName==null) {
            response.sendRedirect("login.jsp"); return; } %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>View Couriers</title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        background: radial-gradient(circle at top left, #5b4cc4, #2b1f5e 70%);
                        min-height: 100vh;
                        padding: 50px 20px;
                    }

                    h1 {
                        text-align: center;
                        color: #fff;
                        font-size: 2.2rem;
                        font-weight: 700;
                        margin-bottom: 6px;
                    }

                    .subtitle {
                        text-align: center;
                        color: rgba(255, 255, 255, 0.6);
                        font-size: 14px;
                        margin-bottom: 35px;
                    }

                    .container {
                        max-width: 1150px;
                        margin: 0 auto;
                        background: #fff;
                        border-radius: 20px;
                        padding: 35px 40px;
                        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
                    }

                    .top-bar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 25px;
                        padding-bottom: 18px;
                        border-bottom: 1px solid #eee;
                    }

                    .top-bar h2 {
                        font-size: 1.2rem;
                        color: #1a1a2e;
                    }

                    .btn-back {
                        background: linear-gradient(160deg, #6a5acd, #4b3aa0);
                        color: #fff;
                        text-decoration: none;
                        padding: 9px 20px;
                        border-radius: 10px;
                        font-size: 13px;
                        font-weight: 600;
                        transition: 0.2s;
                    }

                    .btn-back:hover {
                        background: linear-gradient(160deg, #7b6df0, #5a46c7);
                        box-shadow: 0 4px 12px rgba(106, 90, 205, 0.4);
                    }

                    .stats-bar {
                        display: flex;
                        gap: 14px;
                        margin-bottom: 22px;
                        flex-wrap: wrap;
                    }

                    .stat-box {
                        background: #f4f3fb;
                        border-radius: 12px;
                        padding: 12px 22px;
                        font-size: 13px;
                        color: #4b3aa0;
                        font-weight: 600;
                        border: 1px solid #e0ddf7;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 13.5px;
                    }

                    thead {
                        background: linear-gradient(160deg, #6a5acd, #4b3aa0);
                        color: #fff;
                    }

                    thead th {
                        padding: 13px 16px;
                        text-align: left;
                        font-weight: 600;
                        letter-spacing: 0.3px;
                    }

                    thead th:first-child {
                        border-radius: 10px 0 0 10px;
                    }

                    thead th:last-child {
                        border-radius: 0 10px 10px 0;
                    }

                    tbody tr {
                        border-bottom: 1px solid #f0f0f0;
                        transition: background 0.15s;
                    }

                    tbody tr:nth-child(even) {
                        background: #fafafa;
                    }

                    tbody tr:hover {
                        background: #f0eefb;
                    }

                    tbody td {
                        padding: 13px 16px;
                        color: #333;
                        vertical-align: middle;
                    }

                    .sno {
                        color: #999;
                        font-size: 12px;
                        font-weight: 600;
                    }

                    .courier-id {
                        font-weight: 700;
                        color: #4b3aa0;
                        font-family: monospace;
                        font-size: 13px;
                    }

                    .badge {
                        padding: 5px 12px;
                        border-radius: 20px;
                        font-size: 11.5px;
                        font-weight: 700;
                        display: inline-block;
                        text-transform: uppercase;
                        letter-spacing: 0.4px;
                    }

                    .badge-pending {
                        background: #fff3cd;
                        color: #856404;
                    }

                    .badge-transit {
                        background: #cff4fc;
                        color: #055160;
                    }

                    .badge-delivered {
                        background: #d1e7dd;
                        color: #0f5132;
                    }

                    .badge-cancelled {
                        background: #f8d7da;
                        color: #842029;
                    }

                    .badge-default {
                        background: #e2e3e5;
                        color: #41464b;
                    }

                    .no-data {
                        text-align: center;
                        padding: 50px;
                        color: #aaa;
                        font-size: 15px;
                    }

                    .no-data span {
                        display: block;
                        font-size: 40px;
                        margin-bottom: 10px;
                    }

                    .error-msg {
                        text-align: center;
                        padding: 20px 25px;
                        color: #842029;
                        background: #f8d7da;
                        border-radius: 10px;
                        border: 1px solid #f5c2c7;
                        font-size: 14px;
                    }

                    .table-wrapper {
                        overflow-x: auto;
                        border-radius: 12px;
                        border: 1px solid #eee;
                    }
                </style>
            </head>

            <body>

                <h1>Courier Tracking System</h1>
                <p class="subtitle">Admin Dashboard &mdash; All Courier Records</p>

                <div class="container">

                    <div class="top-bar">
                        <h2>&#128203; All Couriers</h2>
                        <a href="adminDashboard.jsp" class="btn-back">&#8592; Back to Dashboard</a>
                    </div>

                    <% Connection con2=null; Statement stmt2=null; ResultSet rs2=null; String errorMsg=null; int
                        totalCount=0; int deliveredCount=0; int pendingCount=0; int transitCount=0;
                        java.util.List<String[]> rows = new java.util.ArrayList<String[]>();

                            try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/tharun", "root", "root");
                            stmt2 = con2.createStatement();
                            rs2 = stmt2.executeQuery("SELECT * FROM courier ORDER BY courier_id DESC");

                            while (rs2.next()) {
                            String status = rs2.getString("status");
                            if (status == null) status = "Pending";

                            String badgeClass;
                            String sl = status.toLowerCase();
                            if (sl.equals("in transit")) {
                            badgeClass = "badge-transit";
                            transitCount++;
                            } else if (sl.equals("delivered")) {
                            badgeClass = "badge-delivered";
                            deliveredCount++;
                            } else if (sl.equals("cancelled")) {
                            badgeClass = "badge-cancelled";
                            } else if (sl.equals("pending")) {
                            badgeClass = "badge-pending";
                            pendingCount++;
                            } else {
                            badgeClass = "badge-default";
                            }

                            rows.add(new String[]{
                            rs2.getString("courier_id"),
                            rs2.getString("sender_name"),
                            rs2.getString("receiver_name"),
                            rs2.getString("source_city"),
                            rs2.getString("destination_city"),
                            status,
                            badgeClass,
                            });
                            totalCount++;
                            }

                            } catch (ClassNotFoundException e) {
                            errorMsg = "Database driver not found: " + e.getMessage();
                            } catch (SQLException e) {
                            errorMsg = "Database error: " + e.getMessage();
                            } finally {
                            try { if (rs2 != null) rs2.close(); } catch (Exception ignored) {}
                            try { if (stmt2 != null) stmt2.close(); } catch (Exception ignored) {}
                            try { if (con2 != null) con2.close(); } catch (Exception ignored) {}
                            }
                            %>

                            <% if (errorMsg !=null) { %>
                                <div class="error-msg"><strong>&#9888; Error:</strong>
                                    <%= errorMsg %>
                                </div>
                                <% } else { %>

                                    <div class="stats-bar">
                                        <div class="stat-box">&#128230; Total: <%= totalCount %>
                                        </div>
                                        <div class="stat-box">&#9989; Delivered: <%= deliveredCount %>
                                        </div>
                                        <div class="stat-box">&#128666; In Transit: <%= transitCount %>
                                        </div>
                                        <div class="stat-box">&#9203; Pending: <%= pendingCount %>
                                        </div>
                                    </div>

                                    <div class="table-wrapper">
                                        <table>
                                            <thead>
                                                <tr>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Courier ID</th>
                                                    <th>Sender</th>
                                                    <th>Receiver</th>
                                                    <th>Origin</th>
                                                    <th>Destination</th>
                                                    <th>Status</th>
                                                </tr>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% if (rows.isEmpty()) { %>

                                                    <tr>
                                                        <td colspan="7" class="no-data">
                                                            <span>&#128230;</span>
                                                            No courier records found.
                                                        </td>
                                                    </tr>

                                                    <% } else { int sno=1; for(String[] row : rows) { %>

                                                        <tr>
                                                            <td class="sno">
                                                                <%= sno++ %>
                                                            </td>
                                                            <td class="courier-id">#<%= row[0] %>
                                                            </td>
                                                            <td>
                                                                <%= row[1] %>
                                                            </td>
                                                            <td>
                                                                <%= row[2] %>
                                                            </td>
                                                            <td>
                                                                <%= row[3] %>
                                                            </td>
                                                            <td>
                                                                <%= row[4] %>
                                                            </td>
                                                            <td>
                                                                <span class="badge <%= row[6] %>">
                                                                    <%= row[5] %>
                                                                </span>
                                                            </td>
                                                        </tr>

                                                        <% } } %>

                                            </tbody>
                                        </table>
                                    </div>

                                    <% } %>

                </div>
            </body>

            </html>