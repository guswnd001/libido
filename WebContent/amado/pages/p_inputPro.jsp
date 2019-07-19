<%@page import="dao.ProductDao"%>
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
%>

<jsp:useBean id="product" class="model.Product"> 
	<jsp:setProperty name="product" property="*" />
</jsp:useBean>

<%
	ProductDao manager = ProductDao.getInstance();

	manager.insertProduct(product); 
%>

<script>
	alert("상품이 등록되었습니다.");
	location.href = "<%=request.getContextPath()%>/amado/pages/p_inputForm.jsp";
</script>

</body>
</html>