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

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	BoardDao board = BoardDao.getInstance(); 
	int check = board.deleteArticle(num, passwd);
%>

<%
	if (check == 1) {
%>
	<script>
		alert("게시글이 삭제되었습니다.");
		location.href = "<%= request.getContextPath() %>/amado/pages/b_list.jsp?pageNum=<%=pageNum%>";
	</script>
	<%-- <meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>"> --%>	
<%
	} else {
%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%	} %>

</body>
</html>