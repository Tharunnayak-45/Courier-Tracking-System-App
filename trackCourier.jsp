<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Track Courier - CTS</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', sans-serif;
            }

            body {
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background: linear-gradient(135deg, #1e3c72, #2a5298);
            }

            .container {
                width: 420px;
                background: #fff;
                padding: 35px;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            }

            .logo {
                text-align: center;
                font-size: 50px;
                margin-bottom: 10px;
            }

            h2 {
                text-align: center;
                color: #1e3c72;
                margin-bottom: 8px;
            }

            .subtitle {
                text-align: center;
                color: #666;
                margin-bottom: 25px;
                font-size: 14px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                color: #333;
                font-weight: bold;
            }

            input[type="number"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
                margin-bottom: 20px;
            }

            input[type="number"]:focus {
                outline: none;
                border-color: #2563eb;
            }

            button {
                width: 100%;
                padding: 12px;
                background: #2563eb;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
            }

            button:hover {
                background: #1d4ed8;
            }

            .footer {
                text-align: center;
                margin-top: 20px;
                color: #888;
                font-size: 13px;
            }

            .error {
                background: #ffe5e5;
                color: #cc0000;
                padding: 10px;
                border-radius: 6px;
                margin-bottom: 15px;
                text-align: center;
            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="logo">📦</div>

            <h2>Courier Tracking System</h2>

            <div class="subtitle">
                Enter your Courier ID to track shipment
            </div>

            <% String error=request.getParameter("error"); if("missingFields".equals(error)){ %>
                <div class="error">
                    Please enter Courier ID
                </div>
                <% } %>

                    <form action="TrackCourierServlet" method="post">

                        <label>Courier ID</label>

                        <input type="number" name="courierId" placeholder="Enter Courier ID" required>

                        <button type="submit">
                            Track Courier
                        </button>

                    </form>

                    <div class="footer">
                        CTS - Courier Tracking Management System
                    </div>

        </div>

    </body>

    </html>