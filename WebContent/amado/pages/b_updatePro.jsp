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



<jsp:useBean id="article" class="model.Board">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	BoardDao dbPro = BoardDao.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int check = dbPro.updateArticle(article, boardid, num);
	
%>

<%
	if (check == 1) {
%>
	<script>
		alert("게시글이 수정되었습니다.");
		location.href = "<%= request.getContextPath() %>/amado/pages/b_list.jsp?pageNum=<%=pageNum%>";
	</script>
	<%-- <meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">--%>
<%
	} else {
%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%	} %>

<%-- <script>
	alert("게시글이 수정되었습니다.");
	location.href = "<%= request.getContextPath() %>/view/board/list.jsp";
</script> --%>


</body>
</html>