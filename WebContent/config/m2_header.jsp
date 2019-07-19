<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Area Start -->
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Libido | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="<%= request.getContextPath() %>/amado/img/core-img/favicon.ico">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- Core Style CSS -->
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/amado/css/core-style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/amado/style.css">


</head>
<body>
    <!-- Search Wrapper Area Start -->
    ${ctxPath = pageContext.request.contextPath; ''}
    <div class="search-wrapper section-padding-100">
        <div class="search-close" style="padding-top: 13px;">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="키워드를 입력하세요.">
                            <button type="submit"><img src="${ctxPath}/amado/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="${ctxPath}/amado/pages/index.jsp"><img src="${ctxPath}/amado/img/core-img/libido_logo4.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

<header class="header-area clearfix">
	<!-- Close Icon -->
	<div class="nav-close" style="padding-top: 13px;">
		<i class="fa fa-close" aria-hidden="true"></i>
	</div>
	<!-- Logo -->
	<div class="logo">
		<a href="${ctxPath}/amado/pages/index.jsp"><img src="${ctxPath}/amado/img/core-img/libido_logo.png" alt=""></a>
	</div>
	<!-- Amado Nav -->
	
	<nav class="amado-nav">
		<ul>
			<li><a name="a" href="${ctxPath}/amado/pages/index.jsp">쇼핑2</a></li>
			<li><a name="a" href="${ctxPath}/amado/pages/shop.jsp">디자이너</a></li>
			<li><a name="a" href="${ctxPath}/amado/pages/product-details.jsp">코디 북</a></li>
			<li><a name="a" href="${ctxPath}/amado/pages/cart.jsp">장바구니</a></li>
			<li><a name="a" href="${ctxPath}/amado/pages/checkout.jsp">바로 결제</a></li>
			
			<%
				String admin = (String)session.getAttribute("memId");
				
				if (admin != null && admin.equals("admin")) {
			%>
				<li><a name="a" href="${ctxPath}/amado/pages/memberList.jsp">회원정보 조회</a></li>
			<%
				}
			%>
		</ul>
		
		<script>
			var list = document.getElementsByName("a");
			var url = document.location.href.split("/");
				
			console.log(url);
				
			if (url[url.length-1] == "index.jsp") { list[0].parentElement.className += "active"; }
			else if (url[url.length-1] == "shop.jsp") { list[1].parentElement.className += "active"; }
			else if (url[url.length-1] == "product-details.jsp") { list[2].parentElement.className += "active"; }
			else if (url[url.length-1] == "cart.jsp") { list[3].parentElement.className += "active"; }
			else if (url[url.length-1] == "checkout.jsp") { list[4].parentElement.className += "active"; }
			else if (url[url.length-1] == "memberList.jsp") { list[5].parentElement.className += "active"; }
		</script>
	
	</nav>
	<!-- Button Group -->
	<div class="amado-btn-group mt-30 mb-100">
		<a href="sale.jsp" class="btn amado-btn mb-15">%세일%</a> 
		<a href="#"	class="btn amado-btn active">신상품</a>
	</div>
	<!-- Cart Menu -->
	<div class="cart-fav-search mb-100">
		<a href="${ctxPath}/amado/pages/cart.jsp" class="cart-nav"><img src="${ctxPath}/amado/img/core-img/cart.png" alt=""> 
			장바구니 <span>(0)</span></a> 
		<a href="#" class="fav-nav"><img src="${ctxPath}/amado/img/core-img/favorites.png" alt=""> 
			위시리스트</a> 
		<a href="#" class="search-nav"><img	src="${ctxPath}/amado/img/core-img/search.png" alt=""> 
			검색하기</a>
			
		<!-- Already Login -->
		<c:if test="${! empty authUser }">
			<a href="${ctxPath}/login.do" class="search-nav">
			<img src="${ctxPath}/amado/img/core-img/login1.png" width="21px" height="21px" alt=""> 
			내 정보</a>
		</c:if>
		
		<!-- Not Login -->
		<c:if test="${ empty authUser }">
			<a href="${ctxPath}/login.do" class="search-nav">
			<img src="${ctxPath}/amado/img/core-img/login1.png" width="21px" height="21px" alt=""> 
			로그인</a>
			<a href="${ctxPath}/join.do" class="search-nav">
			<img src="${ctxPath}/amado/img/core-img/join.png" width="21px" height="21px" alt=""> 
			회원가입</a>
		</c:if>
		
		
			<a href="${ctxPath}/board/list.do?boardid=1" class="search-nav">
			<img src="${ctxPath}/amado/img/core-img/gongji.png" width="21px" height="21px" alt=""> 
			공지사항</a>
			<a href="${ctxPath}/board/list.do?boardid=2" class="search-nav">
			<img src="${ctxPath}/amado/img/core-img/qna.png" width="21px" height="21px" alt=""> 
			Q & A</a>
		
	</div>
	<!-- Social Button -->
	<div class="social-info d-flex justify-content-between">
		<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
	</div>
</header>
<!-- Header Area End -->