<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="">
<script>
	alert("게시글이 작성되었습니다.");
	location.href = "<%=request.getContextPath()%>/libido/list.do";
</script>
</c:if>

</body>
</html>