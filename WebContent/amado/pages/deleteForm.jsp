<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="cart-title">
						<h2>회원 탈퇴</h2>
					</div>

					<form action="${ctxPath}/libido/memDelete.do" method="post" onsubmit="return checkIt()"
						  name="deleteForm">
						<div class="row">
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="id"
									placeholder="아이디" value="${authUser.id }" disabled>
							</div>
							<div class="col-md-12 mb-3">
								<input type="password" class="form-control" name="password" value=""
									placeholder="비밀번호" required>
							</div>
						</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="submit" value="탈퇴하기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>