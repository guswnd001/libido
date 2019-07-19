<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="col-md-6 cart-title">
						<h4 style="margin-bottom: 0px;">${number}번글 내용 조회</h4>
					</div>
					<div class="col-md-12 cart-title mb-3" style="text-align: right;">
						<span>조회수: ${article.readcount}</span>
					</div>
					<form action="b_writePro.jsp" method="post" onsubmit="return checkIt()"
						  name="b_writeForm">
						<div class="row">
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="kind" 
									   value="${article.kind}" disabled>
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="writer" 
									   value="${article.writer}" disabled>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="subject" 
									   value="${article.subject}" disabled>
							</div>
							<div class="col-12 mb-3">
								<input type="email" class="form-control" name="email"
									placeholder="E-mail" value="${article.email}" disabled>
							</div>
							<div class="col-12 mb-3">
								<textarea class="form-control" name="content" rows="15" placeholder="내용" 
										  style="width: 100%; height: 100%;" disabled>${article.content}</textarea>
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
						</div>
						<div class="col-12">
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="목록보기"
									   onclick="javascript:window.location=
									   '<%=request.getContextPath()%>/board/list.do?pageNum=${pageNum}'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="답변하기"
									   onclick="document.location.href=
									   '<%=request.getContextPath()%>/board/write.do?num=${num}&pageNum=${pageNum}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}&subject=${article.subject }'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="삭제하기"
									   onclick="document.location.href=
									   '<%=request.getContextPath()%>/board/delete.do?num=${num}&pageNum=${pageNum}'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="수정하기"
									   onclick="javascript:window.location=
									   '<%=request.getContextPath()%>/board/update.do?num=${num}&pageNum=${pageNum}&kind=${article.kind}'">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>