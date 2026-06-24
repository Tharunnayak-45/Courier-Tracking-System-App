<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Login - Courier Tracking System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: url('city-bg.jpg') no-repeat center center/cover;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(40, 60, 90, 0.55);
            z-index: 0;
        }

        /* ===== TOP NAVBAR ===== */
        .navbar {
            position: relative;
            z-index: 2;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 40px;
            background: rgba(20, 30, 50, 0.35);
            backdrop-filter: blur(6px);
        }

        .navbar .logo {
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 35px;
        }

        .navbar ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: color 0.2s ease;
        }

        .navbar ul li a:hover {
            color: #ffb347;
            text-decoration: underline;
        }

        /* ===== MAIN CONTENT ===== */
        .content-wrapper {
            position: relative;
            z-index: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(10px);
            border-radius: 14px;
            padding: 40px;
            width: 460px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .login-card h1 {
            color: #fff;
            font-size: 30px;
            margin-bottom: 10px;
        }

        .login-card p.subtitle {
            color: #e0e0e0;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            color: #fff;
            font-weight: bold;
            margin-bottom: 6px;
            font-size: 14px;
        }

        .form-group select,
        .form-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            background: #fff;
            outline: none;
        }

        .btn-login {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #2d6cdf, #1f4fb0);
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 8px;
            transition: opacity 0.2s ease;
        }

        .btn-login:hover {
            opacity: 0.9;
        }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            color: #ddd;
            margin: 20px 0;
            font-size: 13px;
        }

        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: rgba(255, 255, 255, 0.4);
        }

        .divider:not(:empty)::before {
            margin-right: 10px;
        }

        .divider:not(:empty)::after {
            margin-left: 10px;
        }

        .btn-register {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #ff5fa2, #ff2e91);
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn-register:hover {
            opacity: 0.9;
        }

        @media (max-width: 600px) {
            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .navbar ul {
                gap: 20px;
            }

            .login-card {
                width: 90%;
                padding: 25px;
            }
        }
    </style>
</head>

<body>
    <nav class="navbar">
        <div class="logo">CTS</div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </nav>

    <!-- LOGIN CARD -->
    <div class="content-wrapper">
        <div class="login-card">
            <h1>Welcome to Courier Tracking System</h1>
            <p class="subtitle">Sign in to manage and track your shipments</p>

            <form action="LoginServlet" method="post">

                <div class="form-group">
                    <label for="userType">Required Type</label>
                    <select id="userType" name="userType" required>
                        <option value="">-- SELECT --</option>
                        <option value="admin">Admin</option>
                        <option value="customer">Customer</option>
                        <option value="delivery">Delivery Agent</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="username">UserName</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <button type="submit" class="btn-login">Login</button>

                <div class="divider">OR</div>

                <a href="register.jsp" class="btn-register">Create An New Account</a>

            </form>
        </div>
    </div>

</body>

</html>