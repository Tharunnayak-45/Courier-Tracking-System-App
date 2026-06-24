<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin Login - CTS</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: radial-gradient(circle at top left, #5b4cc4, #2b1f5e 70%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 360px;
            padding: 38px 36px;
            background: #ffffff;
            border-radius: 18px;
            border: 1px solid rgba(255,255,255,0.5);
        }

        .login-container h2 {
            font-size: 22px;
            text-align: center;
            color: #1a1a2e;
            font-weight: 700;
        }

        .login-container .subtitle {
            text-align: center;
            color: #999;
            font-size: 13px;
            margin-top: 6px;
            margin-bottom: 26px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 600;
            color: #444;
        }

        .form-group input {
            width: 100%;
            padding: 11px 13px;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            font-size: 14px;
            background: #fafafa;
        }

        .form-group input:focus {
            outline: none;
            border-color: #6a5acd;
            background: #fff;
        }

        button {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(160deg, #6a5acd, #4b3aa0);
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 6px;
        }

        .error {
            margin-bottom: 18px;
            padding: 10px 12px;
            background: #ffe5e5;
            color: #a10000;
            border: 1px solid #ffb3b3;
            border-radius: 8px;
            font-size: 13px;
            text-align: center;
        }
    </style>
</head>

<body>

    <div class="login-container">
        <h2>Admin Login</h2>
        <p class="subtitle">Restricted area — admin credentials required.</p>

        <% String error = request.getParameter("error");
        if("true".equals(error)) { %>
            <div class="error">Invalid username or password.</div>
        <% } %>

        <form action="AdminLoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" type="text" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" type="password" required>
            </div>
            <button type="submit">Sign In</button>
        </form>
    </div>

</body>

</html>