<%-- 
    Document   : header
    Created on : May 20, 2023, 11:27:15 AM
    Author     : 84338
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>NAVBAR</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="images/favicon.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/stylenavbar.css" rel="stylesheet" />
        <style>
            .abc:hover {
                background: black;
            }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home">
                    <img id="logo" src="images/logo.png" />
                    ReadTopia
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item abc"><a class="nav-link active" aria-current="page" href="home" style="background: rgb(248, 249, 250);"><span class="navname" style="font-size: 19px;
                                                                                                                                                          ;font-weight: 400; color: black"
                                                                                                                                                          >Home</span></a></li>
                        <li class="nav-item abc"><a class="nav-link" href="allbooks?genre=all"  style="background: rgb(248, 249, 250)"><span class="navname" style="font-size: 19px;
                                                                                                                                             ;font-weight: 400; color: black">All Books</span></a></li>
                        <li class="nav-item abc"><a class="nav-link" href="authors"  style="background: rgb(248, 249, 250)"><span class="navname" style="font-size: 19px;
                                                                                                                                  ;font-weight: 400; color: black">Authors</span></a></li>
                        <li class="nav-item abc"><a class="nav-link" href="news"  style="background: rgb(248, 249, 250)"><span class="navname" style="font-size: 19px;
                                                                                                                               ;font-weight: 400; color: black">News</span></a></li>

                        <li class="nav-item nav-link" style="border: none">
                            <form action="search" class="search-box" style="font-size: 18px ;font-weight: 400; color: black">
                                <input class="search-box" type="text" name="word" placeholder="Books, Authors,..."/>
                                <input type="submit" value="🔍" />
                            </form>
                        </li>
                    </ul>
                    <form action="mybook" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <img style="width: 20px;" src="images/collection.png" />
                            My Books
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.size}</span>
                        
                        </button>
                    </form>

                    <form action="login" method="get">

                        <button class="btn btn-outline-dark login" type="submit">
                            <img style="width: 20px; border-radius: 50%;" src="images/iconaccoung.png" />
                            ${sessionScope.user==null?'Login':sessionScope.user.username}
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
