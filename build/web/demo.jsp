<%-- 
    Document   : demo
    Created on : Apr 19, 2020, 9:33:00 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello DEMO! ${pageContext.servletContext.contextPath} </h1>
        <h1>Hello DEMO2! context <%= request.getContentType()%> </h1>
    </body>
</html>
