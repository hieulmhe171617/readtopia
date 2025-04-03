<%-- 
    Document   : displaybook
    Created on : May 30, 2023, 12:56:11 AM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link rel="stylesheet" href="css/cssdisplaybook.css"/>
        <script src="ckeditor/ckeditor.js"></script>
        <style>
            .but {
                border: none;
                background-color: transparent;
                color: brown;
                text-decoration: none;
                padding: 0;
                cursor: pointer;
                margin-left: 72%
            }

            .hidden {
                display: none;
            }
            

        </style>
    </head>
    <body>
        <%@include file="loading.jsp" %>
        <%@include file="navbar.jsp" %>
        <c:set value="${requestScope.book}" var="b" />
        <c:set value="${requestScope.author}" var="a" />   

        <div class="content">
            <div class="left-content col-md-3">
                <img src="${b.image}" class="image"/>

                <form action="readstatus">
                    <input type="hidden" name="bookID" value="${b.id}"/>
                    <div class="choice">
                        <select class="choice-detail" name="status">
                            <option value="1">📖 Read</option>
                            <option value="2">✒ Currently Reading</option>
                            <option value="3">🍀 Want to Read</option>
                        </select>
                    </div>

                    <input type="submit" value="SAVE" class="process"
                           style="margin-top: 5%; margin-left: 29%; border-radius: 6px;"/>
                </form>

                <form action="bookprocess" id="rateform">
                    <div class="rating">
                        <input type="hidden" value="${b.id}" name="bookID" />
                        <input type="hidden" value="${sessionScope.user.id}" name="userID" />
                        <input type="radio" value="1" name="rate"  onclick="rateform()" ${requestScope.rating=='1'?'checked':''}/> 1⭐
                        <input type="radio" value="2" name="rate" onclick="rateform()" ${requestScope.rating=='2'?'checked':''}/> 2⭐ 
                        <input type="radio" value="3" name="rate" onclick="rateform()" ${requestScope.rating=='3'?'checked':''}/> 3⭐ 
                        <input type="radio" value="4" name="rate" onclick="rateform()" ${requestScope.rating=='4'?'checked':''}/> 4⭐ 
                        <input type="radio" value="5" name="rate" onclick="rateform()" ${requestScope.rating=='5'?'checked':''}/> 5⭐ 

                    </div>
                </form>
            </div>

            <div class="right-content col-md-9">
                <h1>${b.name}</h1>
                <i><a href="displayauthor?id=${a.id}" class="author-name">(${a.name})</a></i>
                <c:if test="${requestScope.averate != '0.0'}">
                    <h5 style="color: #666600">${requestScope.averate}/5 ⭐ <span style="color: grey; font-size: smaller">(${requestScope.numberrate} ratings)</span> </h5>
                </c:if>
                <div id="loadmore">
                    <p class="descript">${b.descript} </p>
                    <button id="load-more-btn" class="but">Load More 》</button>
                </div>
                <p class="first-sub sub">Genre: 
                    <c:forEach items="${requestScope.genreofbook}" var="g">
                        <a href="allbooks?genre=${g.genre}" style="text-decoration: none; color: brown"> ${g.genre} &nbsp;</a>
                    </c:forEach>
                </p>
                <p class="sub">Publisher: ${b.publisher}</p>
                <p class="sub">Release Date: ${b.releaseDate}</p>


                <div class="suggest-book", style="margin-top: 8%;border-top: 1px solid grey">
                    <h3>Maybe you likes: </h3>
                    <c:forEach begin="${2}" end="${6}" items="${requestScope.listBook}" var="i">
                        <a href="displaybook?id=${i.id}" style="text-decoration: none">
                            <img src="${i.image}" style="width: 150px; height: 220px;
                                 margin: 2%;"/>  
                        </a>
                    </c:forEach>
                </div>

                <div>
                    <div class="display-comment">
                        <h3 style="margin-bottom: 3%">Reviews</h3>
                        <c:set var="count" value="${0}" />
                        <c:forEach items="${requestScope.listComment}">
                            <c:set var="count" value="${count + 1}" />
                        </c:forEach>
                        <h5 style="color: blue">${count} comment(s)</h5>

                        <c:if test="${count > 3 && sessionScope.idFlag != b.id}">
                            <c:forEach items="${requestScope.listComment}" var="c" begin="${0}" end="${2}">
                                <div>
                                    <h4 style="color: darkgreen; border-top: 1px solid #3e3e3e; padding: 5px;">
                                        <img src="images/avtcomment2.png" style="width: 50px;"/> 
                                        <a style="text-decoration: none;color: darkgreen" href="viewinfo?id=${c.username}" target="_blank">${c.username}</a>
                                    </h4>

                                    ${c.comment}
                                    <form action="displaybook" method="post" style="display: inline-block">
                                        <input type="hidden" name="userID" value="${c.id}" />
                                        <input type="hidden" name="bookID" value="${b.id}" />
                                        <input type="submit" value="Show replies" style="border-radius: 6px; padding: 2px; background: black; color:white;  width: 100px;"/>
                                    </form>
                                    <button onclick="myFunction(${c.id})" style="border-radius: 6px; padding: 2px; background: black; color:white;  width: 70px">
                                        Reply
                                    </button>
                                    <form action="comment" id="myDIV${c.id}" style="display: none">
                                        <input type="hidden" name="bookID" value="${b.id}"/>
                                        <input type="hidden" name="userID" value="${c.id}"/>
                                        <input type="hidden" name="username" value="${sessionScope.user.username}"/>

                                        <textarea name="subcomment" id="subcomment_${c.id}"></textarea>
                                        <input type="submit" value="Comment" />
                                    </form>

                                    <div class="display-subcomment" style="position: relative; left: 80px; top: 10px;margin-bottom: 80px;">

                                        <c:forEach items="${sessionScope.listSub}" var="sub">
                                            <c:if test="${sub.userID == c.id && sub.bookID == c.bookID}">
                                                <h6  class="viewinfosub" style="color: red">
                                                    <img src="images/avtcomment.png" style="width: 39px;"/> 
                                                    <a style="text-decoration: none; color: red" target="_blank" href="viewinfo?id=${sub.username}">${sub.username}</a>
                                                </h6>
                                                ${sub.subcomment}
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </c:forEach>


                            <c:forEach items="${requestScope.listComment}" var="c" begin="${3}" end="${count-1}">
                                <div class="hidden">
                                    <h4 style="color: darkgreen; border-top: 1px solid #3e3e3e; padding: 5px;">
                                        <img src="images/avtcomment2.png" style="width: 50px;"/> 
                                        <a style="text-decoration: none; color: darkgreen" target="_blank" href="viewinfo?id=${c.username}">${c.username}</a>
                                    </h4>

                                    ${c.comment}
                                    <form action="displaybook" method="post" style="display: inline-block">
                                        <input type="hidden" name="userID" value="${c.id}" />
                                        <input type="hidden" name="bookID" value="${b.id}" />
                                        <input type="submit" value="Show replies" style="border-radius: 6px; padding: 2px; background: black; color:white;  width: 100px;"/>
                                    </form>
                                    <button onclick="myFunction(${c.id})" style="border-radius: 6px; padding: 2px; background: black; color:white;  width: 70px">
                                        Reply
                                    </button>
                                    <form action="comment" id="myDIV${c.id}" style="display: none">
                                        <input type="hidden" name="bookID" value="${b.id}"/>
                                        <input type="hidden" name="userID" value="${c.id}"/>
                                        <input type="hidden" name="username" value="${sessionScope.user.username}"/>

                                        <textarea name="subcomment" id="subcomment_${c.id}"></textarea>
                                        <input type="submit" value="Comment" />
                                    </form>

                                    <div class="display-subcomment" style="position: relative; left: 80px; top: 10px;margin-bottom: 80px;">

                                        <c:forEach items="${sessionScope.listSub}" var="sub">
                                            <c:if test="${sub.userID == c.id && sub.bookID == c.bookID}">
                                                <h6  style="color: red">
                                                    <img src="images/avtcomment.png" style="width: 39px;"/> 
                                                    <a style="text-decoration: none; color: red" target="_blank" href="viewinfo?id=${sub.username}">${sub.username}</a>
                                                </h6>
                                                ${sub.subcomment}
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </c:forEach>
                            <button id="load-more-btn2">Load More</button>
                        </c:if>




                        <c:if test="${count <= 3 || (count >3 && sessionScope.idFlag == b.id)}">
                            <c:forEach items="${requestScope.listComment}" var="c">
                                <div>
                                    <h4  style="color: darkgreen; border-top: 1px solid #3e3e3e; padding: 5px;">
                                        <img src="images/avtcomment2.png" style="width: 50px;"/> 
                                        <a style="text-decoration: none; color: darkgreen" href="viewinfo?id=${c.username}" target="_blank">${c.username}</a>
                                    </h4>

                                    ${c.comment}
                                    <form action="displaybook" method="post" style="display: inline-block">
                                        <input type="hidden" name="userID" value="${c.id}" />
                                        <input type="hidden" name="bookID" value="${b.id}" />
                                        <input type="submit" value="Show replies" style="border-radius: 6px; padding: 2px; background: black; color:white;  width: 100px;"/>
                                    </form>
                                    <button onclick="myFunction(${c.id})" style="border-radius: 6px; padding: 2px; background: black; color:white;  width: 70px">
                                        Reply
                                    </button>
                                    <form action="comment" id="myDIV${c.id}" style="display: none">
                                        <input type="hidden" name="bookID" value="${b.id}"/>
                                        <input type="hidden" name="userID" value="${c.id}"/>
                                        <input type="hidden" name="username" value="${sessionScope.user.username}"/>

                                        <textarea name="subcomment" id="subcomment_${c.id}"></textarea>
                                        <input type="submit" value="Comment" />
                                    </form>

                                    <div class="display-subcomment" style="position: relative; left: 80px; top: 10px;margin-bottom: 80px;">

                                        <c:forEach items="${sessionScope.listSub}" var="sub">
                                            <c:if test="${sub.userID == c.id && sub.bookID == c.bookID}">
                                                <h6  style="color: red">
                                                    <img src="images/avtcomment.png" style="width: 39px;"/> 
                                                    <a style="text-decoration: none; color: red" href="viewinfo?id=${sub.username}" target="_blank">${sub.username}</a>
                                                </h6>
                                                ${sub.subcomment}
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </div>

                    <div class="post-comment" style="margin-right: 2%; margin-top: 6%">
                        <h5>Write your review: </h5>
                        <p>(Notices for image: you can use link of pictures / make link your pictures from computer via our sponsor - <a href="https://imgbb.com/" target="blank">IMGBB</a>)</p>
                        <form action="comment" method="post">
                            <textarea name="editor"></textarea>
                            <input type="hidden" name="bookID" value="${b.id}" />
                            <input type="submit" value="POST" style="width: 100%;padding: 8px; font-weight: 500"/>
                        </form>
                    </div>
                </div>

            </div>


        </div>

        <%@include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
                                        CKEDITOR.replace('editor');
                                        CKEDITOR.replace('subcomment');

                                        function myFunction(n) {
                                            var x = document.getElementById("myDIV" + n);
                                            if (x.style.display === "none") {
                                                x.style.display = "block";
                                                CKEDITOR.replace('subcomment_' + n); // Replace the CKEditor instance for the current subcomment
                                            } else {
                                                x.style.display = "none";
                                            }
                                        }


                                        function rateform() {
                                            var form = document.getElementById("rateform");
                                            form.submit();
                                        }
        </script>
        <script>
            var contentDiv = document.getElementById("loadmore");
            var paragraphElement = contentDiv.querySelector("p");
            var paragraphText = paragraphElement.innerHTML;

// Define the desired character limit to display initially
            var characterLimit = 750;

// Check if the paragraph text exceeds the character limit
            if (paragraphText.length > characterLimit) {
                // Extract the initial portion of the paragraph
                var initialContent = paragraphText.slice(0, characterLimit);
                paragraphElement.innerHTML = initialContent;

                // Show the "Load More" button
                var loadMoreBtn = document.getElementById("load-more-btn");
                loadMoreBtn.style.display = "block";

                loadMoreBtn.addEventListener("click", function () {
                    // Show the full paragraph content
                    paragraphElement.innerHTML = paragraphText;

                    // Hide the "Load More" button
                    loadMoreBtn.style.display = "none";
                });
            }

        </script>

        <script>
            document.getElementById("load-more-btn2").addEventListener("click", function () {
                var hiddenItems = document.querySelectorAll(".hidden");
                var itemCount = hiddenItems.length;
                var nextItems = Array.from(hiddenItems).slice(0, 3);

                nextItems.forEach(function (item) {
                    item.classList.remove("hidden");
                });

                if (itemCount <= 3) {
                    document.getElementById("load-more-btn2").style.display = "none";
                }
            });

        </script>
    </body>
</html>
