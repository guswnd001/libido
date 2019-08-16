<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</div>
<script>
	alert("세일 항목에 추가되었습니다.");
	location.href = "<%=request.getContextPath()%>/libido/productDetails.do?code=${code}";
</script>

</body>
</html>