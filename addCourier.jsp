<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% response.setContentType("text/html; charset=UTF-8"); response.setCharacterEncoding("UTF-8"); String
        adminName=(String) session.getAttribute("username"); if (adminName==null) { response.sendRedirect("login.jsp");
        return; } String error=request.getParameter("error"); %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>Add Courier - CTS</title>

            <style>
                * {
                    box-sizing: border-box;
                    margin: 0;
                    padding: 0;
                    font-family: 'Segoe UI', Arial, sans-serif;
                }

                body {
                    background: linear-gradient(135deg, #6a5acd, #2b1f5e);
                    min-height: 100vh;
                    padding: 50px 20px;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                .header {
                    width: 100%;
                    max-width: 800px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 25px;
                }

                .header h1 {
                    color: white;
                    font-size: 32px;
                }

                .header p {
                    color: rgba(255, 255, 255, 0.7);
                    font-size: 13px;
                }

                .back-btn {
                    text-decoration: none;
                    color: white;
                    border: 1px solid rgba(255, 255, 255, 0.4);
                    padding: 10px 14px;
                    border-radius: 10px;
                    font-size: 13px;
                    transition: 0.3s;
                }

                .back-btn:hover {
                    background: white;
                    color: #2b1f5e;
                }

                .card {
                    width: 100%;
                    max-width: 800px;
                    background: white;
                    border-radius: 18px;
                    padding: 35px;
                    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
                }

                .error {
                    background: #ffe5e5;
                    color: #c0392b;
                    padding: 10px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    font-size: 13px;
                }

                .section-title {
                    font-size: 12px;
                    color: #777;
                    font-weight: 700;
                    margin: 20px 0 10px;
                    letter-spacing: 1px;
                }

                .row {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 15px;
                }

                .field {
                    margin-bottom: 15px;
                }

                label {
                    font-size: 13px;
                    font-weight: 600;
                    color: #333;
                    margin-bottom: 6px;
                    display: block;
                }

                input,
                select,
                textarea {
                    width: 100%;
                    padding: 11px;
                    border-radius: 10px;
                    border: 1px solid #ddd;
                    background: #f8f8f8;
                    font-size: 14px;
                    transition: 0.3s;
                }

                input:focus,
                select:focus,
                textarea:focus {
                    border-color: #6a5acd;
                    background: white;
                    outline: none;
                    box-shadow: 0 0 6px rgba(106, 90, 205, 0.3);
                }

                textarea {
                    min-height: 70px;
                    resize: none;
                }

                .btn {
                    width: 100%;
                    padding: 13px;
                    background: linear-gradient(135deg, #6a5acd, #4b3aa0);
                    border: none;
                    color: white;
                    font-size: 15px;
                    font-weight: 600;
                    border-radius: 10px;
                    cursor: pointer;
                    transition: 0.3s;
                    margin-top: 10px;
                }

                .btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
                }
            </style>
        </head>

        <body>

            <div class="header">
                <div>
                    <h1>Add Courier</h1>
                    <p>Register a new shipment into CTS system</p>
                </div>

                <a href="adminDashboard.jsp" class="back-btn">← Dashboard</a>
            </div>

            <div class="card">

                <% if (error !=null) { %>
                    <div class="error">⚠ Please fill all required fields correctly.</div>
                    <% } %>

                        <form action="AddCourierServlet" method="post">

                            <div class="section-title">SENDER DETAILS</div>

                            <div class="field">
                                <label>Sender Name</label>
                                <input type="text" name="senderName" required>
                            </div>

                            <div class="section-title">RECEIVER DETAILS</div>

                            <div class="field">
                                <label>Receiver Name</label>
                                <input type="text" name="receiverName" required>
                            </div>

                            <div class="section-title">SHIPMENT DETAILS</div>

                            <div class="row">
                                <div class="field">
                                    <label>Source City</label>
                                    <input type="text" name="sourceCity" placeholder="e.g. Chennai" required>
                                </div>

                                <div class="field">
                                    <label>Destination City</label>
                                    <input type="text" name="destinationCity" placeholder="e.g. Bangalore" required>
                                </div>
                            </div>

                            <div class="field">
                                <label>Status</label>
                                <select name="status" required>
                                    <option value="----Select----">----Select----</option>
                                    <option value="Booked">Booked</option>
                                    <option value="In Transit">In Transit</option>
                                    <option value="Out for Delivery">Out for Delivery</option>
                                    <option value="Delivered">Delivered</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>

                            <button class="btn" type="submit">➕ Add Courier</button>

                        </form>

            </div>

        </body>

        </html>