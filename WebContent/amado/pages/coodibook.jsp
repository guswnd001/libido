<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Product Details Area Start -->
<div class="single-product-area section-padding-100 clearfix">
	<div class="container-fluid">

		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mt-50">
						<li class="breadcrumb-item"><a href="#">홈</a></li>
						<li class="breadcrumb-item active"><a href="#">코디 북</a></li>
					</ol>
				</nav>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12 col-lg-7">
				<div class="single_product_thumb">
					<div id="product_details_slider" class="carousel slide"	>
						
						<div class="carousel-inner">
							<div id="top1" ondrop="drop(event)" ondragover="dragEnter(event)"
								 style="width: 37vw; height: 35vh; margin: 10 10 0 10px; padding: 95 90 90 250; 
								 		border: 2px solid #fbb710; border-bottom-style: none;
								 		background-color: F5F7FA;
								 		position: relative; z-index: 1;"></div>
							<div id="bottom" ondrop="drop(event)" ondragover="dragEnter(event)"
								 style="width: 37vw; height: 35vh; margin: 0 10 10 10px; padding: 10 90 90 272;
								 		border: 2px solid #fbb710; border-top-style: none;
								 		background-color: F5F7FA; 
								 		position: relative; z-index: 0;"></div>
						</div>
						
						<div class="coodi" id="coodi1" ondrop="drop(event)" ondragover="dragEnter(event)"
							 style="background-color: F5F7FA;"><img id="coodiProduct1" width="200" height="300" 
								 src="${ctxPath}/amado/img/coodiBook-img/tmu3-1.png" 
				 				 draggable="true" ondragstart="drag(event)"></div>
						<div class="coodi" id="coodi2" ondrop="drop(event)" ondragover="dragEnter(event)"
							 style="background-color: F5F7FA;"><img id="coodiProduct2" width="200" height="300" 
								 src="${ctxPath}/amado/img/coodiBook-img/tmu2-1.png" 
				 				 draggable="true" ondragstart="drag(event)"></div>
						<div class="coodi" id="coodi3" ondrop="drop(event)" ondragover="dragEnter(event)"
							 style="background-color: F5F7FA;"><img id="coodiProduct3" width="150" height="250" 
								 src="${ctxPath}/amado/img/coodiBook-img/add1-2.png" 
				 				 draggable="true" ondragstart="drag(event)"
				 				 style="max-width: 90%;"></div>
						<div class="coodi" id="coodi4" ondrop="drop(event)" ondragover="dragEnter(event)"
							 style="background-color: F5F7FA;"><img id="coodiProduct4" width="150" height="250" 
								 src="${ctxPath}/amado/img/coodiBook-img/add5-1.png"  
				 				 draggable="true" ondragstart="drag(event)"
				 				 style="max-width: 90%;"></div>
						
					</div>
					
					<script>
		
		var cd1 = document.getElementById('coodi1').innerHTML;
		var cd2 = document.getElementById('coodi2').innerHTML;
		var cd3 = document.getElementById('coodi3').innerHTML;
		var cd4 = document.getElementById('coodi4').innerHTML;
		
		console.log(cd1);
		
		function dragEnter(ev) {
			//alert("dragEnter");
			ev.preventDefault();
		}

		function drag(ev) {
			//alert("drag");
			ev.dataTransfer.setData("text", ev.target.id);
		}

		function drop(ev) {
			//alert("drop");
			ev.preventDefault();
			var data = ev.dataTransfer.getData("text");
			ev.target.appendChild(document.getElementById(data));
		}
		
		function clearCoodi() {
			
			var top1 = document.getElementById("top1");
			var bottom = document.getElementById("bottom");
			
			top1.innerHTML = "";
			bottom.innerHTML = "";
			
			
			if (document.getElementById("coodi1").innerHTML == "") { 
				document.getElementById("coodi1").innerHTML = cd1; 
			}
			if (document.getElementById("coodi2").innerHTML == "") { 
				document.getElementById("coodi2").innerHTML = cd2; 
			}
			if (document.getElementById("coodi3").innerHTML == "") { 
				document.getElementById("coodi3").innerHTML = cd3; 
			}
			if (document.getElementById("coodi4").innerHTML == "") { 
				document.getElementById("coodi4").innerHTML = cd4; 
			}
			
		}
		
		</script>
					
				</div>
			</div>
			<div class="col-12 col-lg-5">
				<div class="single_product_desc">
					<!-- Product Meta Data -->
					<div class="product-meta-data">
						<div class="line"></div>
						<p class="product-price">코디 북</p>
						<a href="product-details.jsp">
							<h6>나만의 코디를 만들어 보세요.</h6>
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
								<a href="#" onclick="clearCoodi()">초기화</a>
							</div>
						</div>
						<!-- Avaiable -->
						<p class="avaibility">
							<i class="fa fa-circle"></i> 코디 가능
						</p>
					</div>

					<div class="short_overview my-5">
						<p>옷을 구매하기 전,<br>직접 코디를 해보고 어울리는 옷을 구매할 수 있게 도와 줍니다.</p>
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
							class="btn amado-btn">장바구니 추가</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Product Details Area End -->
</div>
