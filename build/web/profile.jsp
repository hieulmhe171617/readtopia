<%-- 
    Document   : userdetail
    Created on : Jun 13, 2023, 1:42:10 AM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>READTOPIA</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="images/favicon.png" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="css/cssprofile.css"/>
        <style>
            .gen {
                font-size: larger;
                margin-left: 20%;
                margin-top: 30px;
            }

            .gen2 {
                width: 50px;

            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="left-content col-md-3">
                <div class="deco">
                    <c:if test="${sessionScope.user.gender==true}">
                        <img src="images/male.jpg" style="width: 200px; border-radius: 50%;margin-left: 20%; margin-top: 20px;margin-bottom: 20px;"/>
                    </c:if>
                    <c:if test="${sessionScope.user.gender==false}">
                        <img src="images/female.jpg" style="width: 200px; border-radius: 50%;margin-left: 20%; margin-top: 20px;margin-bottom: 20px;"/>
                    </c:if>
                    <h2 class="username" style="font-family: optima">
                        ${sessionScope.user.fullname}
                    </h2>
                </div>


                <form action="profile" method="post">
                    <a href="home" style="text-decoration: none; color: black; font-size: larger" class="option">Back to Homepage 🏠</a><br/>
                    <button type="submit" name="detail" class="option" value="1">Profile Details &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 👥</button><br/>
                    <button type="submit" name="changepass" class="option" value="2">Change Password &nbsp; 🕵️</button><br/>
                    <button type="submit" name="out" class="option" value="3">Logout &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;👋</button>
                </form>
            </div>
            <div class="main-content col-md-6" style="margin-left: 10%">
                <c:if test="${requestScope.option=='detail'}">
                    <h1 class="heading1">Profile Details</h1>
                    <h3 class="descript">This is your profile, you can update some information</h3>
                    <h4 style="color: green; text-align: center">${requestScope.noti}</h4>
                    <form action="profile" method="post">

                        <span class="label">Username :</span> <input type="text" name="username" value="${sessionScope.user.username}" readonly/> <br/>
                        <span class="label">Fullname :</span> <input type="text" name="fullname" value="${(sessionScope.newfullname==null)?sessionScope.user.fullname:sessionScope.newfullname}"/> <br/>
                        <span class="label">Email :</span> <input type="text" name="email" value="${(sessionScope.newemail==null)?sessionScope.user.email:sessionScope.newemail}"/> <br/>
                        <c:if test="${(sessionScope.newgender == null && sessionScope.user.gender==true)}">
                            <span class="gen">Gender : <input class="gen2" type="radio" name="gender" value="true" checked/> (🤴)Male
                                <input  class="gen2"  type="radio" name="gender" value="false" /> (👸)Female  
                            </c:if>  
                            <c:if test="${(sessionScope.newgender == null && sessionScope.user.gender==false)}">
                                <span  class="gen">Gender : <input  class="gen2"  type="radio" name="gender" value="true"/> (🤴)Male
                                    <input  class="gen2"  type="radio" name="gender" value="false"  checked/> (👸)Female 
                                </c:if>  
                                <c:if test="${(sessionScope.newgender==true)}">
                                    <span class="gen">Gender : <input  class="gen2"  type="radio" name="gender" value="true" checked/> (🤴)Male
                                        <input  class="gen2"  type="radio" name="gender" value="false" /> (👸)Female  
                                    </c:if>  
                                    <c:if test="${(sessionScope.newgender==false)}">
                                        <span class="gen">Gender : <input  class="gen2"  type="radio" name="gender" value="true"/> (🤴)Male
                                            <input  class="gen2"  type="radio" name="gender" value="false" checked/> (👸)Female  
                                        </c:if>  
                                        <br/><input value="UPDATE" type="submit" class="update"/>
                                        </form>

                                    </c:if>

                                    <c:if test="${requestScope.option=='changepass'}">
                                        <h1 class="heading1">Change Password</h1>
                                        <h4 style="color: green; text-align: center">${requestScope.noti}</h4>
                                        <h4 style="color: red; text-align: center">${requestScope.error}</h4>

                                        <form action="profile" method="post">
                                            <span class="label2">Enter old password&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; : </span><input type="password" name="oldpass" placeholder="Enter old password" required=""/> <br/>
                                            <span  class="label2">Enter new password&nbsp; &nbsp; &nbsp;&nbsp; :</span><input type="password" name="newpass1" placeholder="Enter new password" required=""/> <br/>
                                            <span  class="label2">Re-enter new password : </span><input type="password" name="newpass2" placeholder="Re-enter new password" required=""/> <br/>
                                            <input value="CHANGE" type="submit" class="change"/>
                                        </form>

                                    </c:if>

                                    <c:if test="${requestScope.option=='out'}">
                                    </c:if>    
                                    </div>
                                    <div class="right-content col-md-3">

                                    </div>
                                    </div>


                                    <!-- Bootstrap core JS-->
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                                    <!-- Core theme JS-->
                                    <script src="js/scripts.js"></script>
                                    </body>
                                    </html>
