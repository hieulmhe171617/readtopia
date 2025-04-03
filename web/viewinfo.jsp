<%-- 
    Document   : viewinfo
    Created on : Jun 29, 2023, 11:34:18 PM
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            .profile-info {
                text-align: center;
                margin-top: 50px;
            }

            .profile-image {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                border: 5px solid #ff5f6d;
                margin-bottom: 20px;
            }

            .profile-name {
                text-decoration: none;
                font-size: 28px;
                color: #333;
                font-family: 'Arial', sans-serif;
                transition: color 0.3s ease;
                font-weight: bold;
            }

            .profile-name:hover {
                color: #ff5f6d;
            }

            .profile-username {
                font-size: 18px;
                color: #666;
                font-style: italic;
                margin-top: 10px;
            }

            .profile-gender {
                font-size: 20px;
                color: #555;
                margin-top: 20px;
                font-weight: bold;
            }

            .profile-contact {
                font-size: 18px;
                color: #777;
                margin-top: 10px;
            }

            .back {
                margin-bottom: 20px;
            }

            .back a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff5f6d;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .back a:hover {
                background-color: #ff4264;
            }

            .rating {
                margin-top: 20px;
                font-size: 16px;
                font-weight: bold;
            }

            .rating a {
                color: #333;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .rating a:hover {
                color: #ff5f6d;
            }

            .news {
                margin-top: 20px;
            }

            .new-item {
                margin-bottom: 20px;
            }

            .new-item a {
                font-weight: bold;
                color: #333;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .new-item a:hover {
                color: #ff5f6d;
            }

            .new-item p {
                color: #777;
                margin-top: 5px;
            }

            .new-item {
                width: 80%;
                margin: 2% auto;
                border: 2px solid black;
                padding: 15px;
                border-radius: 8px;
            }

            .username {
                font-size: larger;
            }

            .rating {
                width: 80%;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <div class="all">
            <div class="back">
                <a href="news">
                    Back To Newsfeed
                </a>
            </div>
            <div class="profile-info">
                <c:set value="${requestScope.info}" var="i" />
                <c:if test="${i.gender == true}">
                    <img src="images/male.jpg" alt="Male" class="profile-image" />
                </c:if>
                <c:if test="${i.gender == false}">
                    <img src="images/female.jpg" alt="Female" class="profile-image" />
                </c:if>
                <a href="viewinfo?id=${i.username}" class="profile-name">${i.fullname}</a>
                <h5 class="profile-username">(@${i.username})</h5>
                <c:if test="${i.gender == true}">
                    <p class="profile-gender">Male</p>
                </c:if>
                <c:if test="${i.gender == false}">
                    <p class="profile-gender">Female</p>
                </c:if>
                <p class="profile-contact">Contact: ${i.email}</p>
            </div>

            <div class="rating">
                <h5>${i.fullname}'s rating recent:</h5> 
                <c:forEach items="${requestScope.listrate}" var="r">
                    <a href="displaybook?id=${r.bookID}">+, ${r.name}</a> - ${r.rating}⭐<br/>
                </c:forEach>
            </div>

            <div class="news">
                <c:forEach items="${requestScope.listnews}" var="n">
                    <div class="new-item">
                        <a href="viewinfo?id=${n.username}" class="username">
                            <c:if test="${i.gender==true}">
                                <img src="images/male.jpg" style="width: 70px; border-radius: 50%"/>
                            </c:if>
                            <c:if test="${i.gender==false}">
                                <img src="images/female.jpg" style="width: 70px; border-radius: 50%"/>
                            </c:if>
                            ${n.username}
                        </a>
                        <c:if test="${sessionScope.user.username == i.username}">
                            <form  onsubmit="return confirmSubmit()" action="viewinfo" method="post" style="display: inline-block; margin-left: 80%">
                                <input type="hidden" name="newid" value="${n.id}" style="margin-top: 10px;">
                                <input type="hidden" name="username" value="${sessionScope.user.username}" style="margin-top: 10px;">
                                <button type="submit" style="padding: 5px 10px; background-color: #ff5f6d; color: #fff; border-radius: 5px; transition: background-color 0.3s ease; margin-top: 10px;">Delete</button>
                            </form>
                        </c:if>
                        <form action="action" class="form"></form>
                        <div class="content">
                            ${n.content}
                        </div>
                        <p class="date" style="color: #cccc00">Date: ${n.dayCreate}</p>
                    </div>
                </c:forEach>
            </div>
        </div>

        <script>
            function confirmSubmit() {
                var confirmed = confirm("Are you sure you want to delete this post?");

                if (!confirmed) {
                    return false; // Prevent form submission
                }

                // Form is confirmed, continue with submission
                return true;
            }
        </script>
    </body>
</html>
