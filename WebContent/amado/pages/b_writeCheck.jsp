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


<script>
	alert("로그인 해야만 글을 작성할 수 있습니다.");
	location.href = "<%=request.getContextPath()%>/libido/list.do?pageNum=${pageNum}";
</script>


</body>
</html>