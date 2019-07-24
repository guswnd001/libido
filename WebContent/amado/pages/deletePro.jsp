<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${check == 1 }">
	<script>
		alert("회원탈퇴 되었습니다.");
		location.href = "<%= request.getContextPath() %>/libido/login.do";
	</script>
</c:if>
<c:if test="${check < 1 }">
	<script>
		alert("비밀번호가 맞지 않습니다.")
		location.href = "<%= request.getContextPath() %>/libido/memDelete.do";
	</script>
</c:if>

</body>
</html>