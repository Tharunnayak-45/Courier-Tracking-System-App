<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% response.setContentType("text/html; charset=UTF-8"); response.setCharacterEncoding("UTF-8"); String
        adminName=(String) session.getAttribute("username"); if (adminName==null) { response.sendRedirect("login.jsp");
        return; } %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>Admin Dashboard</title>

            <style>
                * {
                    box-sizing: border-box;
                    margin: 0;
                    padding: 0;
                }

                body {
                    font-family: 'Segoe UI', Arial, sans-serif;
                    background: radial-gradient(circle at top left, #5b4cc4, #2b1f5e 70%);
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 70px 20px;
                }

                h1 {
                    color: #fff;
                    font-size: 40px;
                    font-weight: 700;
                    margin-bottom: 8px;
                }

                .subtitle {
                    color: rgba(255, 255, 255, 0.65);
                    font-size: 14px;
                    margin-bottom: 55px;
                }

                .dashboard-card {
                    background: #ffffff;
                    border-radius: 20px;
                    width: 100%;
                    max-width: 660px;
                    padding: 38px 42px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                }

                .card-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 8px;
                    padding-bottom: 18px;
                    border-bottom: 1px solid #eee;
                }

                .card-header h2 {
                    font-size: 19px;
                    color: #1a1a2e;
                }

                .card-header a {
                    color: #6a5acd;
                    font-size: 13px;
                    text-decoration: none;
                    font-weight: 600;
                }

                .card-header a:hover {
                    text-decoration: underline;
                }

                .actions-grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 14px;
                    margin-top: 22px;
                }

                .action-btn {
                    display: flex;
                    align-items: center;
                    gap: 16px;
                    background: #fafafa;
                    border: 1px solid #ececec;
                    border-radius: 14px;
                    padding: 18px 20px;
                    text-decoration: none;
                    color: #1a1a2e;
                    transition: all 0.25s ease-in-out;
                }

                .action-btn:hover {
                    transform: translateY(-5px);
                    background: #ffffff;
                    border-color: #6a5acd;
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12);
                }

                .icon {
                    width: 44px;
                    height: 44px;
                    min-width: 44px;
                    border-radius: 12px;
                    background: linear-gradient(160deg, #6a5acd, #4b3aa0);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 19px;
                    color: #fff;
                    transition: 0.25s;
                }

                .action-btn:hover .icon {
                    transform: scale(1.08);
                    background: linear-gradient(160deg, #7b6df0, #5a46c7);
                }

                .label {
                    font-weight: 600;
                    font-size: 14.5px;
                }

                .label .sub {
                    display: block;
                    font-weight: 400;
                    font-size: 11.5px;
                    color: #999;
                    margin-top: 2px;
                }

                .action-btn:hover .label {
                    color: #6a5acd;
                }

                .footer-note {
                    text-align: center;
                    color: #b5b5b5;
                    font-size: 12.5px;
                    margin-top: 30px;
                }
            </style>
        </head>

        <body>

            <h1>Admin Dashboard</h1>
            <p class="subtitle">Manage couriers and monitor system activity</p>

            <div class="dashboard-card">

                <div class="card-header">
                    <h2>Quick Actions</h2>
                    <a href="LogoutServlet">Logout</a>
                </div>

                <div class="actions-grid">

                    <a href="addCourier.jsp" class="action-btn">
                        <div class="icon">✉️</div>
                        <div class="label">Add Courier<span class="sub">Register a new shipment</span></div>
                    </a>

                    <a href="viewCouriers.jsp" class="action-btn">
                        <div class="icon">📋</div>
                        <div class="label">View Couriers<span class="sub">See all records</span></div>
                    </a>

                    <a href="customerUpdate.jsp" class="action-btn">
                        <div class="icon">📍</div>
                        <div class="label">Track Courier<span class="sub">Check live status</span></div>
                    </a>

                    <a href="updateStatus.jsp" class="action-btn">
                        <div class="icon">🔄</div>
                        <div class="label">Update Status<span class="sub">Modify delivery state</span></div>
                    </a>

                    <a href="deleteCourier.jsp" class="action-btn">
                        <div class="icon">🗑️</div>
                        <div class="label">Delete Courier<span class="sub">Remove a record</span></div>
                    </a>

                    <a href="CustomerPortal.jsp" class="action-btn">
                        <div class="icon">👤</div>
                        <div class="label">Customer Portal<span class="sub">Public-facing view</span></div>
                    </a>

                </div>

                <p class="footer-note">Select any one to get an action.</p>
            </div>

        </body>

        </html>