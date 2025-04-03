<%-- 
    Document   : mybooks
    Created on : Jun 26, 2023, 8:29:18 AM
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
        <link rel="stylesheet" href="css/mybooks.css"/>
        <style>
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
            }

            .edit-form {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
            }

            .edit-button {
                position: relative;
                z-index: 1;

            }

            .main {
                position: relative;
                margin-top: 30px;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 50px;
            }

            .edit-edit {
                position: absolute;
                top: 0;
                right: 0;
                background: black;
                color: white;
                border-radius: 3px;
            }

            .edit-edit:hover {
                background: white;
                color: black    ;
                border-radius: 3px;
            }




            .hidden {
                display: none;
            }

            .but {
                align-items: center;
                appearance: none;
                background-color: #FCFCFD;
                border-radius: 4px;
                border-width: 0;
                box-shadow: rgba(45, 35, 66, 0.4) 0 2px 4px,rgba(45, 35, 66, 0.3) 0 7px 13px -3px,#D6D6E7 0 -3px 0 inset;
                box-sizing: border-box;
                color: #36395A;
                cursor: pointer;
                display: inline-flex;
                font-family: "JetBrains Mono",monospace;
                height: 48px;
                justify-content: center;
                line-height: 1;
                list-style: none;
                overflow: hidden;
                padding-left: 16px;
                padding-right: 16px;
                position: relative;
                text-align: left;
                text-decoration: none;
                transition: box-shadow .15s,transform .15s;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                white-space: nowrap;
                will-change: box-shadow,transform;
                font-size: 18px;
                width: 250px;
 
                    
            }

            .button-30:focus {
                box-shadow: #D6D6E7 0 0 0 1.5px inset, rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
            }

            .button-30:hover {
                box-shadow: rgba(45, 35, 66, 0.4) 0 4px 8px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
                transform: translateY(-2px);
            }

            .button-30:active {
                box-shadow: #D6D6E7 0 3px 7px inset;
                transform: translateY(2px);

            }
        </style>
    </style>
</head>
<body>
    <%@include file="loading.jsp" %>
    <%@include file="navbar.jsp" %>

    <div class="contain-all" style="min-height: 700px;">
        <div class="menu-left col-md-3">
            <h2>My Books</h2>
            <button onclick="showDiv('div1')" class="but">All(${sessionScope.size})</button><br/>
            <button onclick="showDiv('div2')" class="but">Read(${sessionScope.count1})</button><br/>
            <button onclick="showDiv('div3')" class="but">Currently Reading(${sessionScope.count2})</button><br/>
            <button onclick="showDiv('div4')" class="but">Want To Read(${sessionScope.count3})</button><br/>

        </div>

        <div class="main-content col-md-9">
            <form action="readstatus" method="post">
                Filter <select name="filter" style="height: 30px;">
                    <option value="0">🔠 Alphabet</option>
                    <option value="1">👤 Author</option>
                    <option value="2">⏳ Date Publish (Down)</option>
                    <option value="3">⌛ Date Publish (Up)</option>
                    <option value="4">⬇ Number of Rating (Down)</option>
                    <option value="5">⬆️ Number of Rating (Up)</option>
                </select>
                <input type="text" placeholder="Name of book(s)" name="bookname" style="height: 30px;"/>
                <input type="submit" value="Search" style="height: 30px;"/>
            </form>
            
            <div id="div1" class="myDiv">
                <c:forEach items="${requestScope.cart.items}" var="i" varStatus="loop">
                    <div style="display: inline-block" class="main">
                        <button class="edit-button edit-edit" style="display: block;">
                            Edit
                        </button>
                        <a href="displaybook?id=${i.book.id}" class="book-item">
                            <img src="${i.book.image}" style="width: 130px; height: 180px;"/>
                        </a>
                    </div>


                    <div class="overlay">
                        <form class="edit-form" name="mybook" method="post">
                            <input type="hidden" name="bookID" value="${i.book.id}"/>
                            <h3 style="text-align: center">${i.book.name}</h3>
                            <span style="font-size: larger">Change Process:</span> <select name="readprocess">
                                <option value="1" style="font-size: larger">📖 Read</option>
                                <option value="2" style="font-size: larger">✒ Currently Reading</option>
                                <option value="3" style="font-size: larger">🍀 Want to Read</option>
                                <option value="4" style="font-size: larger">❌ Delete from shelf</option>
                            </select><br/>
                            <button type="submit" style="margin-left: 39%; margin-top: 5%">Change</button>
                        </form>
                    </div>
                </c:forEach>
            </div>


            <div id="div2" class="myDiv  hidden">
                <c:forEach items="${requestScope.cart.items}" var="i" varStatus="loop">
                    <c:if test="${i.status == 1}">
                        <div style="display: inline-block" class="main">
                            <button class="edit-button edit-edit" style="display: block;">
                                Edit
                            </button>
                            <a href="displaybook?id=${i.book.id}" class="book-item">
                                <img src="${i.book.image}" style="width: 130px; height: 180px;"/>
                            </a>
                        </div>


                        <div class="overlay">
                            <form class="edit-form" name="mybook" method="post">
                                <input type="hidden" name="bookID" value="${i.book.id}"/>
                                <h3 style="text-align: center">${i.book.name}</h3>
                                <span style="font-size: larger">Change Process:</span> <select name="readprocess">
                                    <option value="1" style="font-size: larger">📖 Read</option>
                                    <option value="2" style="font-size: larger">✒ Currently Reading</option>
                                    <option value="3" style="font-size: larger">🍀 Want to Read</option>
                                    <option value="4" style="font-size: larger">❌ Delete from shelf</option>
                                </select><br/>
                                <button type="submit" style="margin-left: 39%; margin-top: 5%">Change</button>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <div id="div3" class="myDiv  hidden">
                <c:forEach items="${requestScope.cart.items}" var="i" varStatus="loop">
                    <c:if test="${i.status == 2}">
                        <div style="display: inline-block" class="main">
                            <button class="edit-button edit-edit" style="display: block;">
                                Edit
                            </button>
                            <a href="displaybook?id=${i.book.id}" class="book-item">
                                <img src="${i.book.image}" style="width: 130px; height: 180px;"/>
                            </a>
                        </div>


                        <div class="overlay">
                            <form class="edit-form" name="mybook" method="post">
                                <input type="hidden" name="bookID" value="${i.book.id}"/>
                                <h3 style="text-align: center">${i.book.name}</h3>
                                <span style="font-size: larger">Change Process:</span> <select name="readprocess">
                                    <option value="1" style="font-size: larger">📖 Read</option>
                                    <option value="2" style="font-size: larger">✒ Currently Reading</option>
                                    <option value="3" style="font-size: larger">🍀 Want to Read</option>
                                    <option value="4" style="font-size: larger">❌ Delete from shelf</option>
                                </select><br/>
                                <button type="submit" style="margin-left: 39%; margin-top: 5%">Change</button>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>


            <div id="div4" class="myDiv  hidden">
                <c:forEach items="${requestScope.cart.items}" var="i" varStatus="loop">
                    <c:if test="${i.status == 3}">
                        <div style="display: inline-block" class="main">
                            <button class="edit-button edit-edit" style="display: block;">
                                Edit
                            </button>
                            <a href="displaybook?id=${i.book.id}" class="book-item">
                                <img src="${i.book.image}" style="width: 130px; height: 180px;"/>
                            </a>
                        </div>


                        <div class="overlay">
                            <form class="edit-form" name="mybook" method="post">
                                <input type="hidden" name="bookID" value="${i.book.id}"/>
                                <h3 style="text-align: center">${i.book.name}</h3>
                                <span style="font-size: larger">Change Process:</span> <select name="readprocess">
                                    <option value="1" style="font-size: larger">📖 Read</option>
                                    <option value="2" style="font-size: larger">✒ Currently Reading</option>
                                    <option value="3" style="font-size: larger">🍀 Want to Read</option>
                                    <option value="4" style="font-size: larger">❌ Delete from shelf</option>
                                </select><br/>
                                <button type="submit" style="margin-left: 39%; margin-top: 5%">Change</button>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    <script>
        const editButtons = document.getElementsByClassName('edit-button');
        const overlays = document.getElementsByClassName('overlay');
        for (let i = 0; i < editButtons.length; i++) {
            const editButton = editButtons[i];
            const overlay = overlays[i];
            editButton.addEventListener('click', function () {
                overlay.style.display = 'block';
            });
            overlay.addEventListener('click', function (event) {
                if (event.target === this) {
                    this.style.display = 'none';
                }
            });
        }




        function showDiv(divId) {
            var divs = document.getElementsByClassName("myDiv");
            for (var i = 0; i < divs.length; i++) {
                if (divs[i].id === divId) {
                    divs[i].style.display = "block";
                } else {
                    divs[i].style.display = "none";
                }
            }
        }
    </script>
</script>
</body>
</html>
