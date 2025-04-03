<%-- 
    Document   : author
    Created on : May 29, 2023, 12:10:59 AM
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

        <link rel="stylesheet" href="css/cssauthors.css"/>
        <style>
            .imgban {
                position: relative;
                opacity: 0.7;
            }

            .titlename {
                position: absolute;
                top: 76%;
                left: 35%;
                color: black;
                font-size: 45px;
                font-weight: bold;
            }

            .content {
                display: flex;
                flex-direction: column;
            }

            .searchform {
                position: absolute;
                top: 700px;
            }

            .type {
                padding: 5px;
                border-radius: 8px;
                margin-left: 3%;
                margin-top: 1%;
                width: 200px;
            }

            .country {
                margin-left: 3%;
            }

            .country {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                width: 16px;
                height: 16px;
                border: 2px solid #333;
                border-radius: 3px;
                outline: none;
                transition: background-color 0.3s ease;
                position: relative;
            }

            .country:checked::before {
                content: "\2713";
                display: block;
                position: absolute;
                top: 2px;
                left: 4px;
                color: white;
            }

            .country:checked {
                background-color: #ff0000;
            }

            .mid {
                min-height: 1300px;
            }

            .submit {
                background-color: #4caf50;
                color: white;
                border: none;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 8%;
            }

            .submit:hover {
                background-color: #45a049;
            }

            .submit:focus {
                outline: none;
            }


            .but2 {
                appearance: none;
                background-color: #2ea44f;
                border: 1px solid rgba(27, 31, 35, .15);
                border-radius: 6px;
                box-shadow: rgba(27, 31, 35, .1) 0 1px 0;
                box-sizing: border-box;
                color: #fff;
                cursor: pointer;
                display: inline-block;
                font-family: -apple-system,system-ui,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji";
                font-size: 14px;
                font-weight: 600;
                line-height: 20px;
                padding: 6px 16px;
                position: relative;
                text-align: center;
                text-decoration: none;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                vertical-align: middle;
                white-space: nowrap;
            }

            .but2:focus:not(:focus-visible):not(.focus-visible) {
                box-shadow: none;
                outline: none;
            }

            .but2:hover {
                background-color: #2c974b;
            }

            .but2:focus {
                box-shadow: rgba(46, 164, 79, .4) 0 0 0 3px;
                outline: none;
            }

            .but2:disabled {
                background-color: #94d3a2;
                border-color: rgba(27, 31, 35, .1);
                color: rgba(255, 255, 255, .8);
                cursor: default;
            }

            .but2:active {
                background-color: #298e46;
                box-shadow: rgba(20, 70, 32, .2) 0 1px 0 inset;
            }
        </style>
    </head>
    <body>
        <%@include file="loading.jsp" %>
        <%@include file="navbar.jsp" %>

        <div style="margin: 0 0 3% 0; display: flex; justify-content: center">
            <img src="images/murakamicover.jpg" style="max-width: 100%" class="imgban"/>
            <span class="titlename">ReadTopia/ Authors</span>
        </div>


        <div class="content mid">
            <div class="left">
                <form action="authors" method="post" class="searchform">
                    <h3>Filter</h3> <br/><select name="order" class="orderbox" style="margin-top: 5%; margin-left: 3%; font-size: larger; width: max-content; border: 2px solid black; border-radius: 8px;width: 200px">
                        <option value="0">🔠 Alphabet</option>                   
                        <option value="1">🔢 Number of Books</option>
                        <option value="2">👍 Following</option>
                        <option value="3">⬆️ Date of Birth (Up)</option>
                        <option value="4">⬇ Date of Birth (Down)</option>
                    </select><br/>
                    <input type="text" name="key" placeholder="Name, descript,.." class="type"/><br/>
                    <h4>Country</h4> <br/>
                    <input type="checkbox" name="country" value="all" checked class="country"/> All<br/>
                    <c:forEach items="${requestScope.listCountry}" var="c">
                        <input type="checkbox" name="country" value="${c}" class="country"/> ${c}<br/>
                    </c:forEach>
                    <input type="submit" value="Search" class="submit"/>

                </form>

            </div>
            <div class="right maincontent">
                <c:forEach items="${requestScope.authorlist}" var="i">

                    <a href="displayauthor?id=${i.id}"  class="author-item">
                        <img src="${i.image}" class="author-img"/>
                        <span class="name">${i.name}  <span class="subinfo">(${i.country}/ ${i.award})</span><span/><br/>

                    </a>

                </c:forEach>
            </div>
            <div id="pagination" style="margin-left: 45%; margin-top: 35px; margin-bottom: 35px">
                <button onclick="previousPage()" class="but2">Previous</button>
                <button onclick="nextPage()" class="but2">Next</button>
            </div>

        </div>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
                    var itemsPerPage = 6;
                    var currentPage = 1;

                    function displayItems() {
                        var items = document.getElementsByClassName("author-item");
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
                        var totalItems = document.getElementsByClassName("author-item").length;
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
