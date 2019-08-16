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
	
	
	<style>
		div.coodi {
			width: 125px;
			height: 150px;
			margin: 10px;
			padding: 15 20 20 20;
			border: 2px solid #fbb710;
			float: left;
		}
	
	</style>

</head>
<body>
    ${ctxPath = pageContext.request.contextPath; ''}
    <!-- Search Wrapper Area Start -->
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
    
    <!-- Favorite Wrapper Area Start -->
    <%-- <div class="fav-wrapper section-padding-100">
        <div class="fav-close" style="padding-top: 13px;">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="fav-content">
                        <form action="#" method="get">
                            <input type="search" name="fav" id="fav" placeholder="위시리스트를 입력하세요.">
                            <button type="submit"><img src="${ctxPath}/amado/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> --%>
    <!-- Favorite Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="${ctxPath}/libido/index.do"><img src="${ctxPath}/amado/img/core-img/libido_logo4.png" alt=""></a>
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
		<a href="${ctxPath}/libido/index.do"><img src="${ctxPath}/amado/img/core-img/libido_logo.png" alt=""></a>
	</div>
	<!-- Amado Nav -->
	
	<nav class="amado-nav">
		<ul>
		<c:if test="${authUser != null}">
			<li><b>${authUser.id}</b>님,<br>&nbsp;&nbsp;반갑습니다.</li>
		</c:if>
			<li><a name="a" href="${ctxPath}/libido/index.do">홈</a></li>
			<li><a name="a" href="${ctxPath}/libido/shop.do">디자이너</a></li>
			<li><a name="a" href="${ctxPath}/libido/coodibook.do">코디 북</a></li>
			<li><a name="a" href="${ctxPath}/libido/cart.do">장바구니</a></li>
			<li><a name="a" href="${ctxPath}/libido/checkout.do">바로 결제</a></li>
			
		<c:if test="${authUser != null && authUser.id eq 'admin'}">
			<li><a name="a" href="${ctxPath}/libido/memList.do">회원정보 조회</a></li>
		</c:if>
		</ul>
		
		<script>
			var list = document.getElementsByName("a");
			var url = document.location.href.split("/");
				
			console.log(url);
				
			if (url[url.length-1] == "index.do") { list[0].parentElement.className += "active"; }
			else if (url[url.length-1] == "shop.do") { list[1].parentElement.className += "active"; }
			else if (url[url.length-1] == "productDetails.do") { list[2].parentElement.className += "active"; }
			else if (url[url.length-1] == "cart.do") { list[3].parentElement.className += "active"; }
			else if (url[url.length-1] == "checkout.do") { list[4].parentElement.className += "active"; }
			else if (url[url.length-1] == "memberList.do") { list[5].parentElement.className += "active"; }
		</script>
	
	</nav>
	<!-- Button Group -->
	<div class="amado-btn-group mt-30 mb-100">
		<a href="${ctxPath}/libido/sale.do" class="btn amado-btn mb-15">%세일%</a> 
		<a href="#"	class="btn amado-btn active">신상품</a>
	</div>
	<!-- Cart Menu -->
	<div class="cart-fav-search mb-100">
		<a href="${ctxPath}/libido/cart.do" class="cart-nav"><img src="${ctxPath}/amado/img/core-img/cart.png" alt=""> 
			장바구니 <span>(0)</span></a> 
		
		
	
		
		<a href="#" class="fav-nav"><img src="${ctxPath}/amado/img/core-img/favorites.png" alt=""> 
			위시리스트</a> 
		<a href="#" class="search-nav"><img	src="${ctxPath}/amado/img/core-img/search.png" alt=""> 
			검색하기</a>
		
		
		
			
		<!-- Already Login -->
		<c:if test="${! empty authUser }">
			<a href="${ctxPath}/libido/login.do">
			<img src="${ctxPath}/amado/img/core-img/login1.png" width="21px" height="21px" alt=""> 
			내 정보</a>
		</c:if>
		
		<!-- Not Login -->
		<c:if test="${ empty authUser }">
			<a href="${ctxPath}/libido/login.do">
			<img src="${ctxPath}/amado/img/core-img/login1.png" width="21px" height="21px" alt=""> 
			로그인</a>
			<a href="${ctxPath}/libido/join.do">
			<img src="${ctxPath}/amado/img/core-img/join2.png" width="21px" height="21px" alt=""> 
			회원가입</a>
		</c:if>
		
		
			<a href="${ctxPath}/libido/list.do?boardid=1">
			<img src="${ctxPath}/amado/img/core-img/gongji.png" width="21px" height="21px" alt=""> 
			공지사항</a>
			<a href="${ctxPath}/libido/list.do?boardid=2">
			<img src="${ctxPath}/amado/img/core-img/qna.png" width="21px" height="21px" alt=""> 
			Q & A</a>
	</div>
	
	
	<div>
		<fieldset>
		<div class="w3" id="messageWindow"
			style="width: 220px; height: 300px; overflow: auto; border-radius: 0;
				   background-color: F5F7FA; padding: 20px; color: #6b6b6b; font-size: 14px;">
		</div>
		<br /> <input class="form-control" id="inputMessage" name="chat" type="text" placeholder="질문은 여기에!"
					  style="width: 220px; height: 10px; background-color: F5F7FA; padding: 20px; color: #6b6b6b; 
					  	     font-size: 14px; margin-bottom: 10px; border: none;"/> 
			   <input type="submit" value="send" onclick="send()" 
			   		 style=" display: inline-block;
    						 min-width: 220px;
   							 height:30px;
   							 color: #ffffff;
   							 border: none;
  							 border-radius: 0;
   							 padding: 0 7px;
   							 font-size: 18px;
   							 background-color: #fbb710;
   							 font-weight: 400; 
   							 margin-right: 0px; "/>
		</fieldset>
	</div>
	
<script type="text/javascript">
     var textarea = document.getElementById("messageWindow");
     var webSocket = new WebSocket(
    			'ws://211.63.89.72:9080<%=request.getContextPath()%>/weball');
     var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {     onError(event)   };
    webSocket.onopen = function(event) {     onOpen(event)    };
    webSocket.onmessage = function(event) {   onMessage(event) };
    
    function onMessage(event) {
    	textarea.innerHTML += "<div  id='you'  class='w3-white "
    	+ "w3-border w3-round-large w3-padding-small' "
    	+ "style='width:"
    	+ (event.data.length*11)+"px;'>"
    	+ event.data + "</div><br>";
         
    	textarea.scrollTop=textarea.scrollHeight;  
    }
    
    function onOpen(event) {
       textarea.innerHTML += "실시간 상담이<br>연결되었습니다.<br>";
       webSocket.send("${authUser.id}님이 입장하였습니다.");   
    }
    
    function onError(event) {     alert(event.data);   }
    
    function send() {
        textarea.innerHTML += "<div  class='w3-yellow w3-border "
        + "w3-round-large w3-padding-small' "
        + "id='me' style='width:"
        + ((inputMessage.value.length*12)+45)+"px;'>나: " 
        + inputMessage.value 
        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><br>";
        
        textarea.scrollTop = textarea.scrollHeight;
        webSocket.send("${authUser.id}:" + inputMessage.value);
		inputMessage.value = "";
	}
    
	var sendButton = document.getElementById('inputMessage');
    
    sendButton.onkeydown = function(key) {
        if(key.keyCode == 13) { send() }
    }

</script>

	<br><br><br>
	
	<!-- Social Button -->
	<div class="social-info d-flex justify-content-between">
		<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
	</div>
</header>
<!-- Header Area End -->