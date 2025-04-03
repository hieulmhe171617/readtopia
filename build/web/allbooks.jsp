<%-- 
    Document   : booksite
    Created on : May 29, 2023, 11:39:25 PM
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
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/cssallbooks.css"/>
        <style>
            .filterform {
                display: inline-block;
                font-size: 19px;
                color: black;
                margin-right: 100px;
                margin-top: 30px;
                margin-bottom: 15px;
                text-transform: capitalize;
            }

            .filterform select {
                padding: 3px;
                border-radius: 8px;
            }

            .searchname {
                padding: 4px;
                border-radius: 8px;
            }

            .sub {
                background: black;
                color: white;
            }

            .sub:hover {
                background: white;
                color: black;
            }



            .imgban {
                position: relative;
                opacity: 0.7;
            }

            .titlename {
                position: absolute;
                top: 70%;
                left: 35%;
                color: black;
                font-size: 45px;
                font-weight: bold;
            }



            .but2 {
                appearance: none;
                background-color: #000000;
                border: 2px solid #1A1A1A;
                border-radius: 5px;
                box-sizing: border-box;
                color: #FFFFFF;
                cursor: pointer;
                display: inline-block;
                font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
                font-size: 19px;
                font-weight: 500;
                line-height: normal;
                margin: 0;
                min-height: 30px;
                min-width: 0;
                outline: none;
                padding: 3px 8px;
                text-align: center;
                text-decoration: none;
                transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;

                will-change: transform;
            }

            .but2:disabled {
                pointer-events: none;
            }

            .but2:hover {
                box-shadow: rgba(0, 0, 0, 0.25) 0 3px 5px;
                transform: translateY(-2px);
            }

            .but2:active {
                box-shadow: none;
                transform: translateY(0);
            }


        </style>

    </head>
    <body>
        <%@include file="loading.jsp" %>
        <%@include file="navbar.jsp" %>

        <div class="banner" style="margin: 0 0 5% 0">      
            <img src="images/slideshow/22.jpg" style="width: 100%" class="imgban"/>
            <span class="titlename">ReadTopia/ All Books</span>
        </div>

        <h2 style="text-transform: uppercase; text-align: center; color: brown;">
            ${requestScope.genre} <br/>
            <form action="allbooks" method="post" class="filterform">
                Filter <select name="choice">
                    <option value="0" ${requestScope.select==0?'selected':''}>🔠 Alphabet</option>
                    <option value="1" ${requestScope.select==1?'selected':''}>👤 Author</option>
                    <option value="2" ${requestScope.select==2?'selected':''}>⏳ Date publish (Down)</option>
                    <option value="3" ${requestScope.select==3?'selected':''}>⌛ Date publish (Up)</option>
                    <option value="4" ${requestScope.select==4?'selected':''}>✨ Average Rating (Down)</option>
                    <option value="5" ${requestScope.select==5?'selected':''}>⬇ Number of Rating (Down)</option>
                </select>
                <input type="hidden" value="${param.status}" name="status"/>
                <input type="hidden" name="genre" value="${requestScope.genre}"/>
                <input type="text" placeholder="Name of book(s)" name="namebook" class="searchname"/>
                <input type="submit" value="Search" class="searchname sub"/>
            </form>
        </h2>


        <div class="book-block">
            <div class="col-md-3 left">

                <ul><p class="genre" style="color: brown; font-size: 25px; border-bottom: 1px solid brown; width: 70%">Genre ☰</p>
                    <li style="list-style: none"><a href="allbooks?genre=all" class="genre-item" style="text-decoration: none;font-size: larger; color: #636464">All </a></li>
                        <c:forEach items="${requestScope.listgenre}" var="g">
                        <li style="list-style: none"><a href="allbooks?genre=${g.genre}" class="genre-item" style="text-decoration: none;font-size: larger; color: #636464">${g.genre} </a></li>
                        </c:forEach>
                </ul>
                <c:set value="${requestScope.genre}" var="i" />
                <ul><p class="genre" style="color: brown; font-size: 25px; border-bottom: 1px solid brown; width: 70%">Another Criteria</p>
                    <li style="list-style: none"><a href="allbooks?genre=${i}&status=new" class="genre-item" style="text-decoration: none;font-size: larger; color: #636464">New </a></li>
                    <li style="list-style: none"><a href="allbooks?genre=${i}&status=popular" class="genre-item" style="text-decoration: none;font-size: larger; color: #636464">Popular </a></li>
                    <li style="list-style: none"><a href="allbooks?genre=${i}&status=recommend" class="genre-item" style="text-decoration: none;font-size: larger; color: #636464">Recommend </a></li>
                </ul>

            </div>
            <div class="col-md-9 holdingbook">
                <c:forEach items="${requestScope.listbook}" var="i">
                    <div class="book-item">
                        <a href="displaybook?id=${i.id}" class="linkbook">
                            <img src="${i.image}" class="bookpic"/>
                            <span class="namebook">${i.name}</span>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div id="pagination" style="margin-left: 50%; margin-bottom: 30px;">
                <button onclick="previousPage()" class="but2">Previous</button>
                <button onclick="nextPage()" class="but2"> &nbsp;&nbsp;Next&nbsp;&nbsp; </button>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
                    var itemsPerPage = 16;
                    var currentPage = 1;

                    function displayItems() {
                        var items = document.getElementsByClassName("book-item");
                        var startingIndex = (currentPage - 1) * itemsPerPage;
                        var endingIndex = startingIndex + itemsPerPage;

                        for (var i = 0; i < items.length; i++) {
                            if (i >= startingIndex && i < endingIndex) {
                                items[i].style.display = "block";
                            } else {
                                items[i].style.display = "none";
                            }
                        }
                    }

                    function previousPage() {
                        if (currentPage > 1) {
                            currentPage--;
                            displayItems();
                        }
                    }

                    function nextPage() {
                        var totalItems = document.getElementsByClassName("book-item").length;
                        var totalPages = Math.ceil(totalItems / itemsPerPage);

                        if (currentPage < totalPages) {
                            currentPage++;
                            displayItems();
                        }
                    }

                    // Initialize the page
                    displayItems();
        </script>
    </body>
</html>
