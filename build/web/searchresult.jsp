<%-- 
    Document   : searchresult
    Created on : Jun 1, 2023, 4:00:04 PM
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
        <link rel="stylesheet" href="css/searchresult.css"/>
        <style>
            .book-item, .author-item{
                display: inline-block;
            }


            .but {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .but:hover {
                background-color: #45a049;
            }

            .hidden {
                display: none;
            }

            .hidden2 {
                display: none;
            }

            #load-more-btn, #load-more-btn2 {
                display: block;
                margin-top: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                margin-left: 45%;
            }

            #load-more-btn:hover, #load-more-btn2:hover {
                background-color: #0069d9;
            }

            .author-item {
                width: 20%;
                margin: 0 auto;
                display: inline-block;
                text-align: center;
                vertical-align: top;
            }

            .authorpic {
                width: 200px;
                height: 220px;
                border-radius: 10px;
            }

  
            
           
            .author-item {
                width: 30%;
                   
            }
            
            .nameauthor {
                color: black;
                font-size: 17px;
                font-weight: bold;
            }
            
 
        </style>
    </head>
    <body>
        <%@include file="loading.jsp" %>
        <%@include file="navbar.jsp" %>

        <h1>Result(s)</h1>
        <button onclick="toggleBooks()" class="but">Show Books</button>
        <div class="book" id="bookList">
            <c:set var="count" value="${0}"/>
            <c:forEach items="${requestScope.bookResult}">
                <c:set var="count" value="${count + 1}"/>
            </c:forEach>
            <h4 style="color: red;width: 100%; margin-left: 2%"> ${count} book(s) found: </h4>
            <c:if test="${count > 6}">
                <c:forEach items="${requestScope.bookResult}" var="b" begin="${0}" end="${5}">
                    <div class="book-item">
                        <a class="linkbook" href="displaybook?id=${b.id}">
                            <img src="${b.image}" class="bookpic"/>
                            <span class="namebook">${b.name}</span>
                        </a>
                    </div>
                </c:forEach>
                <c:forEach items="${requestScope.bookResult}" var="b" begin="${6}" end="${count-1}">
                    <div class="book-item hidden">
                        <a class="linkbook" href="displaybook?id=${b.id}">
                            <img src="${b.image}" class="bookpic"/>
                            <span class="namebook">${b.name}</span>
                        </a>
                    </div>
                </c:forEach>
                <button id="load-more-btn">Load More</button>
            </c:if>
            <c:if test="${count <= 6}">
                <c:forEach items="${requestScope.bookResult}" var="b">
                    <div class="book-item">
                        <a class="linkbook" href="displaybook?id=${b.id}">
                            <img src="${b.image}" class="bookpic"/>
                            <span class="namebook">${b.name}</span>
                        </a>
                    </div>
                </c:forEach>
            </c:if>

        </div>


        <button onclick="toggleAuthors()" class="but">Show Authors</button>
        <div class="author" id="authorList" style="display: none;">
            <c:set var="count2" value="${0}"/>
            <c:forEach items="${requestScope.authorResult}">
                <c:set var="count2" value="${count2 + 1}"/>
            </c:forEach>
            <h4 style="color: red;width: 100%; margin-left: 2%;display: block; margin-bottom: 2%"> ${count2} author(s) found: </h4>

            <c:if test="${count2 > 3}">
                <c:forEach items="${requestScope.authorResult}" var="a" begin="${0}" end="${2}">
                    <div class="author-item">
                        <a class="linkauthor" href="displayauthor?id=${a.id}">
                            <img src="${a.image}" class="authorpic"/>
                            <p class="nameauthor" >${a.name}</p>
                        </a>
                    </div>
                </c:forEach>
                <c:forEach items="${requestScope.authorResult}" var="a" begin="3" end="${count2}">
                    <div class="author-item">
                        <a class="linkauthor hidden2" href="displayauthor?id=${a.id}">
                            <img src="${a.image}" class="authorpic"/>
                            <p class="nameauthor" >${a.name}</p>
                        </a>
                    </div>
                </c:forEach>
                <button id="load-more-btn2">Load More</button>
            </c:if>
            <c:if test="${count2 <= 3}">
                <c:forEach items="${requestScope.authorResult}" var="a">
                    <div class="author-item">
                        <a class="linkauthor" href="displayauthor?id=${a.id}">
                            <img src="${a.image}" class="authorpic"/>
                            <p class="nameauthor" >${a.name}</p>
                        </a>
                    </div>
                </c:forEach>
            </c:if>
        </div>
        <div style="height: 200px;"></div>
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        <script>
            function toggleBooks() {
                var bookList = document.getElementById("bookList");

                if (bookList.style.display === "none") {
                    bookList.style.display = "block";
                } else {
                    bookList.style.display = "none";
                }
            }

            function toggleAuthors() {
                var authorList = document.getElementById("authorList");

                if (authorList.style.display === "none") {
                    authorList.style.display = "block";
                } else {
                    authorList.style.display = "none";
                }
            }


            document.getElementById("load-more-btn").addEventListener("click", function () {
                var hiddenItems = document.querySelectorAll(".hidden");
                var itemCount = hiddenItems.length;
                var nextItems = Array.from(hiddenItems).slice(0, 6);

                nextItems.forEach(function (item) {
                    item.classList.remove("hidden");
                });

                if (itemCount <= 6) {
                    document.getElementById("load-more-btn").style.display = "none";
                }
            });

            document.getElementById("load-more-btn2").addEventListener("click", function () {
                var hiddenItems = document.querySelectorAll(".hidden2");
                var itemCount = hiddenItems.length;
                var nextItems = Array.from(hiddenItems).slice(0, 3);

                nextItems.forEach(function (item) {
                    item.classList.remove("hidden2");
                });

                if (itemCount <= 3) {
                    document.getElementById("load-more-btn2").style.display = "none";
                }
            });

        </script>
    </body>
</html>
