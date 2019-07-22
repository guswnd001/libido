<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	window.onload = function () {
		var url = document.location.href.split("/");
		console.log(url);
		
		if (url[url.length-1] == "sale.jsp") {
			var str = "";
			str += "<div>";
			str += "<div style='position: absolute; z-index: 20; width: 50%; right: 0; text-align: center; top: auto; margin-top: 6%; margin-right: 3%;'>";
			str += "<h2 style='font-size: 2vw; font-family: Group4, sans-serif; font-weight: 700; vertical-align: top; line-height: 46px; display: inline-block;'>";
			str += "최대";
			str += "<span style='font-size: 5vw; padding-left: 5px; line-height: 46px; display: inline-block; font-weight: 500; vertical-align: bottom;'>";
			str += "60%";
			str += "</span>";
			str += "할인";
			str += "</h2>";
			str += "</div>";
			str += "<video src='../video/video-ld.mp4' width='100%' muted height='initial' autoplay loop style='position: relative;'></video>";
			str += "</div>";
			
			document.getElementById("inHere").innerHTML = str;
		}
	}
</script>

<div id="inHere">
<!-- ##### Newsletter Area Start ##### -->
<section class="newsletter-area section-padding-100-0">
	<div class="container">
		<div class="row align-items-center">
			<!-- Newsletter Text -->
			<div class="col-12 col-lg-6 col-xl-7">
				<div class="newsletter-text mb-100">
					<h2>
						회원가입 <span>15% 세일</span>
					</h2>
					<p>회원 가입을 하시면 결제 및 배송 정보 저장, 주문 내역 조회, 반품 요청 및 배송 조회,</p>
					<p>위시리스트 공유하기 등의 다양한 기능을 더욱 편리하게 이용하실 수 있습니다.</p>
				</div>
			</div>
			<!-- Newsletter Form -->
			<div class="col-12 col-lg-6 col-xl-5">
				<div class="newsletter-form mb-100">
					<form action="#" method="post">
						<input type="email" name="email" class="nl-email" placeholder="당신의 E-mail">
						<input type="submit" value="가입하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ##### Newsletter Area End ##### -->
</div>

<!-- ##### Footer Area Start ##### -->
<footer class="footer_area clearfix">
	${ctxPath = pageContext.request.contextPath; ''}
	<div class="container">
		<div class="row align-items-center">
			<!-- Single Widget Area -->
			<div class="col-12 col-lg-4">
				<div class="single_widget_area">
					<!-- Logo -->
					<div class="footer-logo mr-50">
						<a href="${ctxPath}/amado/pages/index.jsp">
						<img src="${ctxPath}/amado/img/core-img/libido_logo2.png" alt="" width="180px"></a>
					</div>
					<!-- Copywrite Text -->
					<p class="copywrite">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
							All rights reserved | This template is made with 
							<i class="fa fa-heart-o" aria-hidden="true"></i> 
							by <a href="https://colorlib.com" target="_blank">HYEONJOONG KIM</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
			<!-- Single Widget Area -->
			<div class="col-12 col-lg-8">
				<div class="single_widget_area">
					<!-- Footer Menu -->
					<div class="footer_menu">
						<nav class="navbar navbar-expand-lg justify-content-end">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#footerNavContent"
								aria-controls="footerNavContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="fa fa-bars"></i>
							</button>
							<div class="collapse navbar-collapse" id="footerNavContent">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item active"><a class="nav-link"
										href="${ctxPath}/amado/pages/index.jsp">홈</a></li>
									<li class="nav-item"><a class="nav-link" 
										href="${ctxPath}/amado/pages/shop.jsp">쇼핑</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="${ctxPath}/amado/pages/product-details.jsp">디자이너</a></li>
									<li class="nav-item"><a class="nav-link" 
										href="${ctxPath}/amado/pages/cart.jsp">장바구니</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="${ctxPath}/amado/pages/checkout.jsp">바로 결제</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- ##### Footer Area End ##### -->
<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="${ctxPath}/amado/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${ctxPath}/amado/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${ctxPath}/amado/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${ctxPath}/amado/js/plugins.js"></script>
    <!-- Active js -->
    <script src="${ctxPath}/amado/js/active.js"></script>

</body>

</html>