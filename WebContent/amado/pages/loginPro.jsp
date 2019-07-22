<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${empty errors }">
<script>
	alert("로그인 되었습니다.");
	location.href = "<%=request.getContextPath()%>/libido/login.do";
</script>
</c:if>
<c:if test="${errors.idOrPwNotMatch }">
<script>
	alert("비밀번호가 맞지 않습니다.");
	location.href = "<%=request.getContextPath()%>/libido/login.do";
</script>
</c:if>
<c:if test="${errors.id }">
<script>
	alert("아이디를 입력해주세요.")
	location.href = "<%=request.getContextPath()%>/libido/login.do";
</script>
</c:if>
<c:if test="${errors.password }">
<script>
	alert("비밀번호를 입력해주세요.")
	location.href = "<%=request.getContextPath()%>/libido/login.do";
</script>
</c:if>

</body>
</html>