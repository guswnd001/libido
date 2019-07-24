<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Product Details Area Start -->
<div class="single-product-area section-padding-100 clearfix">
	<div class="container-fluid">

		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mt-50">
						<li class="breadcrumb-item"><a href="${ctxPath}/libido/index.do">홈</a></li>
						<li class="breadcrumb-item"><a href="${ctxPath}/libido/shop.do">디자이너</a></li>
						<li class="breadcrumb-item"><a href="#">${product.brand }</a></li>
						<li class="breadcrumb-item"><a href="#">${product.pkind }</a></li>
						<li class="breadcrumb-item active" aria-current="page">${product.pname }</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-12 col-lg-7">
				<div class="single_product_thumb">
					<div id="product_details_slider" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li class="active" data-target="#product_details_slider"
								data-slide-to="0"
								style="background-image: url(${ctxPath}/amado/img/product-img/${product.photo1 }.jpg);">
							</li>
							<li data-target="#product_details_slider" data-slide-to="1"
								style="background-image: url(${ctxPath}/amado/img/product-img/${product.photo2 }.jpg);">
							</li>
							<li data-target="#product_details_slider" data-slide-to="2"
								style="background-image: url(${ctxPath}/amado/img/product-img/${product.photo3 }.jpg);">
							</li>
							<li data-target="#product_details_slider" data-slide-to="3"
								style="background-image: url(${ctxPath}/amado/img/product-img/${product.photo4 }.jpg);">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<a class="gallery_img" href="../img/product-img/pro-big-1.jpg">
									<img class="d-block w-100" src="${ctxPath}/amado/img/product-img/${product.photo1 }.jpg"
									alt="First slide">
								</a>
							</div>
							<div class="carousel-item">
								<a class="gallery_img" href="../img/product-img/pro-big-2.jpg">
									<img class="d-block w-100" src="${ctxPath}/amado/img/product-img/${product.photo2 }.jpg"
									alt="Second slide">
								</a>
							</div>
							<div class="carousel-item">
								<a class="gallery_img" href="../img/product-img/pro-big-3.jpg">
									<img class="d-block w-100" src="${ctxPath}/amado/img/product-img/${product.photo3 }.jpg"
									alt="Third slide">
								</a>
							</div>
							<div class="carousel-item">
								<a class="gallery_img" href="../img/product-img/pro-big-4.jpg">
									<img class="d-block w-100" src="${ctxPath}/amado/img/product-img/${product.photo4 }.jpg"
									alt="Fourth slide">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-5">
				<div class="single_product_desc">
					<!-- Product Meta Data -->
					<div class="product-meta-data">
						<div class="line"></div>
						<p class="product-price">&#8361; ${df.format(product.price) }</p>
						<a href="product-details.jsp">
							<h6>${product.pname }</h6>
						</a>
						<!-- Ratings & Review -->
						<div
							class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							<div class="ratings">
								<i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
							<div class="review">
								<a href="#">Write A Review</a>
							</div>
						</div>
						<!-- Avaiable -->
						<p class="avaibility">
							<i class="fa fa-circle"></i> 재고 있음
						</p>
					</div>

					<div class="short_overview my-5">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquid quae eveniet culpa officia quidem mollitia impedit iste
							asperiores nisi reprehenderit consequatur, autem, nostrum
							pariatur enim?</p>
					</div>

					<!-- Add to Cart Form -->
					<form class="cart clearfix" method="post">
						<div class="cart-btn d-flex mb-50">
							<p>수량</p>
							<div class="quantity">
								<span class="qty-minus"
									onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
									class="fa fa-caret-down" aria-hidden="true"></i></span> <input
									type="number" class="qty-text" id="qty" step="1" min="1"
									max="300" name="quantity" value="1"> <span
									class="qty-plus"
									onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
									class="fa fa-caret-up" aria-hidden="true"></i></span>
							</div>
						</div>
						<button type="submit" name="addtocart" value="5"
							class="btn amado-btn">장바구니 담기</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Product Details Area End -->
</div>
