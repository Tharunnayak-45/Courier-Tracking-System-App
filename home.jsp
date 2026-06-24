<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <% String username=(String) session.getAttribute("username"); if (username==null) {
        response.sendRedirect("login.jsp"); return; } %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Home - CTS</title>

            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Arial, sans-serif;
                    background: #f4f6f9;
                }

                .navbar {
                    background: #2b5876;
                    color: white;
                    padding: 15px 30px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .navbar h2 {
                    font-size: 22px;
                }

                .user-info {
                    display: flex;
                    align-items: center;
                    gap: 15px;
                }

                .btn-logout {
                    background: #d8000c;
                    color: white;
                    text-decoration: none;
                    padding: 8px 15px;
                    border-radius: 5px;
                }

                .btn-logout:hover {
                    background: #a30009;
                }

                .container {
                    width: 90%;
                    max-width: 1000px;
                    margin: 40px auto;
                }

                .card {
                    background: white;
                    padding: 30px;
                    border-radius: 10px;
                    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
                }

                .card h1 {
                    color: #2b5876;
                    margin-bottom: 15px;
                }

                .card p {
                    color: #555;
                    line-height: 1.6;
                }

                .dashboard {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                    gap: 20px;
                    margin-top: 30px;
                }

                .box {
                    background: white;
                    padding: 25px;
                    border-radius: 10px;
                    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
                    text-align: center;
                }

                .box h3 {
                    color: #2b5876;
                    margin-bottom: 10px;
                }

                .box a {
                    text-decoration: none;
                    color: white;
                    background: #2b5876;
                    padding: 10px 20px;
                    display: inline-block;
                    margin-top: 10px;
                    border-radius: 5px;
                }

                .box a:hover {
                    background: #1d435d;
                }
            </style>

        </head>

        <body>

            <div class="navbar">
                <h2>🚚 CTS </h2>

                <div class="user-info">
                    <span>Welcome, <%= username %></span>
                    <a href="LogoutServlet" class="btn-logout">Logout</a>
                </div>
            </div>

            <div class="container">

                <div class="card">
                    <h1>Welcome to Courier Tracking System 🌍</h1>
                    <p>
                        Login Successful. You can now manage couriers,
                        track shipments and update delivery information.
                    </p>
                </div>

                <div class="dashboard">

                    <div class="box">
                        <h3>Add Courier</h3>
                        <p>Add your courier details.</p>
                        <a href="addCourier.jsp">Click Here</a>
                    </div>

                    <div class="box">
                        <h3>Track Courier</h3>
                        <p>Track courier delivery status.</p>
                        <a href="trackCourier.jsp">Click Here</a>
                    </div>

                    <div class="box">
                        <h3>View Couriers</h3>
                        <p>View all courier records.</p>
                        <a href="viewCouriers.jsp">Click Here</a>
                    </div>

                    <div class="box">
                        <h3>Update Profile</h3>
                        <p>Update account information.</p>
                        <a href="customerUpdate.jsp">Click Here</a>
                    </div>

                </div>

            </div>

        </body>

        </html>