<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${check == 1 }">
<script>
	alert("정보 수정 완료되었습니다.");
	location.href = "<%=request.getContextPath()%>/libido/login.do";
</script>
</c:if>
<c:if test="${check < 1 }">
<script>
	alert("비밀번호가 다릅니다.");
	location.href = "<%=request.getContextPath()%>/libido/memUpdate.do";
</script>
</c:if>


</body>
</html>