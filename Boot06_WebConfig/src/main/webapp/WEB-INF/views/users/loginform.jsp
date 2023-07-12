<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>users/loginform</title>
</head>
<body>
<div class="container">
    <form action="/users/login" method="post">
        <input type="text" name="id" placeholder="아이디 입력..." />
        <button type="submit">로그인</button>
    </form>
</div>
</body>
</html>