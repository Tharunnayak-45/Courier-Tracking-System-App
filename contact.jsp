<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us - Courier Tracking System</title>

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

                background:
                    linear-gradient(rgba(20, 30, 60, 0.7),
                        rgba(43, 88, 118, 0.7)),
                    url('https://png.pngtree.com/background/20210709/original/pngtree-delivery-banner-poster-background-picture-image_921964.jpg');

                background-size: cover;
                background-position: center;
                background-attachment: fixed;
            }

            /* Contact Card */

            .contact-container {
                width: 90%;
                max-width: 700px;

                background: rgba(255, 255, 255, 0.15);
                backdrop-filter: blur(15px);
                -webkit-backdrop-filter: blur(15px);

                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 20px;

                padding: 40px;

                color: white;

                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
            }

            .contact-header {
                text-align: center;
                margin-bottom: 30px;
            }

            .contact-header h1 {
                font-size: 35px;
                margin-bottom: 10px;
            }

            .contact-header p {
                color: rgba(255, 255, 255, 0.8);
            }

            .contact-box {
                display: flex;
                align-items: center;

                gap: 20px;

                margin-bottom: 20px;

                padding: 18px;

                border-radius: 12px;

                background: rgba(255, 255, 255, 0.08);

                transition: 0.3s;
            }

            .contact-box:hover {
                transform: translateY(-3px);
                background: rgba(255, 255, 255, 0.15);
            }

            .icon {
                font-size: 35px;
            }

            .info h3 {
                margin-bottom: 5px;
            }

            .info p {
                color: rgba(255, 255, 255, 0.85);
            }

            .home-btn {
                display: block;
                width: 200px;

                margin: 25px auto 0;

                text-align: center;
                text-decoration: none;

                padding: 14px;

                border-radius: 10px;

                background: linear-gradient(135deg, #4e94d4, #2b5876);

                color: white;
                font-weight: bold;

                transition: 0.3s;
            }

            .home-btn:hover {
                transform: translateY(-2px);
            }

            @media(max-width:600px) {

                .contact-box {
                    flex-direction: column;
                    text-align: center;
                }

                .contact-header h1 {
                    font-size: 28px;
                }
            }
        </style>
    </head>

    <body>

        <div class="contact-container">

            <div class="contact-header">
                <h1>📞 Contact Us</h1>
            </div>

            <div class="contact-box">
                <div class="icon">📱</div>
                <div class="info">
                    <h3>Phone Number</h3>
                    <p>+91 8125404616</p>
                </div>
            </div>

            <div class="contact-box">
                <div class="icon">📧</div>
                <div class="info">
                    <h3>Email Address</h3>
                    <p>mtharun616@gmail.com</p>
                </div>
            </div>

            <div class="contact-box">
                <div class="icon">📍</div>
                <div class="info">
                    <h3>Address</h3>
                    <p>Hyderabad,Telangana India</p>
                </div>
            </div>
            <a href="login.jsp" class="home-btn">
                ← Back to Login
            </a>

        </div>

    </body>

    </html>