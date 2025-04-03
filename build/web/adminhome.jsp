<%-- 
    Document   : adminhome
    Created on : Jul 7, 2023, 10:04:06 PM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN- READTOPIA</title>
        <link rel="icon" type="image/x-icon" href="images/logo3.png" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <style>
            body {

                font-family: Lato, "Helvetica Neue", Helvetica, sans-serif;
            }
            .maininfo {
                display: flex;
                flex-direction: row;

            }

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

            }




            .edit-button {
                position: relative;
                z-index: 1;

            }

            .label {
                color: rgb(56, 33, 16);
                display: inline-block;
                width: 100px;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-left: 15%;
                font-size: 19px;
                font-weight: bold;
            }


            .containform {
                min-height: 363px;
                background: rgb(244, 241, 234);
                width: 500px;
                border: 3px solid black;
                margin-left: 33%;
                margin-top: 8%;
                padding: 15px;
                border-radius: 9px;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 8px 12px;
            }

            .containform2 {
                min-height: 363px;
                background: rgb(244, 241, 234);
                width: 500px;
                border: 3px solid black;
                padding: 15px;
                border-radius: 9px;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 8px 12px;
            }

            .authorform {
                width: 1000px;
            }

            .authorform2 {
                width: 1000px;
                margin-left: 280px;
                margin-top: 10px;
            }

            .inputform {

                width: 220px;
                padding: 5px;
                border-radius: 7px;
                font-size: 17px;
            }

            .descript {
                min-height: 200px;
            }

            .descriptAu {
                width: 400px;
                min-height: 250px;
            }

            .authorform input, .authorform textarea {
                width: 500px;
            }

            .authorform2 input, .authorform2 textarea {
                width: 500px;
            }

            .updatebutton {
                margin-left: 40%;
                margin-top: 25px;
                margin-bottom: 10px;
                padding: 10px;
                border-radius: 8px;
                background: black;
                color:white;
                cursor: pointer;
                font-size: larger;
            }

            .updatebutton:hover {
                background: white;
                color: black;
                font-size: larger;
            }

            .updatebuttonauthor {
                margin-left: 25%;
            }

            .labelauthor {
                width: 200px;
            }

            .heightpublic {
                height: 23px;
            }

            .selectbook {
                width: 500px;
                padding: 5px;
                border-radius: 8px;
                font-size: larger;
            }

            table {
                width: 98%;
                border-collapse: collapse;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table th,
            table td {
                padding: 10px;
                text-align: left;
                border-left: 1px solid rgba(0, 0, 0, 0.1); /* Add a soft line to separate each column */
            }

            table th:first-child,
            table td:first-child {
                border-left: none; /* Remove the line on the first column */
            }

            table th {
                background-color: #f2f2f2;
                font-family: 'Arial', sans-serif;
                font-weight: bold;
                color: #333;
            }

            table td {
                border-bottom: 1px solid #ccc;
            }

            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            table tr:hover {
                background-color: #eaf6ff;
                transition: background-color 0.3s ease;
            }


            .buttoncss {
                width: 60px;
                margin-top: 5px;
                margin-bottom: 10px;
                display: block;
                padding: 5px 9px;
                background-color: #ff6b6b;
                color: #fff;
                font-family: 'Arial', sans-serif;
                font-size: 16px;
                text-decoration: none;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .buttoncss:hover {
                background-color: #ee5253;
            }

            .chart {
                width: 50%;
            }
        </style>
    </head>
    <body>
        <%@include file="headeradmin.jsp" %>
        <div class="maininfo">
            <div class="menuleft">
                <%@include file="adminmenu.jsp" %>
            </div>
            <div class="table-info chart">
                <c:if test="${requestScope.option == 0}">
                    <div>
                        <h3>Author have at most follower</h3>
                        <p>${requestScope.mostfollow}</p>
                    </div>

                    <div>
                        <h2>TOP 5 GENRE HAVE AT MOST BOOK</h2>
                        <canvas id="myChart1"></canvas>

                    </div>

                    <div>
                        <h2>TOP 5 BOOK HAVE AT MOST RATING</h2>
                        <canvas id="myChart2"></canvas>
                    </div>

                    <div>
                        <h2>Number of Each Status Book</h2>
                        <canvas id="myChart3"></canvas>

                    </div>

                    <div>
                        <h2>Number of Post by Year</h2>
                        <canvas id="myChart4"></canvas>

                    </div>

                </c:if>

                <c:if test="${requestScope.option == 1}">
                    <h3>List of Admin</h3>
                    <h4 style="color: #3300ff">${requestScope.noti}</h4>
                    <button class="edit-button buttoncss">Add</button>
                    <div class="overlay">
                        <form action="adminmanage" class="edit-form">
                            <div class="containform2">
                                <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Add Admin Account</h3>
                                <input type="hidden" name="add" value="1" />
                                <span class="label">Name</span> <input type="text" name="username"  class="inputform" required=""/><br/>
                                <span class="label">Password</span><input type="text" name="password" class="inputform" required=""/><br/>
                                <span class="label">Email</span> <input type="email" name="email" class="inputform" required=""/><br/>
                                <input class="updatebutton" type="submit" value="Add"/>
                            </div>

                        </form>
                    </div>
                    <table class="tableadmin">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>                        
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.listAdmin}" var="a">
                            <tr>
                                <td>${a.id}</td>
                                <td>${a.username}</td>
                                <td>${a.email}</td>
                                <td>
                                    <button class="edit-button buttoncss">Edit</button>
                                </td>
                            </tr>
                            <div class="overlay">
                                <form action="adminmanage" class="edit-form">
                                    <div class="containform">
                                        <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Admin Account</h3>
                                        <span class="label">ID</span><input type="number" name="id" value="${a.id}" readonly="" class="inputform"/><br/>
                                        <span class="label">Name</span> <input type="text" name="username" value="${a.username}" class="inputform" required="" readonly=""/><br/>
                                        <span class="label">Password</span><input type="text" name="password" value="${a.password}" class="inputform" required=""/><br/>
                                        <span class="label">Email</span> <input type="email" name="email" value="${a.email}" class="inputform" required=""/><br/>
                                        <input class="updatebutton" type="submit" value="Update"/>
                                    </div>

                                </form>
                            </div>
                        </c:forEach>
                    </table>
                </c:if>
                <!-- Option 2- User account -->
                <c:if test="${requestScope.option == 2}">
                    <h3>List of User Account</h3>
                    <h4 style="color: #3300ff">${requestScope.noti}</h4>

                    <table class="tableadmin">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>  
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.listUser}" var="b">
                            <tr>
                                <td>${b.id}</td>
                                <td>${b.username}</td>
                                <td>${b.fullname}</td>
                                <td>${b.email}</td>
                                <c:if test="${b.gender == true}">
                                    <td><img src="images/male.svg" style="width: 50px; border-radius: 50%"/></td>
                                    </c:if>
                                    <c:if test="${b.gender == false}">
                                    <td><img src="images/female.svg" style="width: 50px; border-radius: 50%"/></td>
                                    </c:if>
                                <td>

                                    <form action="adminmanage" method="post" onsubmit="return confirmSubmit('form1')">                                      
                                        <input type="hidden" name="id" value="${b.id}" readonly="" /><br/>
                                        <input type="hidden" name="username" value="${b.username}"/><br/>                                  
                                        <input  type="submit" value="Delete" class="buttoncss"/>                                       
                                    </form>

                                </td>
                            </tr>

                        </c:forEach>
                    </table>
                </c:if>
                <!-- Option 3- Genre -->
                <c:if test="${requestScope.option == 3}">
                    <h3 style="margin-left: 200px;">List of Genre</h3>
                    <h4 style="color: #3300ff">${requestScope.noti}</h4>
                    <button class="edit-button buttoncss" style="margin-left: 200px">Add</button>
                    <div class="overlay">
                        <form action="genremanage" class="edit-form">
                            <div class="containform2">
                                <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Add new Genre</h3>                            
                                <span class="label">Genre</span> <input type="text" name="genre"  class="inputform" required=""/><br/>  
                                <input class="updatebutton" type="submit" value="Add"/>
                            </div>

                        </form>
                    </div>
                    <table class="tableadmin" style="margin-left: 200px;">
                        <tr>
                            <th>Genre</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.listGenre}" var="c">
                            <tr>
                                <td>${c.genre}</td>                                
                                <td>                                    
                                    <form action="genremanage" method="post" onsubmit="return confirmSubmit('form2')">                                      
                                        <input type="hidden" name="genre" value="${c.genre}" /><br/>
                                        <input class="buttoncss" type="submit" value="Delete"/>                                       
                                    </form>

                                </td>
                            </tr>

                        </c:forEach>
                    </table>
                </c:if>
                <!-- Option = 4, display author -->
                <c:if test="${requestScope.option == 4}">
                    <h3>List of Author</h3>           
                    <h4 style="color: #3300ff">${requestScope.noti}</h4>
                    <button class="edit-button buttoncss">Add</button>
                    <div class="overlay">
                        <form action="authormanage" class="edit-form">
                            <div class="containform2 authorform">
                                <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Add an Author information</h3>
                                <input type="hidden" name="add" value="1" />
                                <span class="label labelauthor">Name</span> <input type="text" name="name"  class="inputform" required=""/><br/>
                                <span class="label labelauthor">Year of Birth</span><input type="number" name="birth" class="inputform" required=""/><br/>
                                <span class="label labelauthor">Descript</span> <textarea  name="descript" class="inputform descript" required=""></textarea><br/>
                                <span class="label labelauthor">Award</span> <input type="text" name="award" class="inputform" required=""/><br/>
                                <span class="label labelauthor">Image(<a target="_blank" href="https://imgbb.com/">IMGBB</a>)</span> <input type="text" name="image" class="inputform" required=""/><br/>
                                <span class="label labelauthor">Country</span> <input type="text" name="country" class="inputform" required=""/><br/>
                                <input class="updatebutton updatebuttonauthor" type="submit" value="Add"/>
                            </div>
                        </form>
                    </div>
                    <table class="tableadmin tableauthor">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>                        
                            <th>Year of Birth</th>
                            <th>Descript</th>
                            <th>Award</th>
                            <th>Image</th>
                            <th>Country</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.listAuthor}" var="d">
                            <tr>
                                <td>${d.id}</td>
                                <td>${d.name}</td>
                                <td>${d.birthYear}</td>
                                <td class="descriptAu">${d.descript}</td>
                                <td>${d.award}</td>
                                <td>
                                    <img src="${d.image}" style="width: 200px; height: 200px;"/>
                                </td>
                                <td>${d.country}</td>
                                <td>
                                    <button class="edit-button buttoncss">Edit</button>
                                    <form action="authormanage" onsubmit="return confirmSubmit('form3')">
                                        <input type="hidden" value="1" name="delete"/>
                                        <input type="hidden" value="${d.id}" name="id"/>
                                        <input class="buttoncss" type="submit" value="Delete"/>
                                    </form>
                                </td>
                            </tr>
                            <div class="overlay">
                                <form action="authormanage" method="post" class="edit-form">
                                    <div class="containform authorform2">
                                        <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Add an Author information</h3>
                                        <input type="hidden" name="update" value="1"/>
                                        <span class="label labelauthor">ID</span> <input type="number" name="id" value="${d.id}" class="inputform" readonly=""/><br/>
                                        <span class="label labelauthor">Name</span> <input type="text" name="name" value="${d.name}" class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Year of birth</span><input type="number" name="birth" value="${d.birthYear}" class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Descript</span> <textarea  name="descript" class="inputform descript" required=""/>${d.descript}</textarea><br/>
                                        <span class="label labelauthor">Award</span> <input type="text" name="award" value="${d.award}" class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Image(<a target="_blank" href="https://imgbb.com/">IMGBB</a>)</span> <input type="text" name="image" value="${d.image}" class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Country</span> <input type="text" name="country" value="${d.country}" class="inputform" required=""/><br/>
                                        <input class="updatebutton updatebuttonauthor" type="submit" value="Update"/>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </table>
                </c:if>

                <!-- Option = 5, display book -->
                <c:if test="${requestScope.option == 5}">
                    <h3>List of Book</h3>           
                    <h4 style="color: #3300ff">${requestScope.noti}</h4>
                    <button class="edit-button buttoncss">Add</button>
                    <div class="overlay">
                        <form action="managebook" class="edit-form">
                            <div class="containform2 authorform">
                                <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Add a Book</h3>
                                <input type="hidden" name="add" value="1" />
                                <span class="label labelauthor">Name</span> <input type="text" name="name"  class="inputform" required=""/><br/>
                                <span class="label labelauthor">Author</span><select name="authorId" class="selectbook">
                                    <c:forEach items="${requestScope.listAuthor2}" var="au">
                                        <option value="${au.id}">AuthorID: ${au.id} - Name: ${au.name}</option>
                                    </c:forEach>
                                </select>
                                <span class="label labelauthor" style="width: 80px;">Genre</span>
                                <div style="width: 750px; display: inline-block;font-size: 17px;">
                                    <c:forEach items="${requestScope.listGenre2}" var="gen">
                                        ${gen.genre}<input type="checkbox" value="${gen.genre}" name="genre" style="width: 20px;"/>
                                    </c:forEach>
                                </div>

                                <span class="label labelauthor">Publisher</span> <input type="text" name="publisher" class="inputform  heightpublic" required=""><br/>
                                <span class="label labelauthor">Release Date</span> <input type="date" name="date" class="inputform" required=""/><br/>
                                <span class="label labelauthor">Image(<a target="_blank" href="https://imgbb.com/">IMGBB</a>)</span> <input type="text" name="image" class="inputform" required=""/><br/>
                                <span class="label labelauthor">Descript</span> <textarea  name="descript" class="inputform descript" required=""/></textarea><br/>
                                <span class="label labelauthor">Status</span> <select class="selectbook" name="status">
                                    <option value="Popular">Popular</option>
                                    <option value="Recommend">Recommend</option>
                                    <option value="New">New</option>
                                    <option value="">None</option>
                                </select><br/>

                                <input class="updatebutton updatebuttonauthor" type="submit" value="Add"/>
                            </div>
                        </form>
                    </div>
                    <table class="tableadmin tableauthor">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>                        
                            <th>Author</th>
                            <th>Publisher</th>
                            <th>Release Date</th>
                            <th>Image</th>
                            <th>Descript</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.listBook}" var="e">
                            <tr>
                                <td>${e.id}</td>
                                <td>${e.name}</td>
                                <td>${e.authorId} - ${e.authorname}</td>
                                <td>${e.publisher}</td>
                                <td>${e.releaseDate}</td>
                                <td>
                                    <img src="${e.image}" style="width: 120px; height: 180px;"/>
                                </td>
                                <td class="descriptAu">${e.descript}</td>
                                <td>${e.status}</td>
                                <td>
                                    <button class="edit-button buttoncss">Edit</button>
                                    <form action="managebook" onsubmit="return confirmSubmit('form4')">
                                        <input type="hidden" value="1" name="delete"/>
                                        <input type="hidden" value="${e.id}" name="id"/>
                                        <input class="buttoncss" type="submit" value="Delete"/>
                                    </form>
                                </td>
                            </tr>
                            <div class="overlay">
                                <form action="managebook" method="post" class="edit-form">
                                    <div class="containform authorform2">
                                        <h3 style="text-align: center;color: rgb(56, 33, 16);;font-weight: bolder;font-size: 25px;">Update a Book</h3>
                                        <input type="hidden" name="update" value="1" />
                                        <input type="hidden" name="id" value="${e.id}"/>
                                        <span class="label labelauthor">Name</span> <input value="${e.name}" type="text" name="name"  class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Author</span><select name="authorId" class="selectbook">
                                            <c:forEach items="${requestScope.listAuthor2}" var="au">
                                                <option ${au.id==e.authorId?'selected':''} value="${au.id}">AuthorID: ${au.id} - Name: ${au.name}</option>
                                            </c:forEach>
                                        </select>
                                        <span class="label labelauthor" style="width: 80px;">Genre</span>
                                        <div style="width: 750px; display: inline-block;font-size: 17px;">
                                            <c:forEach items="${requestScope.listGenre2}" var="gen">
                                                ${gen.genre}<input type="checkbox" value="${gen.genre}" name="genre" style="width: 20px;"/>
                                            </c:forEach>
                                        </div>
                                        <span class="label labelauthor">Publisher</span> <input value="${e.publisher}" type="text" name="publisher" class="inputform heightpublic" required=""><br/>
                                        <span class="label labelauthor">Release Date</span> <input value="${e.releaseDate}" type="date" name="date" class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Image(<a target="_blank" href="https://imgbb.com/">IMGBB</a>)</span> <input type="text" name="image" value="${e.image}" class="inputform" required=""/><br/>
                                        <span class="label labelauthor">Descript</span> <textarea  name="descript" class="inputform descript" required=""/>${e.descript}</textarea><br/>
                                        <span class="label labelauthor">Status</span> <select class="selectbook" name="status">
                                            <option ${e.status eq 'Popular'?'selected':''} value="Popular">Popular</option>
                                            <option ${e.status eq 'Recommend'?'selected':''} value="Recommend">Recommend</option>
                                            <option ${e.status eq 'New'?'selected':''} value="New">New</option>
                                            <option ${e.status eq ''?'selected':''} value="">None</option>
                                        </select><br/>

                                        <input class="updatebutton updatebuttonauthor" type="submit" value="Update"/>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </table>
                </c:if>

                <!-- Option = 6, display newfeed -->
                <c:if test="${requestScope.option == 6}">
                    <h3>List of NewsFeed</h3>           
                    <h4 style="color: #3300ff">${requestScope.noti}</h4>

                    <table class="tableadmin tableauthor">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>                        
                            <th>Fullname</th>
                            <th>Content</th>
                            <th>Day Create</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.listNews}" var="f">
                            <tr>
                                <td>${f.id}</td>
                                <td>${f.username}</td>
                                <td>${f.fullname}</td>
                                <td>${f.content}</td>
                                <td>${f.dayCreate}</td>
                                <td>
                                    <form action="newsmanage" onsubmit="return confirmSubmit('form5')">
                                        <input type="hidden" value="1" name="delete"/>
                                        <input type="hidden" value="${f.id}" name="id"/>
                                        <input class="buttoncss" type="submit" value="Delete"/>
                                    </form>
                                </td>
                            </tr>

                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>

        <%@include file="adminfooter.jsp" %>

        <!-- JS -->    
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
        </script>
        <script>
            function confirmSubmit(formId) {
            var warningMessage;
            switch (formId) {
            case 'form1':
                    warningMessage = "Are you sure to delete this user Account?";
            break;
            case 'form2':
                    warningMessage = "Are you sure to delete this Genre?";
            break;
            case 'form3':
                    warningMessage = "Are you sure to delete this Author?";
            break;
            case 'form4':
                    warningMessage = "Are you sure to delete this book?";
            break;
            case 'form5':
                    warningMessage = "Are you sure to delete this post?";
            break;
            default:
                    warningMessage = "Are you sure to delete?";
            }

            var confirmed = confirm(warningMessage);
            if (!confirmed) {
            return false; // Prevent form submission
            }

            // Form is confirmed, continue with submission
            return true;
            }

        </script>


        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            
            
            const ctx = document.getElementById('myChart1');
            new Chart(ctx, {
            type: 'bar',
                    data: {
                    labels: [
            <c:forEach items="${listNumGenre}" var="c1">
                    "${c1.genre}",
            </c:forEach>
                    ],
                            datasets: [{
                            label: '# of Genre',
                                    data: [    <c:forEach items="${listNumGenre}" var="c1">
                                    "${c1.numbook}",
            </c:forEach>],
                        backgroundColor: '#36A2EB',
                                    borderWidth: 1
                            }]
                    },
                    options: {
                    scales: {
                    y: {
                    beginAtZero: true
                    }
                    }
                    }
            });
            const ctx2 = document.getElementById('myChart2');
            new Chart(ctx2, {
            type: 'bar',
                    data: {
                    labels: [
            <c:forEach items="${topRating}" var="c2">
                    "${c2.id} - ${c2.name}",
            </c:forEach>
                                ],
                                        datasets: [{
                                                
                                        label: '# of Rating',
                                                data: [    <c:forEach items="${topRating}" var="c2">
                                                "${c2.rate}",
            </c:forEach>],
                                                backgroundColor: '#ebde34',

                                                borderWidth: 1
                                        }]
                                },
                                options: {
                                scales: {
                                y: {
                                beginAtZero: true
                                }
                                }
                                }
                        });
                        const ctx3 = document.getElementById('myChart3');
                        new Chart(ctx3, {
                        type: 'pie',
                                data: {
                                labels: [
                                        'None', 'New', 'Popular', 'Recommend'
                                ],
                                        datasets: [{
                                        label: '# of Status',
                                                data: [    <c:forEach items="${numStatus}" var="c3">
                                                "${c3.numcate}",
            </c:forEach>],
                                                borderWidth: 1
                                        }]
                                },
                                options: {
                                scales: {
                                y: {
                                beginAtZero: true
                                }
                                }
                                }
                        });
                        const ctx4 = document.getElementById('myChart4');
                        new Chart(ctx4, {
                        type: 'line',
                                data: {
                                labels: [
            <c:forEach items="${numPost}" var="c4">
                                "${c4.year}",
            </c:forEach>
                                ],
                                        datasets: [{
                                        label: '# of Post',
                                                data: [    <c:forEach items="${numPost}" var="c4">
                                                "${c4.number}",
            </c:forEach>],
                                    backgroundColor: '#34ebab',
                                                borderWidth: 15
                                        }]
                                },
                                options: {
                                scales: {
                                y: {
                                beginAtZero: true
                                }
                                }
                                }
                        });
        </script>
    </body>
</html>
