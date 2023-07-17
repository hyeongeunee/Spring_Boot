<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-07-03
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>gallery/upload_form</title>
</head>
<body>
<div class="container">
    <h3>갤러리 업로드 폼입니다.</h3>
    <form action="${pageContext.request.contextPath}/gallery/upload" method="post" enctype="multipart/form-data">
        <div>
            <label for="caption">사진 설명</label>
            <input type="text" name="caption" id="caption">
        </div>
        <div>
            <label for="image">이미지</label>
            <input type="file" name="image" id="image" accept=".jpg, .png, .gif, .JPG, .JPEG, .jpeg"/>
        </div>
        <button type="submit">업로드</button>
    </form>
    <br>
    <img alt="미리보기" id="preview">
</div>
<script src="${pageContext.request.contextPath }/resources/js/gura_util.js"></script>
<script>
    document.querySelector("#image").addEventListener("change", function (e) {
        // 선택된 파일 객체를 얻어낸다.
        const files = e.target.files;
        // 만일 파일 데이터가 존재한다면
        if (files.length > 0) {
            // 파일로부터 데이터를 읽을 객체
            const reader = new FileReader();
            // 로딩이 완료(파일데이터를 모두 읽었을 때 )되었을 때 실행할 함수 등록
            reader.onload = (event) => {
                // 읽은 파일 데이터 얻어내기
                const data = event.target.result;
                //console.log(data);
                // 이미지 요소에 data 를 src 속성의 value 로 넣기
                document.querySelector("#preview").setAttribute("src", data);
            };
            // 파일을 DataURL 형식의 문자열로 읽기
            reader.readAsDataURL(files[0]);
        }
    });
</script>
</body>
</html>
