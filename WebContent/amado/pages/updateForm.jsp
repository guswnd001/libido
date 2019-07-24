<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	function checkIt() {
		var userInput = eval("document.userInput");
		
		if(userInput.password.value != userInput.pchk.value) {
			alert("비밀번호를 동일하게 입력하세요."); return false; 
		}
	}

</script>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">

					<div class="cart-title">
						<h2>회원정보 수정</h2>
					</div>

					<form action="${ctxPath}/libido/memUpdate.do" method="post" onsubmit="return checkIt()"
						  name="inputForm">
						<div class="row">
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="name" value="${member.name }"
									placeholder="이름" disabled>
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="birth" value="${member.birth }"
									placeholder="생년월일" disabled>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="id"
									placeholder="아이디" value="${member.id }" disabled>
							</div>
							<div class="col-md-6 mb-3">
								<input type="password" class="form-control" name="password" value=""
									placeholder="비밀번호" required>
							</div>
							<div class="col-md-6 mb-3">
								<input type="password" class="form-control" name="passwdCheck" value=""
									placeholder="비밀번호 확인" required>
							</div>
							<div class="col-12 mb-3">
								<input type="email" class="form-control" name="email"
									placeholder="E-mail" value="${member.email }">
							</div>
							<div class="col-md-4 mb-3">
								<select class="w-100" name="tel1">
									<option id="t1" value="${member.tel1 }" selected="selected">${member.tel1 }</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<div class="col-md-4 mb-3">
								<input type="text" class="form-control" name="tel2"
									placeholder=" " value="${member.tel2 }">
							</div>
							<div class="col-md-4 mb-3">
								<input type="text" class="form-control" name="tel3"
									placeholder=" " value="${member.tel3 }">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="address1"
									placeholder="도, 시 , 구" value="${member.address1 }">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="address2"
									placeholder="상세 주소" value="${member.address2 }">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="zipcode"
									placeholder="우편번호" value="${member.zipcode }">
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="수정취소"
									   onclick="location.href='${ctxPath}/libido/login.do'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="submit" value="정보수정">
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
