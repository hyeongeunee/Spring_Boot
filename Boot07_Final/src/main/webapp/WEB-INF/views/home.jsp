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
    <c:choose>
        <c:when test="${empty sessionScope.id}">
            <a href="/users/loginform">로그인</a>
            <a href="/users/signup_form">회원가입</a>
        </c:when>
        <c:otherwise>
            <p>
                <a href="/users/info">${id}</a> 로그인중...
                <a href="/users/logout">로그아웃</a>
            </p>
        </c:otherwise>
    </c:choose>
    <h1>인덱스 페이지입니다.</h1>
    <ul>
        <li><a href="/cafe/list">카페 글 목록보기</a></li>
        <li><a href="/file/list">자료실 목록보기</a></li>
        <li><a href="/gallery/list">갤러리 목록보기</a></li>
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