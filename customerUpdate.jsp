<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Customer Tracking Portal - CTS</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Arial, sans-serif;
            }

            body {
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background: radial-gradient(circle at top left, #5b4cc4, #2b1f5e 70%);
                padding: 20px;
            }

            .container {
                width: 100%;
                max-width: 420px;
            }

            .header {
                text-align: center;
                margin-bottom: 25px;
            }

            .header h1 {
                color: #ffffff;
                font-size: 30px;
                font-weight: 700;
            }

            .header p {
                color: rgba(255, 255, 255, 0.7);
                font-size: 13px;
                margin-top: 6px;
            }

            .card {
                background: #ffffff;
                border-radius: 18px;
                padding: 30px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
                transition: 0.3s;
            }

            .card:hover {
                transform: translateY(-3px);
            }

            label {
                display: block;
                font-size: 13px;
                font-weight: 600;
                color: #444;
                margin-bottom: 8px;
            }

            input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background: #f8f8f8;
                font-size: 14px;
                transition: 0.3s;
            }

            input:focus {
                outline: none;
                border-color: #6a5acd;
                background: #fff;
                box-shadow: 0 0 6px rgba(106, 90, 205, 0.3);
            }

            button {
                width: 100%;
                margin-top: 15px;
                padding: 12px;
                border: none;
                border-radius: 10px;
                font-size: 15px;
                font-weight: 600;
                color: #fff;
                cursor: pointer;
                background: linear-gradient(160deg, #6a5acd, #4b3aa0);
                transition: 0.3s;
            }

            button:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .note {
                text-align: center;
                margin-top: 18px;
                font-size: 12px;
                color: rgba(255, 255, 255, 0.6);
            }

            .footer-link {
                text-align: center;
                margin-top: 12px;
            }

            .footer-link a {
                color: rgba(255, 255, 255, 0.85);
                font-size: 12px;
                text-decoration: none;
            }

            .footer-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>

        <div class="container">

            <!-- Header -->
            <div class="header">
                <h1>Customer Portal</h1>
                <p>Track your courier in real time</p>
            </div>

            <!-- Card -->
            <div class="card">

                <form action="TrackCourierServlet" method="post">

                    <label>Enter Courier ID</label>
                    <input type="text" name="cid" placeholder="e.g. CTS10021" required>

                    <button type="submit">Track Courier</button>

                </form>

            </div>

            <!-- Footer -->
            <div class="note">
                Enter the Courier ID given at the time of booking
            </div>

            <div class="footer-link">
                <a href="login.jsp">← Back to Login</a>
            </div>

        </div>

    </body>

    </html>