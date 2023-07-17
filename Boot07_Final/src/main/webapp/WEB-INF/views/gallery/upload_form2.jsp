<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-07-03
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>gallery/upload_form</title>
    <style>
        canvas {
            border: 2px dashed #92AAB0;
            width: 650px;
            height: 400px;
            color: #92AAB0;
            text-align: center;
            vertical-align: middle;
            padding: 10px 10px 10px 10px;
            font-size: 200%;
            display: table-cell;
        }
        div {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>갤러리 업로드 폼입니다.</h3>
    <form action="${pageContext.request.contextPath}/gallery/upload" method="post" enctype="multipart/form-data">
        <div>
            <label for="caption">사진 설명</label>
            <textarea name="caption" id="caption"></textarea>
        </div>
        <div>
            <label for="image">이미지</label>
            <div id="dropArea">
                <p>이곳에 파일을 드래그하세요.</p>
                <canvas id="canvas" width="1920" height="1080"></canvas>
            </div>
            <input type="file" name="image" id="image" accept=".jpg, .png, .gif, .JPG, .JPEG, .jpeg"
                   style="display: none;">
        </div>
        <button type="submit">업로드</button>
    </form>
    <br>
</div>
<script src="${pageContext.request.contextPath }/resources/js/gura_util.js"></script>
<script>
    const dropArea = document.querySelector("#dropArea");
    const canvas = document.querySelector("#canvas");
    const context = canvas.getContext("2d");
    const fileInput = document.querySelector("#image");

    dropArea.addEventListener("dragover", (event) => {
        event.preventDefault();
        dropArea.classList.add("dragover");
    });

    dropArea.addEventListener("dragleave", (event) => {
        event.preventDefault();
        dropArea.classList.remove("dragover");
    });

    dropArea.addEventListener("drop", (event) => {
        event.preventDefault();
        dropArea.classList.remove("dragover");
        const files = event.dataTransfer.files;
        fileInput.files = files;

        const reader = new FileReader();
        reader.onload = (event) => {
            const data = event.target.result;
            const img = new Image();
            img.src = data;
            img.onload = () => {
                context.clearRect(0, 0, canvas.width, canvas.height);
                context.drawImage(img, 0, 0, canvas.width, canvas.height);
            };
        };
        reader.readAsDataURL(files[0]);
    });

    fileInput.addEventListener("change", (event) => {
        const files = event.target.files;
        const reader = new FileReader();
        reader.onload = (event) => {
            const data = event.target.result;
            const img = new Image();
            img.src = data;
            img.onload = () => {
                context.clearRect(0, 0, canvas.width, canvas.height);
                context.drawImage(img, 0, 0, canvas.width, canvas.height);
            };
        };
        reader.readAsDataURL(files[0]);
    });
</script>
</body>
</html>
