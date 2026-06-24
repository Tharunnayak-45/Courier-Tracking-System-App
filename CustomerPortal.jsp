<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String cid=request.getParameter("cid"); String status=(String) request.getAttribute("status"); String
        location=(String) request.getAttribute("location"); %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>Courier Tracking - CTS</title>

            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Segoe UI', Arial;
                }

                body {
                    min-height: 100vh;
                    background: radial-gradient(circle at top left, #5b4cc4, #2b1f5e 70%);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    padding: 30px;
                }

                .card {
                    width: 100%;
                    max-width: 500px;
                    background: white;
                    border-radius: 18px;
                    padding: 30px;
                    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
                }

                h2 {
                    text-align: center;
                    color: #2b1f5e;
                    margin-bottom: 5px;
                }

                .cid {
                    text-align: center;
                    color: #777;
                    font-size: 13px;
                    margin-bottom: 20px;
                }

                .status-box {
                    background: #f4f4ff;
                    border-left: 5px solid #6a5acd;
                    padding: 15px;
                    border-radius: 10px;
                    margin-bottom: 20px;
                }

                .status {
                    font-size: 16px;
                    font-weight: 600;
                    color: #2b1f5e;
                }

                .location {
                    font-size: 13px;
                    color: #555;
                    margin-top: 5px;
                }

                .timeline {
                    margin-top: 20px;
                }

                .step {
                    display: flex;
                    align-items: center;
                    margin-bottom: 18px;
                }

                .circle {
                    width: 18px;
                    height: 18px;
                    border-radius: 50%;
                    background: #ddd;
                    margin-right: 12px;
                }

                .active .circle {
                    background: #6a5acd;
                    box-shadow: 0 0 10px rgba(106, 90, 205, 0.6);
                }

                .step span {
                    font-size: 14px;
                    color: #444;
                }

                .active span {
                    font-weight: 600;
                    color: #2b1f5e;
                }

                .btn {
                    display: block;
                    text-align: center;
                    margin-top: 25px;
                    padding: 12px;
                    background: linear-gradient(160deg, #6a5acd, #4b3aa0);
                    color: white;
                    text-decoration: none;
                    border-radius: 10px;
                    font-weight: 600;
                }

                .btn:hover {
                    transform: translateY(-2px);
                }
            </style>
        </head>

        <body>

            <div class="card">

                <h2>📦 Courier Tracking</h2>
                <div class="cid">Courier ID: <b>
                        <%= cid %>
                    </b></div>

                <div class="status-box">
                    <div class="status">Status: <%= status !=null ? status : "Processing" %>
                    </div>
                    <div class="location">Location: <%= location !=null ? location : "Warehouse" %>
                    </div>
                </div>

                <div class="timeline">

                    <div class="step active">
                        <div class="circle"></div>
                        <span>Order Placed</span>
                    </div>

                    <div class="step active">
                        <div class="circle"></div>
                        <span>Packed</span>
                    </div>

                    <div class="step">
                        <div class="circle"></div>
                        <span>In Transit</span>
                    </div>

                    <div class="step">
                        <div class="circle"></div>
                        <span>Out for Delivery</span>
                    </div>

                    <div class="step">
                        <div class="circle"></div>
                        <span>Delivered</span>
                    </div>

                </div>

                <a href="customerUpdate.jsp" class="btn">Track Another Courier</a>

            </div>

        </body>

        </html>