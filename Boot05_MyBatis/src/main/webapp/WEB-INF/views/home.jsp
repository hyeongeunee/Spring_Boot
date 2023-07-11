<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>home</title>
</head>
<body>
<div class="container">
    <h1>인덱스 페이지입니다.</h1>
    <ul>
        <li><a href="member/list">회원 목록보기</a></li>
    </ul>
    <h3>공지사항</h3>
    <ul>
        <c:forEach var="tmp" items="${noticeList}">
            <li>${tmp}</li>
        </c:forEach>
    </ul>
</div>
</body>
</html>