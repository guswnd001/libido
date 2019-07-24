<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="shop_sidebar_area">
	<!-- ##### Single Widget ##### -->
	<div class="widget catagory mb-50">
		<!-- Widget Title -->
		<h6 class="widget-title mb-30">Catagories</h6>

		<!--  Catagories  -->
		<div class="catagories-menu">
			<ul>
				<li><a href="#">All</a></li>
				<li><a href="#">T-Shirts</a></li>
				<li><a href="#">Shirts</a></li>
				<li><a href="#">Pants</a></li>
				<li><a href="#">Hat & Cap</a></li>
				<li><a href="#">Shoes</a></li>
				<li><a href="#">Bags</a></li>
			</ul>
		</div>
	</div>

	<!-- ##### Single Widget ##### -->
	<div class="widget brands mb-50">
		<!-- Widget Title -->
		<h6 class="widget-title mb-30">Brands</h6>

		<div class="widget-desc">
			<!-- Single Form Check -->
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="add">
				<label class="form-check-label" for="add">ADD</label>
			</div>
			<!-- Single Form Check -->
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="tmu">
				<label class="form-check-label" for="tmu">The<br>T-shirts Museum</label>
			</div>
			<!-- Single Form Check -->
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="prl">
				<label class="form-check-label" for="prl">Polo<br>Ralph Lauren</label>
			</div>
			<!-- Single Form Check -->
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="mmgu"> <label class="form-check-label" for="mmgu">MMGU</label>
			</div>
			<!-- Single Form Check -->
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="aeca"> <label class="form-check-label" for="aeca">AECA WHITE</label>
			</div>
		</div>
	</div>

	<!-- ##### Single Widget ##### -->
	<div class="widget color mb-50">
		<!-- Widget Title -->
		<h6 class="widget-title mb-30">Color</h6>

		<div class="widget-desc">
			<ul class="d-flex">
				<li><a href="#" class="color1"></a></li>
				<li><a href="#" class="color2"></a></li>
				<li><a href="#" class="color3"></a></li>
				<li><a href="#" class="color4"></a></li>
				<li><a href="#" class="color5"></a></li>
				<li><a href="#" class="color6"></a></li>
				<li><a href="#" class="color7"></a></li>
				<li><a href="#" class="color8"></a></li>
			</ul>
		</div>
	</div>

	<!-- ##### Single Widget ##### -->
	<div class="widget price mb-50">
		<!-- Widget Title -->
		<h6 class="widget-title mb-30">Price(&#8361;10000)</h6>

		<div class="widget-desc">
			<div class="slider-range">
				<div data-min="10" data-max="1000" data-unit="$"
					class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
					data-value-min="10" data-value-max="1000" data-label-result="">
					<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
					<span class="ui-slider-handle ui-state-default ui-corner-all"
						tabindex="0"></span> <span
						class="ui-slider-handle ui-state-default ui-corner-all"
						tabindex="0"></span>
				</div>
				<div class="range-price">&#8361;1 - &#8361;100</div>
				<div>
					<h3 class="widget-title mb-30">
					<a href="p_inputForm.jsp">Write</a>
					</h3>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="amado_product_area section-padding-100">
	<div class="container-fluid">

		<div class="row">
			<div class="col-12">
				<div
					class="product-topbar d-xl-flex align-items-end justify-content-between">
					<!-- Total Products -->
					<div class="total-products">
						<p>Showing 1-8 0f 25</p>
						<div class="view d-flex">
							<a href="#" style="padding-top: 12px;"><i class="fa fa-th-large" aria-hidden="true"></i></a>
							<a href="#" style="padding-top: 12px;"><i class="fa fa-bars" aria-hidden="true"></i></a>
						</div>
					</div>
					<!-- Sorting -->
					<div class="product-sorting d-flex">
						<div class="sort-by-date d-flex align-items-center mr-15">
							<p>Sort by</p>
							<form action="#" method="get">
								<select name="select" id="sortBydate">
									<option value="value">Date</option>
									<option value="value">Newest</option>
									<option value="value">Popular</option>
								</select>
							</form>
						</div>
						<div class="view-product d-flex align-items-center">
							<p>View</p>
							<form action="#" method="get">
								<select name="select" id="viewProduct">
									<option value="6">6</option>
									<option value="12">12</option>
									<option value="24">24</option>
									<option value="48">48</option>
								</select>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		<c:forEach var="product" items="${productList }">
			<!-- Single Product Area -->
			<div class="col-12 col-sm-6 col-md-12 col-xl-6">
				<div class="single-product-wrapper">
					<!-- Product Image -->
					<div class="product-img">
						<a href="${ctxPath}/libido/productDetails.do?code=${product.code}">
						<img src="${ctxPath}/amado/img/product-img/${product.photo1 }.jpg" alt="">
						<!-- Hover Thumb -->
						<img class="hover-img" src="${ctxPath}/amado/img/product-img/${product.photo2 }.jpg" alt="">
						</a>
					</div>

					<!-- Product Description -->
					<div
						class="product-description d-flex align-items-center justify-content-between">
						<!-- Product Meta Data -->
						<div class="product-meta-data">
							<div class="line"></div>
							<p class="product-price">&#8361;${df.format(product.price) }</p>
							<a href="product-details.html">
								<h6>${product.pname }</h6>
							</a>
						</div>
						<!-- Ratings & Cart -->
						<div class="ratings-cart text-right">
							<div class="ratings">
								<i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
							<div class="cart">
								<a href="cart.html" data-toggle="tooltip" data-placement="left"
									title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
			
			
		</div>
		<div class="row">
			<div class="col-12">
				<!-- Pagination -->
				<nav aria-label="navigation">
					<ul class="pagination justify-content-end mt-50">
					
<c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${i < 10 }">
	<li name="page" class="page-item">
		<a class="page-link" href="shop.jsp?pageNum=${i }">0${i }.</a>
	</li>
</c:if>
<c:if test="${i >= 10 }">
	<li name="page" class="page-item">
		<a class="page-link" href="shop.jsp?pageNum=${i }">${i }.</a>
	</li>
</c:if>
</c:forEach>
					</ul>
<script>
	var liTag = document.getElementsByName("page");
	
	
	if (${currentPage == null} || ${currentPage == ""}) {
	   	liTag[0].className += " active";
	} else if (${currentPage > bottomLine}) {
	   	liTag[${currentPage - bottomLine}].className += " active"; 
	} else {
	   	liTag[${currentPage - 1}].className += " active"; 
	}
</script>
				</nav>
			</div>
		</div>
	</div>
</div>
</div>
<!-- ##### Main Content Wrapper End ##### -->



