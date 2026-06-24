<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Success - CTS</title>
        <meta http-equiv="refresh" content="3;url=viewCourier.jsp">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background: #f4f6f9;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .card {
                background: white;
                border-radius: 18px;
                box-shadow: 0 8px 30px rgba(43, 88, 118, 0.12);
                padding: 48px 40px;
                text-align: center;
                max-width: 420px;
                width: 100%;
            }

            .icon-circle {
                width: 84px;
                height: 84px;
                border-radius: 50%;
                background: #e8f8ee;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 22px;
                animation: pop 0.4s ease;
            }

            .icon-circle svg {
                width: 42px;
                height: 42px;
            }

            @keyframes pop {
                0% {
                    transform: scale(0);
                }

                70% {
                    transform: scale(1.15);
                }

                100% {
                    transform: scale(1);
                }
            }

            h1 {
                color: #2b5876;
                font-size: 22px;
                margin-bottom: 10px;
            }

            p {
                color: #6b7280;
                font-size: 14.5px;
                line-height: 1.6;
                margin-bottom: 28px;
            }

            .btn {
                display: inline-block;
                text-decoration: none;
                background: linear-gradient(135deg, #4e94d4, #2b5876);
                color: white;
                padding: 12px 28px;
                border-radius: 999px;
                font-size: 14.5px;
                font-weight: 600;
                box-shadow: 0 8px 20px rgba(43, 88, 118, 0.3);
                transition: transform 0.2s ease;
            }

            .btn:hover {
                transform: translateY(-2px);
            }

            .redirect-note {
                margin-top: 18px;
                font-size: 12.5px;
                color: #9aa3ad;
            }
        </style>
    </head>

    <body>

        <div class="card">
            <div class="icon-circle">
                <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="12" cy="12" r="11" stroke="#2ecc71" stroke-width="1.5" />
                    <path d="M7 12.5l3 3 7-7" stroke="#2ecc71" stroke-width="2" stroke-linecap="round"
                        stroke-linejoin="round" />
                </svg>
            </div>

            <h1>Action Completed Successfully</h1>
            <p>The courier record has been deleted from the system.</p>

            <a href="viewCourier.jsp" class="btn">View Couriers</a>

            <div class="redirect-note">Redirecting automatically in 3 seconds&hellip;</div>
        </div>

    </body>

    </html>