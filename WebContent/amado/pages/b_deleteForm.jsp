<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="cart-title">
						<h2>게시글 삭제</h2>
					</div>
					<form action="b_deletePro.jsp" method="post" name="b_deleteForm">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
						<div class="row">
							<div class="col-md-12 mb-3">
								<input type="password" class="form-control" name="passwd" value=""
									placeholder="비밀번호" required>
							</div>
						</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="submit" value="삭제하기">
							</div>
						</div>
					</from> 
				</div>
			</div>
		</div>
	</div>
</div>
</div>