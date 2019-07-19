<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String kind = request.getParameter("kind");
	
	
	BoardDao dbPro = BoardDao.getInstance();
	Board article =  dbPro.getUpdate(num, boardid);
%>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="cart-title">
						<h2>글 수정하기</h2>
					</div>

					<form action="b_updatePro.jsp" method="post" onsubmit="return checkIt()"
						  name="b_writeForm">
						<input type="hidden" name="num" value="<%=num%>"> <!-- get방식으로 값을 보내기 위해 input type을 hidden으로 준다. -->
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
						<div class="row">
							<div class="col-md-6 mb-3">
								<select class="w-100" name="kind">
									<option name="kd" value="교환">교환</option>
									<option name="kd" value="환불/취소">환불/취소</option>
									<option name="kd" value="배송">배송</option>
									<option name="kd" value="주문결제">주문결제</option>
									<option name="kd" value="상품/재입고">상품/재입고</option>
									<option name="kd" value="기타문의">기타문의</option>
								</select>
								
								<script>
									var kd = document.getElementsByName("kd");
									
									for (var i = 0; i < kind.length; i++) {
										if (kd[i].value == <%=kind%>) {
											kd[i].className += " selected";
										}
									}
								</script>
								
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="writer" value="<%=article.getWriter() %>"
									placeholder="이름" required>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="subject" value="<%=article.getSubject() %>"
									placeholder="제목" required>
							</div>
							<div class="col-12 mb-3">
								<input type="email" class="form-control" name="email"
									placeholder="E-mail" value="<%=article.getEmail() %>">
							</div>
							<div class="col-12 mb-3">
								<textarea class="form-control" name="content" rows="15" placeholder="내용" 
										  style="width: 100%; height: 100%;"><%=article.getContent() %></textarea>
							</div>
							<div class="col-md-6 mb-3">
								<input type="password" class="form-control" name="passwd"
									placeholder="비밀번호" value="" required>
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="수정취소"
									   onclick="javascript:window.location='b_list.jsp?pageNum=<%=pageNum%>'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="reset" value="다시입력">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;'">
								<input class="btn amado-btn" type="submit" value="수정하기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>