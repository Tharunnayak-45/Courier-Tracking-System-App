<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Delete Courier</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
            color: #d9534f;
        }

        input[type=text] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        input[type=submit] {
            width: 100%;
            padding: 10px;
            background: #d9534f;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input[type=submit]:hover {
            background: #c9302c;
            transform: translateY(-2px);
        }

        input[type=text] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type=text]:hover,
        input[type=text]:focus {
            border-color: #d9534f;
            box-shadow: 0 0 5px rgba(217, 83, 79, 0.3);
            outline: none;
        }

        .container:hover {
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }
    </style>

</head>

<body bgcolor="skyblue" text="red">

    <div class="container">

        <h2>Delete Courier</h2>

        <form action="DeleteCourierServlet" method="post">

            <label>Courier ID</label>

            <input type="text" name="cid" placeholder="Enter Courier ID" required>

            <input type="submit" value="Delete Courier">

        </form>

    </div>

</body>

</html>