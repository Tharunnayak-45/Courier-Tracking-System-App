<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: skyblue;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            width: 380px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #2d6cdf;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1f4fb0;
        }

        .login-link {
            text-align: center;
            margin-top: 14px;
            font-size: 13px;
        }

        .login-link a {
            color: #2d6cdf;
            text-decoration: none;
        }

        /* ===== Added extra CSS below ===== */

        * {
            transition: all 0.2s ease-in-out;
        }

        .form-container {
            animation: fadeSlideIn 0.5s ease;
        }

        @keyframes fadeSlideIn {
            from {
                opacity: 0;
                transform: translateY(-15px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="tel"]:focus {
            outline: none;
            border-color: #2d6cdf;
            box-shadow: 0 0 0 3px rgba(45, 108, 223, 0.2);
        }

        input[type="submit"]:active {
            transform: scale(0.98);
        }

        .login-link a:hover {
            text-decoration: underline;
            color: #1f4fb0;
        }

        ::placeholder {
            color: #aaa;
            font-size: 13px;
        }

        @media (max-width: 420px) {
            .form-container {
                width: 90%;
                padding: 25px 20px;
            }
        }
    </style>
</head>

<body>

    <div class="form-container">
        <h2>Create an Account</h2>

        <form action="RegisterServlet" method="post">

            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>

            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Choose a password" required>

            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password" required>

            <input type="submit" value="Register">

            <div class="login-link">
                Already You have an account <a href="adminLogin.jsp">Login here</a>
            </div>

        </form>
    </div>

</body>

</html>