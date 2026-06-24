<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Update Courier Status</title>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Inter', sans-serif;
            }

            body {
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background: #f1f5f9;
                padding: 20px;
            }

            .container {
                width: 100%;
                max-width: 480px;
            }

            .card {
                background: #fff;
                padding: 35px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            }

            .header {
                text-align: center;
                margin-bottom: 25px;
            }

            .header h2 {
                color: #0f172a;
                margin-bottom: 5px;
            }

            .header p {
                color: #64748b;
                font-size: 14px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #334155;
            }

            input,
            select {
                width: 100%;
                padding: 14px;
                border: 1px solid #cbd5e1;
                border-radius: 10px;
                font-size: 15px;
            }

            input:focus,
            select:focus {
                outline: none;
                border-color: #2563eb;
                box-shadow: 0 0 0 4px rgba(37, 99, 235, .12);
            }

            .btn {
                width: 100%;
                padding: 14px;
                border: none;
                border-radius: 10px;
                background: #2563eb;
                color: white;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
            }

            .btn:hover {
                background: #1d4ed8;
            }

            .alert {
                padding: 12px;
                border-radius: 10px;
                margin-bottom: 20px;
                font-size: 14px;
                font-weight: 500;
            }

            .error {
                background: #fef2f2;
                color: #dc2626;
                border: 1px solid #fecaca;
            }

            .success {
                background: #f0fdf4;
                color: #16a34a;
                border: 1px solid #bbf7d0;
            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="card">

                <div class="header">
                    <h2>Update Courier Status</h2>
                    <p>Courier Tracking System</p>
                </div>

                <% String error=request.getParameter("error"); String success=request.getParameter("success"); %>

                    <% if(error !=null){ %>
                        <div class="alert error">
                            <%= error %>
                        </div>
                        <% } %>

                            <% if(success !=null){ %>
                                <div class="alert success">
                                    <%= success %>
                                </div>
                                <% } %>

                                    <form action="UpdateStatusServlet" method="post">

                                        <div class="form-group">
                                            <label>Courier ID</label>
                                            <input type="number" name="courierId" placeholder="Enter Courier ID"
                                                required>
                                        </div>

                                        <div class="form-group">
                                            <label>Status</label>

                                            <select name="status" required>
                                                <option value="">Select Status</option>
                                                <option value="Pending">Pending</option>
                                                <option value="Picked Up">Picked Up</option>
                                                <option value="In Transit">In Transit</option>
                                                <option value="Out for Delivery">Out for Delivery</option>
                                                <option value="Delivered">Delivered</option>
                                                <option value="Cancelled">Cancelled</option>
                                            </select>

                                        </div>

                                        <button type="submit" class="btn">
                                            Update Status
                                        </button>

                                    </form>

            </div>

        </div>

    </body>

    </html>