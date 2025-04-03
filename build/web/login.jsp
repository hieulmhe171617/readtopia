<%-- 
    Document   : login
    Created on : May 25, 2023, 11:47:34 PM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="icon" type="image/x-icon" href="images/favicon.png" />
        <link rel="stylesheet" href="css/logincss.css"/>
    </head>
    <body>
        <%@include file="loading.jsp" %>


        <div class="backHome">
            <a href="home" id="back" 
               style="text-decoration: none; color: white;font-weight: bold
               ;font-size: 25px;background: black; padding: 20px; border-radius: 20px;
               margin-top: 200px;">
                Back To HomePage
            </a>
        </div>

        <div class="contain">

            <div class="main">
                <input type="checkbox" id="chk" aria-hidden="true">
                <div class="signup">
                    <form action="login" method="post">
                        <label for="chk" aria-hidden="true">Sign up</label>
                        <input type="text" name="userS" placeholder="Username" required="">
                        <input type="email" name="emailS" placeholder="Email" required="">
                        <input type="password" name="passS" placeholder="Password" required="">
                        <input type="submit" value="Sign up" class="SignNLog"/>
                    </form>
                    <h4 style="text-align: center; color: red">${requestScope.error}</h4>
                    <h4 style="text-align: center; color: green">${requestScope.noti}</h4>
                </div>

                <div class="login">
                    <c:set value="${pageContext.request.cookies}" var="cookie" />
                    <form action="login" method="post">
                        <label for="chk" aria-hidden="true">Login</label>
                        <input value="${cookie.cuser.value}" type="text" name="userL" placeholder="User name" required="">
                        <input value="${cookie.cpass.value}" type="password" name="passL" placeholder="Password" required="">
                        <input ${(cookie.crem!=null)?'checked':''} value="1" type="checkbox" name="rem" style="display: inline-block; width: 30px; margin-left: 18%;"> <span>Remember me<span/>
                        <input type="submit" value="Login" class="SignNLog"/>

                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
