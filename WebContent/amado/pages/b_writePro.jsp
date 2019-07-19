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

<%	request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" class="model.Board">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	BoardDao dbPro = BoardDao.getInstance();
	
	String pageNum = request.getParameter("pageNum");	
	article.setIp(request.getRemoteAddr());
	dbPro.insertArticle(article, boardid);  
	//response.sendRedirect("list.jsp");
%>

<%= article %>
<script>
	alert("게시글이 작성되었습니다.");
	location.href = "<%=request.getContextPath()%>/amado/pages/b_list.jsp";
</script>


</body>
</html>