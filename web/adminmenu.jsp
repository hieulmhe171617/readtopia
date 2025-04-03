<%-- 
    Document   : adminmenu
    Created on : Jul 8, 2023, 4:18:34 PM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin menu</title>
        <style>
            .menuleft {

                width: 30%;
                margin-top: 2%;
            }

            .menuleft ul {
                list-style-type: none;
                padding: 0;
            }

            .menuleft li {
                margin-bottom: 10px;
            }

            .menuleft form {
                display: inline;
            }

            .menuleft input[type="submit"] {
                padding: 10px 20px;
                background-color: #ff6b6b;
                border: none;
                color: #fff;
                font-family: 'Arial', sans-serif;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .menuleft input[type="submit"]:hover {
                background-color: #ee5253;
            }

            .menuleft input[type="submit"]:focus {
                outline: none;
            }

            .menuleft input[type="submit"]:active {
                transform: scale(0.95);
            }

            @keyframes fadeIn {
                0% {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .menuleft li {
                width: 200px; /* Adjust the width value as per your requirement */
                animation-name: fadeIn;
                animation-duration: 0.5s;
                animation-timing-function: ease;
                animation-fill-mode: both;
            }


        </style>
    </head>
    <body>
        <div class="menuleft">
            <ul>
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="0" name="option"/>
                        <input type="submit" value="Overview" style="width: 190px; height: 45px;"/>
                    </form>
                </li>
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="1" name="option"/>
                        <input type="submit" value="Admin Mangement" style="width: 190px; height: 45px;"/>
                    </form>
                </li>
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="2" name="option"/>
                        <input type="submit" value="User Management" style="width: 190px; height: 45px;"/>
                    </form>
                </li>                
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="3" name="option"/>
                        <input type="submit" value="Book Genre" style="width: 190px; height: 45px;"/>
                    </form>
                </li>                
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="4" name="option"/>
                        <input type="submit" value="Author" style="width: 190px; height: 45px;"/>
                    </form>
                </li>                
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="5" name="option"/>
                        <input type="submit" value="Book" style="width: 190px; height: 45px;"/>
                    </form>
                </li>                
                <li>
                    <form action="adminprocess">
                        <input type="hidden" value="6" name="option"/>
                        <input type="submit" value="Newfeed Management" style="width: 190px; height: 45px;"/>
                    </form>
                </li>
            </ul>
        </div>
    </body>
</html>
