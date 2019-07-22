<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

	function checkIt() {
		var userInput = eval("document.b_writeForm");
	
		if(!userInput.writer.value) { alert("이름을 입력하세요."); return false; }
		if(!userInput.subject.value) { alert("제목을 입력하세요."); return false; }
		if(!userInput.email.value) { alert("E-mail을 입력하세요."); return false; }
		if(!userInput.content.value) { alert("내용을 입력하세요."); return false; }
		if(!userInput.passwd.value) { alert("비밀번호를 입력하세요."); return false; }
	}

</script>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="cart-title">
						<h2>글 작성하기</h2>
					</div>

					<form action="${ctxPath}/libido/write.do" method="post" onsubmit="return checkIt()"
						  name="b_writeForm">
						<input type="hidden" name="num" value="${num }">
						<input type="hidden" name="pageNum" value="${pageNum }">
						<input type="hidden" name="ref" value="${ref }">
						<input type="hidden" name="re_step" value="${re_step }">
						<input type="hidden" name="re_level" value="${re_level }">
						<div class="row">
							<div class="col-md-6 mb-3">
								<select class="w-100" name="kind">
								
								<c:if test="${!empty kind }">
									<option value="${kind }">${kind }</option>
								</c:if>
								
									<option value="교환">교환</option>
									<option value="환불/취소">환불/취소</option>
									<option value="배송">배송</option>
									<option value="주문결제">주문결제</option>
									<option value="상품/재입고">상품/재입고</option>
									<option value="기타문의">기타문의</option>
								</select>
							</div>
							<div class="col-md-6 mb-3">
							
							<c:if test="${!empty authUser }">
								<input type="text" class="form-control" name="writer" 
									   value="${member.name }" required>
							</c:if>
							<c:if test="${empty authUser }">
								<input type="text" class="form-control" name="writer" value="" 
									   placeholder="이름" required>
							</c:if>
							</div>
							<div class="col-12 mb-3">
							
							<c:if test="${num == 0 }">
								<input type="text" class="form-control" name="subject" value=""
									placeholder="제목" required>
							</c:if>
							<c:if test="${num > 0 }">
								<input type="text" class="form-control" name="subject" 
									   value="[답변]${subject }">
							</c:if>
							
							</div>
							<div class="col-12 mb-3">
							<c:if test="${!empty authUser }">
								<input type="email" class="form-control" name="email"
									   value="${member.email }" required>
							</c:if>
							<c:if test="${empty authUser }">
								<input type="text" class="form-control" name="email" value="" 
									   placeholder="이메일" required>
							</c:if>
							</div>
							<div class="col-12 mb-3">
								<textarea class="form-control" name="content" rows="15" placeholder="내용" 
										  style="width: 100%; height: 100%;"></textarea>
							</div>
							<div class="col-md-6 mb-3">
								<input type="password" class="form-control" name="passwd"
									placeholder="비밀번호" value="">
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="취소"
									   onclick="javascript:window.location='b_list.jsp?pageNum=${pageNum}'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="reset" value="다시입력">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="submit" value="작성하기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>