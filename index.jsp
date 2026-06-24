<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Login - Courier Tracking System</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html,
            body {
                height: 100%;
                font-family: 'Segoe UI', Arial, sans-serif;
            }

            body {
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                padding: 90px 20px 20px;

                background-image:
                    linear-gradient(130deg, rgba(20, 30, 60, 0.72), rgba(43, 88, 118, 0.72)),
                    url("images/Deliveryyyy.jpg");
                background-size: cover;
                background-position: center;
                background-repeat: repeat;
                background-attachment: fixed;
                overflow: visible;
            }

            /* Navbar */
            .navbar {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 70px;
                padding: 0 50px;

                display: flex;
                justify-content: space-between;
                align-items: center;

                background: rgba(255, 255, 255, 0.12);
                backdrop-filter: blur(15px);
                -webkit-backdrop-filter: blur(15px);

                border-bottom: 1px solid rgba(255, 255, 255, 0.2);
                z-index: 1000;
            }

            .nav-logo {
                color: white;
                font-size: 24px;
                font-weight: 700;
            }

            .nav-links {
                list-style: none;
                display: flex;
                gap: 20px;
            }

            .nav-links a {
                text-decoration: none;
                color: white;
                font-weight: 600;
                padding: 10px 18px;
                border-radius: 8px;
                transition: 0.3s;
            }

            .nav-links a:hover,
            .nav-links .active {
                background: rgba(255, 255, 255, 0.2);
                color: #ffd166;
            }

            /* Floating Icons */
            .floaters {
                position: absolute;
                inset: 0;
                pointer-events: none;
                overflow: hidden;
            }

            .floaters span {
                position: absolute;
                font-size: 34px;
                opacity: 0.18;
                animation: float 14s ease-in-out infinite;
            }

            .floaters span:nth-child(1) {
                top: 10%;
                left: 8%;
            }

            .floaters span:nth-child(2) {
                top: 70%;
                left: 15%;
                animation-delay: 2s;
            }

            .floaters span:nth-child(3) {
                top: 25%;
                left: 85%;
                animation-delay: 4s;
            }

            .floaters span:nth-child(4) {
                top: 80%;
                left: 80%;
                animation-delay: 1s;
            }

            .floaters span:nth-child(5) {
                top: 50%;
                left: 50%;
                animation-delay: 3s;
            }

            @keyframes float {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-20px);
                }
            }

            /* Login Card */
            .login-card {
                width: 100%;
                max-width: 450px;

                background: rgba(255, 255, 255, 0.14);
                backdrop-filter: blur(18px);
                -webkit-backdrop-filter: blur(18px);

                border: 1px solid rgba(255, 255, 255, 0.25);
                border-radius: 20px;

                padding: 40px;
                color: white;

                box-shadow: 0 12px 40px rgba(0, 0, 0, 0.35);
                z-index: 10;
            }

            .brand {
                text-align: center;
                font-size: 35px;
                margin-bottom: 6px;
            }

            .login-card h1 {
                text-align: center;
                font-size: 25px;
                margin-bottom: 8px;
            }

            .subtitle {
                text-align: center;
                color: rgba(255, 255, 255, 0.8);
                margin-bottom: 25px;
                font-size: 14px;
            }

            /* Form */
            .field {
                margin-bottom: 18px;
            }

            .field label {
                display: block;
                margin-bottom: 8px;
                font-size: 14px;
                font-weight: 600;
            }

            .field input,
            .field select {
                width: 100%;
                padding: 13px;
                border: none;
                border-radius: 10px;
                outline: none;
                font-size: 14px;
                background: rgba(255, 255, 255, 0.95);
            }

            .field input:focus,
            .field select:focus {
                box-shadow: 0 0 0 3px rgba(255, 209, 102, 0.4);
            }

            .btn-login {
                width: 100%;
                padding: 14px;
                border: none;
                border-radius: 10px;
                cursor: pointer;

                background: linear-gradient(135deg, #4e94d4, #2b5876);
                color: white;
                font-size: 16px;
                font-weight: 600;

                transition: .3s;
            }

            .btn-login:hover {
                transform: translateY(-2px);
            }

            .divider {
                text-align: center;
                margin: 20px 0;
                color: rgba(255, 255, 255, 0.8);
            }

            .login-card {
                position: absolute;
                top: 80px;
                /* below navbar */
                right: 50px;
                /* distance from right side */

                width: 30%;
                max-width: 440px;

                background: rgba(255, 255, 255, 0.14);
                backdrop-filter: blur(18px);
                -webkit-backdrop-filter: blur(18px);

                border: 1px solid rgba(255, 255, 255, 0.25);
                border-radius: 20px;
                padding: 42px 38px 36px;

                box-shadow: 0 12px 40px rgba(0, 0, 0, 0.35);
                color: white;
            }

            .btn-register {
                display: block;
                text-align: center;
                text-decoration: none;

                padding: 13px;
                border-radius: 10px;

                color: white;
                font-weight: 600;

                background: linear-gradient(135deg, #ff6fa5, #c2185b);
            }

            .error-msg {
                background: rgba(255, 0, 0, 0.2);
                border: 1px solid rgba(255, 255, 255, 0.3);
                padding: 10px;
                margin-bottom: 15px;
                border-radius: 8px;
                text-align: center;
            }

            @media(max-width:768px) {

                .navbar {
                    flex-direction: column;
                    height: auto;
                    padding: 15px;
                }

                .nav-logo {
                    margin-bottom: 10px;
                    font-size: 20px;
                }

                .nav-links {
                    flex-wrap: wrap;
                    justify-content: center;
                }

                .login-card {
                    padding: 30px 25px;
                }
            }
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <nav class="navbar">
            <div class="nav-logo">
                🚚 CTS
            </div>


            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>

        <!-- Login Card -->
        <div class="login-card">

            <div class="brand"></div>

            <h1> 🚚Welcome to Courier Tracking System</h1>

            <p class="subtitle">
                Sign in to manage and track your shipments
            </p>

            <% String error=request.getParameter("error"); if(error !=null){ %>

                <div class="error-msg">
                    Invalid Credentials! Please try again.
                </div>
                <% } %>

                    <form action="LoginServlet" method="post">

                        <div class="field">

                            <label>User Type</label>

                            <select name="userType" required>
                                <option value="">-- SELECT --</option>
                                <option value="Admin">Admin</option>
                                <option value="Customer">Customer</option>
                                <option value="CourierStaff">Courier Staff</option>
                            </select>
                        </div>

                        <div class="field">
                            <label>Username</label>

                            <input type="text" name="username" placeholder="Enter Username" required>
                        </div>

                        <div class="field">
                            <label>Password</label>

                            <input type="password" name="password" placeholder="Enter Password" required>
                        </div>

                        <button type="submit" class="btn-login">
                            Login
                        </button>

                    </form>

                    <div class="divider">OR</div>
                    <a href="register.jsp" class="btn-register">Create An New Account
                    </a>

    </html>