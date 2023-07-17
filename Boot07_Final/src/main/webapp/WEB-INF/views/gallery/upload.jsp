<%--
  Created by IntelliJ IDEA.
  User: acorn
  Date: 2023-07-03
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>gallery/upload</title>
</head>
<body>
<script>
    alert("사진 업로드에 성공했습니다.");
    location.href = "${pageContext.request.contextPath}/gallery/list";
</script>
</body>
</html>
