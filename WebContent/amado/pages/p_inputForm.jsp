<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">

					<div class="cart-title">
						<h2>상품 등록</h2>
					</div>
					<form action="p_inputPro.jsp" method="post" name="p_inputForm">
						<div class="row">
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="season" value=""
									placeholder="시즌" required>
							</div>
							<div class="col-md-6 mb-3">
								<select class="w-100" name="pkind">
									<option value="tshirts">T-Shirts</option>
									<option value="shirts">Shirts</option>
									<option value="pants">Pants</option>
									<option value="hatCap">Hat & Cap</option>
									<option value="shoes">Shoes</option>
									<option value="bags">Bags</option>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="brand" value=""
									placeholder="브랜드" required>
							</div>
							
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="code" value=""
									placeholder="상품코드" required>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="pname" value=""
									placeholder="상품명" required>
							</div>
							<div class="col-md-3 mb-3">
								<select class="w-100" name="color">
									<option value="white">White</option>
									<option value="grey">Grey</option>
									<option value="black">Black</option>
									<option value="blue">Blue</option>
									<option value="red">Red</option>
									<option value="yellow">Yellow</option>
									<option value="orange">Orange</option>
									<option value="green">Green</option>
								</select>
							</div>
							<div class="col-md-3 mb-3">
								<select class="w-100" name="sex">
									<option value="man">남자</option>
									<option value="woman">여자</option>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="price"
									placeholder="가격" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="stock"
									placeholder="재고" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="photo1"
									placeholder="사진1" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="photo2"
									placeholder="사진2" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="photo3"
									placeholder="사진3" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="photo4"
									placeholder="사진4" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="photo5"
									placeholder="사진5" value="">
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="등록취소"
									   onclick="javascript:window.location='shop.jsp'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="submit" value="등록하기">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="reset" value="다시입력">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- ##### Main Content Wrapper End ##### -->
