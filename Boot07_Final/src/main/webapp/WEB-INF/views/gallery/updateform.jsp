<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-07-03
  Time: 오후 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>gallery/updateform</title>
</head>
<body>
<div class="container">
    <h1>갤러리 수정 폼입니다.</h1>
    <form action="update" method="post">
        <input type="hidden" name="num" value="${dto.num}">
        <div>
            <label for="writer">작성자</label>
            <input type="text" id="writer" value="${dto.writer}" disabled/>
        </div>
        <div>
            <label for="caption">설명</label>
            <input type="text" name="caption" id="caption" value="${dto.caption}"/>
        </div>
        <div>
            <label for="myFile">사진</label>
            <input type="file" name="image" id="myFile" value="${dto.imagePath}">
        </div>
        <button type="submit" onclick="submitContents(this);">수정확인</button>
        <button type="reset">취소</button>
    </form>
</div>

</body>
</html>
