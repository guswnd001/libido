<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if (!document.myform.id.value) {
			alert("아이디을 입력하지 않으셨습니다.");
			document.myform.id.focus();
			return false;
		}
		if (!document.myform.passwd.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">

			<c:if test="${empty authUser }">
					<div class="cart-title">
						<h2>로그인</h2>
					</div>

					<form action="${ctxPath}/login.do" method="post" onsubmit="return checkIt()"
						  name="loginForm">
						<div class="row">
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="id"
									placeholder="아이디" value="" required>
							</div>
							<div class="col-md-12 mb-3">
								<input type="password" class="form-control" name="password" value=""
									placeholder="비밀번호" required>
							</div>
							<div class="col-12">
								<hr>
							</div>
							<div class="col-md-6 mb-3">
								<div class="custom-control custom-checkbox d-block mb-2">
									<input type="checkbox" class="custom-control-input"	id="customCheck3">
									<label class="custom-control-label" for="customCheck3">자동 로그인</label>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="custom-control custom-checkbox d-block mb-2">
									<input type="checkbox" class="custom-control-input"	id="customCheck4">
									<label class="custom-control-label" for="customCheck4">아이디 저장</label>
								</div>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="회원가입"
									   onclick="location.href='${ctxPath}/join.do'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="reset" value="다시입력">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="submit" value="로그인">
							</div>
						</div>
					</form>
				</div>
			</c:if>
			<c:if test="${!empty authUser }">	
					<div class="cart-title">
						<h2>로그인</h2>
					</div>
					<form action="${ctxPath}/login.do" method="post" onsubmit="return checkIt()"
						  name="inputForm">
						<div class="row">
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="id"
									   value="${authUser.id }님이 방문하셨습니다." disabled>
							</div>
							<div class="col-12 mb-2">
								<hr>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="로그아웃"
									   onclick="location.href='${ctxPath}/logout.do'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="reset" value="정보수정"
									   onclick="location.href='${ctxPath}/update.do'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="button" value="회원탈퇴"
									   onclick="location.href='${ctxPath}/delete.do'">
							</div>
						</div>
					</form>
				</div>
			</c:if>
				
			</div>
		</div>
	</div>
</div>
</div>