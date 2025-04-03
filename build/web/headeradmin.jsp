<%-- 
    Document   : headeradmin
    Created on : Jul 7, 2023, 10:07:59 PM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header admin Page</title>
        <style>
            body {
                margin: 0;
                font-family: Lato, "Helvetica Neue", Helvetica, sans-serif;
            }
            
            .left-header {
                text-decoration: none;
                color: black;

            }

            .logo {
                width: 85px;
                border-radius: 50%;
            }

            .header {
                display: flex;
                align-items: center;
            }

            .left-header {
                display: flex;
                align-items: center;
                text-decoration: none;
                margin-left: 2%;
            }

            .logo {
                margin-right: 10px; /* Adjust the margin as needed */
            }

            .header-text {
                font-weight: bold;
                color: rgb(56, 33, 16);
            }

            .avtadmin {
                width: 50px;
                border-radius: 50%;
            }

            .adbut {
                border:none;
                background: none;
            }

            .logout {
                display: inline-block;
            }

            .out {
                border: none;
                background: none;
                font-size: 18px;
                cursor: pointer;
            }

            .out:hover {
                padding: 8px;
                border-radius: 6px;
                background: #666600;
                color: white;
                font-size: 18px;
                cursor: pointer;
            }

            .right-header {
                margin-left: 60%;
            }

            .header {
                background: rgb(244, 241, 234);
                padding: 10px;
                box-shadow: rgba(0, 0, 0, 0.15) 0px 1px 2px 0px;

            }

            .right-header {
                display: flex;
                align-items: center
            }
        </style>
    </head>
    <body>
        <div class="header">

            <a href="adminprocess?option=0" class="left-header">
                <img src="images/logo3.png" class="logo"/>
                <span class="header-text">ADMIN READTOPIA</span>
            </a>

            <div class="right-header">
                <img src="images/avtadmin.jpg" class="avtadmin"/>
                <span style="font-size: 19px; color: rgb(56, 33, 16)  ">
                    &nbsp;&nbsp;${sessionScope.admin.username}/
                </span>
                <form action="adminlogout" class="logout">
                    <input type="submit" value="Log out" class="out">
                </form>
            </div>
        </div>

    </body>
</html>
