<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>

<form action="<%= request.getContextPath() %>/JSP/login2.jsp" method="post">
아이디<input type="text" name="id" size="10">
비밀번호<input type="password" name="pwd" size="10">
<input type="submit" value="로그인">
</form> 

</body>
</html>