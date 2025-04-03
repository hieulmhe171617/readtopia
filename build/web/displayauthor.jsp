<%-- 
    Document   : displayauthor.jsp
    Created on : May 31, 2023, 12:08:46 AM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="css/cssdisplayauthor.css"/>
        <style>
            /* Styling the button */
            .like-button {
                display: inline-block;
                background-color: #4267B2; /* Facebook blue color */
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Hover effect */
            .like-button:hover {
                background-color: #3b5998; /* Darker shade of blue */
            }

            /* Active (clicked) state */
            .like-button:active {
                background-color: #344e86; /* Even darker shade of blue */
            }

        </style>
    </head>
    <body>
        <%@include file="loading.jsp" %>
        <%@include file="navbar.jsp" %>
        <c:set value="${requestScope.author}" var="a" />
        <div class="maincontent">
            <div class="col-md-4 left-content">
                <img src="${a.image}" class="image"/>

                <form id="myForm" action="followauthor"  style="margin: 2% 0 0 30%">
                    <!-- Your form fields go here -->
                    <input type="hidden" value="${sessionScope.user.username}" name="username"/>
                    <input type="hidden" value="${a.id}" name="aid"/>
                    <!-- Submit button -->
                    <button type="button" class="like-button" onclick="submitForm()">${(requestScope.follow==true)?'♥️ Following':'♥️ Follow Author'}</button>
                </form>
            </div>
            <div class="col-md-8 right-content">
                <h1>${a.name}</h2>
                    <p class="subinfo">Date of birth: ${a.birthYear}</p>
                    <p class="subinfo">Born: ${a.country}</p>
                    <p class="subinfo">Award: ${a.award}</p>

                    <p class="descript"> ${a.descript}</p>

                    <div class="bookofauthor" style="width: 70%">
                        ${a.name}'s books: 
                        <c:forEach items="${requestScope.bookofauthor}" var="b">
                            <a href="displaybook?id=${b.id}" style="text-decoration: none; color: purple; font-weight: bolder"
                               >${b.name}&nbsp;&nbsp;&nbsp; </a>
                        </c:forEach>
                    </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
                        function submitForm() {
                            document.getElementById('myForm').submit();
                        }
        </script>

 
    </body>
</html>
