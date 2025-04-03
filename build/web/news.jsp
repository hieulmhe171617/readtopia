<%-- 
    Document   : news
    Created on : May 31, 2023, 1:02:07 AM
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
        <title>READTOPIA - NEWSFEED</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="images/favicon.png" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/newfeedcss.css"/>
        <script src="ckeditor/ckeditor.js"></script>
        <style>
            .iconnav:hover {
                color: inherit;
                text-decoration: none;

            }

            .useritem {
                text-decoration: none;
                color: #b02a37;
                font-weight: 500;
            }

            .useritem:hover {
                text-decoration: none;
                color: darkblue;
            }

            .useritem {
                
                border-left: 2px solid black;
                

            }
        </style>
    </head>
    <body>
        <%@include file="loading.jsp" %>
        <div class="all">
            <div id="navbar" class="nav" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px;
                 border-bottom: 2px solid black;">
                <a href="home" style="text-decoration: none; font-size: 20px; color: black;padding: 5px;">
                    <img src="images/logo.png" class="logo"/>
                    ReadTopia
                </a>

                <a href="news" class="iconnav">🏚 </a>
                <form action="news" method="post">
                    <input type="submit" value="🔍" class="search-icon"/>
                    <input name="keyword" type="text" placeholder="Typing to search post..." class="search-box"/>

                </form>



                <a href="viewinfo?id=${sessionScope.user.username}" class="login" style="width: 72px;  margin-left: 500px; margin-top: 15px">
                    <c:if test="${sessionScope.user.gender==true}">
                        <img src="images/male.jpg" style="width: 100%; border-radius: 50%;"/>
                    </c:if>
                    <c:if test="${sessionScope.user.gender==false}">
                        <img src="images/female.jpg" style="width: 100%; border-radius: 50%;"/>
                    </c:if>
                </a>
            </div>

            <div class="content">
                <div class="col-md-3 filterpost" style="box-shadow: rgba(0, 0, 0, 0.15) 2.4px 2.4px 3.2px; margin-top: 80px;">
                    <h3 style="color: red; text-align: center">Filter&nbsp;&nbsp;&nbsp;</h3>
                    <form action="news" method="post">
                        <span style="display: inline-block; width: 130px;">Categories of post</span> <select name="category" style="padding: 5px; border-radius: 5px;">
                            <option value="0">Newest Post</option>
                            <option value="1">Oldest Post</option>
                            <option value="2">Longest Post</option>
                            <option value="3">Shortest Post</option>
                            <option value="4">Most Interactive Post</option>

                        </select><br/>
                        <span style="display: inline-block; width: 80px; margin-top: 15px;">From Year:</span><input type="number" name="yearfrom" min="2003" max="2023" style="padding: 5px; border-radius: 5px;"/>
                        <span style="display: inline-block; width: 70px; margin-top: 15px;">To Year:</span> <input type="number" name="yearto" min="2003" max="2023" style="padding: 5px; border-radius: 5px;"/>

                        <br/><input type="submit" value="Search" style="margin-left: 130px; margin-top: 15px; padding: 5px; border-radius: 8px;"/>
                    </form>
                    <img src="images/leftquote.png" style="width: 100%"/>
                </div>
                <div class="col-md-7 displaypost" style="margin-top: 70px; margin-left: 1%;background: whitesmoke;">
                    <button onclick="toggleForm()" style="font-size: larger; padding: 10px; border-radius: 9px;">🖋 Write something...</button>
                    <form action="newaction" id="myForm" style="display: none;">
                        <p>Use link of pictures/ Get by <a href="https://imgbb.com/" style="text-decoration: none">IMGBB<a/></p>
                        <input type="hidden" name="username" value="${sessionScope.user.username}"/>

                        <textarea name="editor"></textarea>
                        <input type="submit" value="Post"/>
                    </form>

                    <div class="showpost" style="margin-top: 50px;">
                        <c:forEach items="${requestScope.listP}" var="p">
                            <div class="apost" style="box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px, rgba(17, 17, 26, 0.1) 0px 24px 80px; padding: 10px 20px 10px 20px; border-radius: 10px;">
                                <a href="viewinfo?id=${p.username}" style="width: 200px; height: 100px; margin-top: 30px; margin-bottom: 50px; font-size: larger; font-weight: bold; color: #666666" onmouseover="this.style.textDecoration = 'none';" onmouseout="this.style.textDecoration = 'none';">
                                    <img src="images/femalecat.jpg" style="width: 70px; border-radius: 50%"/>
                                    &nbsp;${p.username}
                                </a>

                                ${p.content}

                                <h6 style="color: #cccc00">Date: ${p.dayCreate}</h6>
                                <div class="commentPost">
                                    <h6>Comment:</h6>
                                    <c:forEach items="${requestScope.listC}" var="c">
                                        <c:if test="${p.id == c.newsId}">
                                            <a href="viewinfo?id=${c.username}" onmouseover="this.style.textDecoration = 'none';" onmouseout="this.style.textDecoration = 'none';"
                                               style="text-decoration: none; margin-left: 3%; ">
                                                <img src="images/catcold.jpg" style="width: 50px; border-radius: 50%"/>
                                                ${c.username}
                                            </a>
                                            <p style="display: inline-block">: ${c.reply}</p><br/>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <form action="newaction" style="margin-top: 20px;">
                                    <input type="hidden" name="PostID" value="${p.id}"/>
                                    <input type="hidden" name="username" value="${sessionScope.user.username}"/>
                                    <input placeholder="Typing comment here!" type="text" name="commentP" style="width: 500px; height: 38px; padding: 10px; border-radius: 8px;"/>
                                    <input type="submit" value="Add comment" style="height: 38px; border-radius: 8px;"/>
                                </form>
                            </div>
                        </c:forEach>
                    </div>    
                </div>
                <div class="col-md-2">
                    <div class="otherpeople">
                        <h4 style="margin-top: 80px;">Suggest</h4>

                        <c:forEach items="${requestScope.listU}" var="o" begin="${1}" end="${5}">
                            <c:if test="${o.username != sessionScope.user.username}" >
                                <a href="viewinfo?id=${o.username}" class="useritem">
                                    <c:if test="${o.gender == true}">
                                        <img src="images/male.jpg" style="width: 70px; border-radius: 50%"/>
                                        ${o.username}<br/>
                                    </c:if>
                                    <c:if test="${o.gender == false}">
                                        <img src="images/female.jpg" style="width: 70px; border-radius: 50%"/>
                                        ${o.username}<br/>
                                    </c:if>
                                </a>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <script>
            CKEDITOR.replace('editor');

            function toggleForm() {
                var form = document.getElementById("myForm");
                if (form.style.display === "none") {
                    form.style.display = "block";
                } else {
                    form.style.display = "none";
                }
            }

        </script>
    </body>
</html>
