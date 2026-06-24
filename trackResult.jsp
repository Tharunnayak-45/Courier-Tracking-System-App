<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <% String courierId=request.getAttribute("courierId") !=null ? String.valueOf(request.getAttribute("courierId"))
        : "" ; String sender=request.getAttribute("sender") !=null ? String.valueOf(request.getAttribute("sender")) : ""
        ; String receiver=request.getAttribute("receiver") !=null ? String.valueOf(request.getAttribute("receiver"))
        : "" ; String source=request.getAttribute("source") !=null ? String.valueOf(request.getAttribute("source")) : ""
        ; String destination=request.getAttribute("destination") !=null ?
        String.valueOf(request.getAttribute("destination")) : "" ; String status=request.getAttribute("status") !=null ?
        String.valueOf(request.getAttribute("status")) : "Booked" ; %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Tracking Result - CTS</title>

            <style>
                :root {
                    --primary: #2b5876;
                    --primary-dark: #1d435d;
                    --accent: #4e94d4;
                    --bg: #f4f6f9;
                    --text: #2f3640;
                    --muted: #6b7280;
                    --radius: 16px;
                    --shadow: 0 4px 16px rgba(43, 88, 118, 0.08);

                    --booked: #f0a500;
                    --transit: #3a86ff;
                    --delivered: #2ecc71;
                    --cancelled: #e63946;
                }

                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Arial, sans-serif;
                    background: var(--bg);
                    color: var(--text);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 30px 16px;
                }

                .wrapper {
                    width: 100%;
                    max-width: 620px;
                }

                .top-bar {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin-bottom: 18px;
                }

                .top-bar h2 {
                    color: var(--primary);
                    font-size: 20px;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .back-link {
                    text-decoration: none;
                    color: var(--primary);
                    font-size: 14px;
                    font-weight: 500;
                    padding: 8px 14px;
                    border-radius: 999px;
                    background: white;
                    box-shadow: var(--shadow);
                    transition: transform 0.2s ease;
                }

                .back-link:hover {
                    transform: translateX(-3px);
                }

                .result-card {
                    background: white;
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    overflow: hidden;
                }

                .result-header {
                    background: linear-gradient(135deg, var(--primary), var(--primary-dark));
                    color: white;
                    padding: 26px 30px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .result-header .id-block .label {
                    font-size: 12px;
                    opacity: 0.8;
                    text-transform: uppercase;
                    letter-spacing: 0.6px;
                }

                .result-header .id-block .value {
                    font-size: 24px;
                    font-weight: 600;
                    margin-top: 2px;
                }

                .status-pill {
                    padding: 8px 18px;
                    border-radius: 999px;
                    font-size: 13px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 0.4px;
                    color: white;
                    white-space: nowrap;
                }

                .status-booked {
                    background: var(--booked);
                }

                .status-in-transit {
                    background: var(--transit);
                }

                .status-delivered {
                    background: var(--delivered);
                }

                .status-cancelled {
                    background: var(--cancelled);
                }

                /* Route visual */
                .route {
                    display: flex;
                    align-items: center;
                    padding: 28px 30px 10px;
                    gap: 14px;
                }

                .route .point {
                    flex: 1;
                    text-align: center;
                }

                .route .point .dot {
                    width: 14px;
                    height: 14px;
                    border-radius: 50%;
                    background: var(--accent);
                    margin: 0 auto 8px;
                }

                .route .point.start .dot {
                    background: var(--primary);
                }

                .route .point.end .dot {
                    background: var(--danger, #e63946);
                }

                .route .point .city {
                    font-weight: 600;
                    font-size: 15px;
                }

                .route .point .tag {
                    font-size: 12px;
                    color: var(--muted);
                    text-transform: uppercase;
                    letter-spacing: 0.4px;
                    margin-top: 2px;
                }

                .route .line {
                    flex: 2;
                    height: 2px;
                    background: repeating-linear-gradient(to right, var(--accent) 0 6px, transparent 6px 12px);
                    position: relative;
                    top: -16px;
                }

                /* Details grid */
                .details {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 0;
                    padding: 10px 30px 30px;
                }

                .detail-item {
                    padding: 16px 0;
                    border-bottom: 1px solid #eef1f4;
                }

                .detail-item:nth-last-child(-n+2) {
                    border-bottom: none;
                }

                .detail-item .label {
                    font-size: 12px;
                    color: var(--muted);
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    margin-bottom: 4px;
                }

                .detail-item .value {
                    font-size: 16px;
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    gap: 6px;
                }

                /* Update status form */
                .update-section {
                    background: #f9fafb;
                    padding: 26px 30px 30px;
                    border-top: 1px dashed #e2e6ea;
                }

                .update-section h4 {
                    color: var(--primary);
                    font-size: 14px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    margin-bottom: 14px;
                }

                .update-form {
                    display: flex;
                    gap: 12px;
                    flex-wrap: wrap;
                }

                .update-form select {
                    flex: 1;
                    min-width: 160px;
                    padding: 12px 14px;
                    border-radius: 10px;
                    border: 1px solid #d8dee5;
                    font-size: 14px;
                    background: white;
                    color: var(--text);
                }

                .update-form input[type="hidden"] {
                    display: none;
                }

                .update-form button {
                    background: var(--primary);
                    color: white;
                    border: none;
                    padding: 12px 26px;
                    border-radius: 10px;
                    font-size: 14px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: background 0.2s ease, transform 0.2s ease;
                }

                .update-form button:hover {
                    background: var(--primary-dark);
                    transform: translateY(-1px);
                }

                @media (max-width: 520px) {
                    .details {
                        grid-template-columns: 1fr;
                    }

                    .result-header {
                        flex-direction: column;
                        align-items: flex-start;
                        gap: 12px;
                    }
                }
            </style>
        </head>

        <body>

            <div class="wrapper">

                <div class="top-bar">
                    <h2>📦 Tracking Result</h2>
                    <a href="trackCourier.jsp" class="back-link">&larr; Track Another</a>
                </div>

                <div class="result-card">

                    <div class="result-header">
                        <div class="id-block">
                            <div class="label">Courier ID</div>
                            <div class="value">#<%= courierId %>
                            </div>
                        </div>
                        <% String statusClass="status-booked" ; String s=status.trim().toLowerCase(); if
                            (s.contains("transit")) statusClass="status-in-transit" ; else if (s.contains("deliver"))
                            statusClass="status-delivered" ; else if (s.contains("cancel"))
                            statusClass="status-cancelled" ; %>
                            <span class="status-pill <%= statusClass %>">
                                <%= status %>
                            </span>
                    </div>

                    <div class="route">
                        <div class="point start">
                            <div class="dot"></div>
                            <div class="city">
                                <%= source %>
                            </div>
                            <div class="tag">Source</div>
                        </div>
                        <div class="line"></div>
                        <div class="point end">
                            <div class="dot"></div>
                            <div class="city">
                                <%= destination %>
                            </div>
                            <div class="tag">Destination</div>
                        </div>
                    </div>

                    <div class="details">
                        <div class="detail-item">
                            <div class="label">Sender</div>
                            <div class="value">🧑 <%= sender %>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="label">Receiver</div>
                            <div class="value">🧑‍💼 <%= receiver %>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="label">Source</div>
                            <div class="value">📍 <%= source %>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="label">Destination</div>
                            <div class="value">🏁 <%= destination %>
                            </div>
                        </div>
                    </div>

                    <div class="update-section">
                        <h4>Update Status</h4>
                        <form class="update-form" action="UpdateStatusServlet" method="post">
                            <input type="hidden" name="courierId" value="<%= courierId %>">
                            <select name="status" required>
                                <option value="" disabled selected>Select new status</option>
                                <option value="Booked" <%=status.equalsIgnoreCase("Booked") ? "selected" : "" %>>Booked
                                </option>
                                <option value="In Transit" <%=status.equalsIgnoreCase("In Transit") ? "selected" : "" %>
                                    >In Transit</option>
                                <option value="Delivered" <%=status.equalsIgnoreCase("Delivered") ? "selected" : "" %>
                                    >Delivered</option>
                                <option value="Cancelled" <%=status.equalsIgnoreCase("Cancelled") ? "selected" : "" %>
                                    >Cancelled</option>
                            </select>
                            <button type="submit">Update Status</button>
                        </form>
                    </div>

                </div>

            </div>

        </body>

        </html>