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

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("memId");
	String password = request.getParameter("password");
	
	MemberDao manager = new MemberDao();
	int x = manager.deleteMember(id, password);
	
	if (x == 1) {
		session.invalidate();
%>
		<script>
		alert("회원탈퇴 되었습니다.");
		location.href = "<%= request.getContextPath() %>/amado/pages/loginForm2.jsp";
		</script>
<%
	} else if (x == 0) {
%>
		<script>
			alert("비밀번호가 맞지 않습니다.")
			history.go(-1);
		</script>
<%  
	}  
%>

</body>
</html>