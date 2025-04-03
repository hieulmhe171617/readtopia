<%-- 
    Document   : homepage
    Created on : May 19, 2023, 12:11:05 AM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>READTOPIA- BOOKS REVIEWS</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="images/favicon.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/csshomepage.css"/>

        <style>
            .category {
                width: 80%;
                margin: 0 auto;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;

                padding: 20px;
                border-radius: 10px;
            }

            .cate-item {
                width: 33.33%;
                text-align: center;
                padding: 20px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
                transition: box-shadow 0.3s ease;
                text-decoration: none;
                background-color: white;

            }

            .cate-item:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }

            .icongen {
                width: 120px;
                height: auto;
                display: block;
                margin: 0 auto 10px;
            }

            .namegen {
                display: block;
                font-size: 20px;
                font-weight: bold;
                color: black;
                text-decoration: none;
            }

            .category::after {
                content: "";
                flex: auto;
            }

            @media (max-width: 767px) {
                .cate-item {
                    width: 50%;
                }
            }

            div.author {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                width: 90%;
                margin: 0 auto;
            }

            .author a {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                margin: 5px;
                text-decoration: none;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
                transition: box-shadow 0.3s ease;
            }

            .author a:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }

            .author img {
                width: 200px;
                height: 200px;
            }

            .author .namegen2 {
                margin-top: 10px;
                text-align: center;
                color: #333;
                font-size: 16px;
            }

        </style>
    </head>

    <body>
        <%@include file="loading.jsp" %>
        <%@include file="navbar.jsp" %>



        <div style="width: 100%">
            <%@include file="slideshow.jsp" %>
        </div>
        <h2 style="text-align: center">Category</h2>
        <div class="category" style="margin-top: 20px; margin-bottom: 50px;">
            <a href="allbooks?genre=Classic" class="cate-item">
                <img src="images/genre/classic.png" class="icongen"/>
                <span class="namegen">Classic</span>
            </a>
            <a href="allbooks?genre=Fiction" class="cate-item">
                <img src="images/genre/fiction.png" class="icongen"/>
                <span  class="namegen">Fiction</span>
            </a>
            <a href="allbooks?genre=Non-fiction" class="cate-item">
                <img src="images/genre/nonfic.png" class="icongen"/>
                <span  class="namegen">Non-fiction</span>
            </a>
            <a href="allbooks?genre=Detective" class="cate-item">
                <img src="images/genre/detective.png" class="icongen"/>
                <span  class="namegen">Detective</span>
            </a>
            <a href="allbooks?genre=Historical" class="cate-item">
                <img src="images/genre/history.png" class="icongen"/>
                <span  class="namegen">Historical</span>
            </a>
            <a href="allbooks?genre=Science" class="cate-item">
                <img src="images/genre/science.png" class="icongen"/>
                <span  class="namegen">Science</span>
            </a>
        </div>


        <h2 style="text-align: center">Featured Author</h2>
        <div class="author" style="margin-top: 20px; margin-bottom: 50px;">
            <a target="_blank" href="displayauthor?id=2" class="au-item">
                <img src="images/author4home/murakami.png" class="icongen2"/>
                <span class="namegen2">Murakami</span>
            </a>
            <a target="_blank" href="displayauthor?id=1" class="au-item">
                <img src="images/author4home/kei.png" class="icongen2"/>
                <span class="namegen2">Chan Ho Kei</span>
            </a>
            <a target="_blank" href="displayauthor?id=7" class="au-item">
                <img src="images/author4home/trinhlu.png" class="icongen2"/>
                <span class="namegen2">Trinh Lu</span>
            </a>
            <a target="_blank" href="displayauthor?id=16" class="au-item">
                <img src="images/author4home/cavilno.png" class="icongen2"/>
                <span class="namegen2">Calvino</span>
            </a>
            <a target="_blank" href="displayauthor?id=5" class="au-item">
                <img src="images/author4home/kafka.png" class="icongen2"/>
                <span class="namegen2">Kafka</span>
            </a>
            <a target="_blank" href="displayauthor?id=3" class="au-item">
                <img src="images/author4home/miguel.png" class="icongen2"/>
                <span class="namegen2">Miguel</span>
            </a>
        </div>

        <h2><a href="allbooks?genre=all&status=new" style="text-decoration: none; color: black">NEW BOOKS</a> </h2>
        <div class="row1">

            <c:forEach begin="${1}" end="${4}" items="${requestScope.list1}" var="l1">

                <div class="popu-item">
                    <img src="${l1.image}" class="popu-book"/>
                    <p class="book-text">${l1.name}</p>
                    <a href="displaybook?id=${l1.id}" class="detail">View Details</a>
                </div>    


            </c:forEach>
        </div>

        <h2><a href="allbooks?genre=all&status=popular" style="text-decoration: none; color: black">POPULAR BOOKS</a> </h2>

        <div class="row2">

            <c:forEach begin="${0}" end="${3}" items="${requestScope.list2}" var="l2">

                <div class="popu-item">
                    <img src="${l2.image}" class="popu-book"/>
                    <p class="book-text">${l2.name}</p>
                    <a href="displaybook?id=${l2.id}" class="detail">View Details</a>
                </div>    


            </c:forEach>
        </div>


        <h2><a href="allbooks?genre=all&status=recommend" style="text-decoration: none; color: black">RECOMMEND BOOKS</a> </h2>

        <div class="row2">

            <c:forEach begin="${0}" end="${3}" items="${requestScope.list3}" var="l3">

                <div class="popu-item">
                    <img src="${l3.image}" class="popu-book"/>
                    <p class="book-text">${l3.name}</p>
                    <a href="displaybook?id=${l3.id}" class="detail">View Details</a>
                </div>    


            </c:forEach>
        </div>




        <%@include file="footer.jsp" %>



        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>
