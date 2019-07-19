<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id = (String)session.getAttribute("memId"); //session은 로그인되어서 저장되어 있는 정보
	MemberDao manager = new MemberDao();
	
	Member member = manager.getMember(id); 
%>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="cart-title">
						<h2>회원 탈퇴</h2>
					</div>

					<form action="deletePro.jsp" method="post" onsubmit="return checkIt()"
						  name="deleteForm">
						<div class="row">
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="id"
									placeholder="아이디" value="<%=member.getId() %>" disabled>
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