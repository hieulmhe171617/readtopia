<%-- 
    Document   : loginadmin
    Created on : Jul 6, 2023, 11:41:51 PM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN PAGE</title>
        <link rel="icon" type="image/x-icon" href="images/logo3.png" />
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .login {
                background-color: #fff;
                padding: 40px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }

            .login h2 {
                text-align: center;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 16px;
            }

            .checkbox-group {
                display: flex;
                align-items: center;
            }

            input[type="checkbox"] {
                margin-right: 10px;
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                width: 16px;
                height: 16px;
                border: 1px solid #ccc;
                border-radius: 3px;
                outline: none;
                transition: background-color 0.3s ease;
                position: relative;
            }

            input[type="checkbox"]:checked {
                background-color: #4CAF50;
                border-color: #4CAF50;
            }

            input[type="checkbox"]::before {
                content: "\2714";
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: #fff;
                font-size: 12px;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            input[type="checkbox"]:checked::before {
                opacity: 1;
            }

            button[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 3px;
                font-size: 16px;
                font-weight: bold;
                background-color: #4CAF50;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button[type="submit"]:hover {
                background-color: #45a049;
            }

            @media (max-width: 480px) {
                .login {
                    padding: 20px;
                }
            }

        </style>
    </head>
    <body>
        <c:set value="${pageContext.request.cookies}" var="cookie" />
        <div class="login">
            <h2>ADMIN LOGIN</h2>
            <h4 style="color: #ff3333">${requestScope.error}</h4>
            <form action="loginadmin" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input value="${cookie.adminusername.value}" type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input  value="${cookie.adminpass.value}" type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <div class="form-group checkbox-group">
                    <input ${(cookie.cremadmin!=null)?'checked':''}  type="checkbox" id="remember" name="remember" checked value="1">
                    <label for="remember">Remember Me</label>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html>
