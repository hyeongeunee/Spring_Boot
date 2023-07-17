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
    <style>
        #dropZone {
            width: 400px;
            height: 400px;
            border: 2px dashed red;
            border-radius: 20px;
            /*  아래는 자식 contents 를 상하좌우로 가운데 정렬하기 위한 css  */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* img 요소에 적용할 css */
        #preview {
            display: none;
            object-fit: cover;
            width: 100%;
            height: 100%;
            border-radius: 20px;
        }

        #image {
            display: none;
        }
    </style>
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
            <label for="image"></label>
            <input type="file" name="image" id="image" accept=".jpg, .png, .gif, .JPG, .JPEG, .jpeg"/>
        </div>
    </form>
    <%-- drag and drop 을 할 div --%>
    <a href="javascript:" id="dropZoneLink" title="업로드할 이미지 선택">
        <div id="dropZone">
            <p> Drag & Drop or Click here ! </p>
            <img src="" id="preview"/>
        </div>
    </a><br>
    <button id="submitBtn">업로드</button>
</div>
<script src="${pageContext.request.contextPath }/resources/js/gura_util.js"></script>
<script>
    document.querySelector("#submitBtn").addEventListener("click", () => {
        document.querySelector("form").submit();
    });

    // dropZone 을 클릭해도 파일이 선택창을 띄우도록 한다.
    document.querySelector("#dropZoneLink").addEventListener("click", () => {
        // input type = "file" 을 강제 클릭시킨다.
        document.querySelector("#image").click();
    });

    // dropZone div 의 참조값 얻어오기
    const dropZone = document.querySelector("#dropZone");
    // 이벤트 리스너 함수 등록하기
    dropZone.addEventListener("dragover", (e) => {
        e.preventDefault();
    })
    dropZone.addEventListener("drop", (e) => {
        e.preventDefault();
        // drop 된 파일의 정보 얻어오기
        const files = e.dataTransfer.files;
        console.log(files[0]);
        // drop 된 파일의 정보를 조사해서 이미지 파일이 아니라면 함수를 여기서 종료시키기
        const type = files[0].type;

        if (type !== "image/png" && type !== "image/jpg" && type !== "image/gif") {
            alert("이미지 파일을 drop 하세요 !");
            return;
        }

        if (files.length > 0) {
            // 파일로부터 데이터를 읽을 객체
            const reader = new FileReader();
            // 로딩이 완료(파일데이터를 모두 읽었을 때 )되었을 때 실행할 함수 등록
            reader.onload = (event) => {
                // 읽은 파일 데이터 얻어내기
                const data = event.target.result;
                //console.log(data);
                // 이미지 요소에 data 를 src 속성의 value 로 넣기
                // img 요소에 이미지를 출력하고 보이게 하고 p 요소를 숨긴다.
                document.querySelector("#preview").setAttribute("src", data);
                document.querySelector("#preview").style.display = "block";
                document.querySelector("#dropZone p").style.display = "none";
            };
            // 파일을 DataURL 형식의 문자열로 읽기
            reader.readAsDataURL(files[0]);

            // 선택된 파일의 정보를 input type = "file" 요소에 넣어주기
            document.querySelector("#image").files = files;
        }
    });

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
                document.querySelector("#preview").style.display = "block";
                document.querySelector("#dropZone p").style.display = "none";
            };
            // 파일을 DataURL 형식의 문자열로 읽기
            reader.readAsDataURL(files[0]);
        }
    });
</script>
</body>
</html>
