<!DOCTYPE html>
<html lang="kr" xmlns:th=":http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 게시글 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<table class="tb_col">
    <tr>
        <td>작성자</td>
        <td>제목</td>
        <td>작성일시</td>
    </tr>

    <tr th:each="board : ${boardList}">
        <td th:text="${board.getNickname}"></td>
        <td th:text="${board.getTitle}"></td>
        <td th:text="${board.getCreatedAt}"></td>
        <form th:action="@{/admin/boardList/{id}/status(id=${board.getId})}" method="GET">
            <td><button class="btn btn-primary">숨김</button></td>
        </form>
        <form name="deleteButton" th:action="@{/admin/boardList/{id}/delete(id=${board.getId})}" method="GET">
            <input type="hidden" name="boardId" th:value="${board.getId}">
            <td>

                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteABoardModal">삭제</button>
            </td>
        </form>

        <div class="modal fade" id="deleteABoardModal" tabindex="-1" aria-labelledby="deleteABoardModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered"> <!-- Modal 중앙 배치 "modal-dialog-centered"-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="deleteABoardModalLabel">게시글 삭제 확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        게시글과 관련 댓글이 DB에서 완전히 삭제됩니다.<br>
                        정말 삭제하시겠습니까 ?
                        <img id="deleteUrl" src="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-danger" onclick="deleteUrl(deleteButton, ${board.getId})">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </tr>

</table>




<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
    function deleteUrl(formElement, boardId) {
        formElement.action = "/admin/boardList/" + boardId + "/delete";
        formElement.method = "GET";
        formElement.submit();
    }
</script>
</body>

</html>