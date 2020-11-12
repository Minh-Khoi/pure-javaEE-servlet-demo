<%-- 
    Document   : searchboard-user
    Created on : Jun 16, 2019, 10:05:37 PM
    Author     : USER
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.dto.User"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>


<%//@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Library</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/mobile.css">
    </head>
    <body>
        <div class="menu-img">
            <img src="image/wooden.png" alt="" >
            
        </div>
        <div class="logo-bgr">
            <h1>Welcome to Library. </h1>
            <hr>
        </div>
        <div class="main">

            <!--Table for User-->
            <div class="user_area">
                <h2>
                    Search User  <%= request.getAttribute("list") %>
                </h2>

                <input type="text" id="myInput" onkeyup="myFunction2()" placeholder="Search for names..">
                <table id="myTable">
                    <tr class="header">
                        <th style="width:10%;">Code</th>
                        <th style="width:70%;">User</th>
                        
                        <th style="width:20%;">Options </th>
                    </tr>
                    <% 
                        //List<User> list = (ArrayList<User>) request.getAttribute("list");
                    %>
                    <%--<%= list.get(0) %>--%>
                    <c:forEach var="us" items="<%= request.getAttribute("list") %>">
                    
                        <tr>
                            <td>${us.getUserID()}</td>
                            <td>${us.userSirName} &nbsp; ${us.userName}</td>
                            <th style="width:20%;">

                                <button class="myBtn">LOOK UP</button>
                                <!-- The Modal -->
                                <div id="" class="modal myModal">

                                    <!-- Modal content -->
                                    <div class="modal-content">
                                        Fullname: ${us.userName } &nbsp; ${ us.userSirName} <br>
                                        Birth Day: ${us.birthDay} <br>
                                        Phone: ${us.phoneNumber} <br>
                                        ID Number: ${us.iD_Number} <br>
                                        Address: ${us.andress}
                                    </div>

                                </div>
                            </th>
                        </tr>
                    </c:forEach>
                    
                    <!--<tr>
                        <td>2</td>
                        <td>Minh Khoi Is AWESOME</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Hiuy Phong Is AWESOME</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Minh Khoi Is AWESOME</td>
                    </tr>            -->    
                </table>
                
                <form method="post"  action="${pageContext.servletContext.contextPath}/addUser">
                    <input type="hidden" name="userID" value="${usingUser.userID}"/>
                    <button style="display: ${display}" type="submit">Add user</button>
                </form>
                
                <form method="post"  action="${pageContext.servletContext.contextPath}/updateUser">
                    <input type="hidden" name="userID" value="${usingUser.userID}"/>
                    <button style="display: ${display}" type="submit" >Update user</button>
                </form>
                
                
            </div>

        </div>
    <script src="<%= request.getContextPath()%>/javascript/main.js"></script>
    </body>
</html>
