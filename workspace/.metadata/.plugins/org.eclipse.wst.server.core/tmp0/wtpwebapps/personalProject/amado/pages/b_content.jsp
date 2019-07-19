<%@page import="model.BoardDataBean"%>
<%@page import="dao.BoardDBBeanMysql"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	BoardDBBeanMysql dbPro = BoardDBBeanMysql.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int number = Integer.parseInt(request.getParameter("number"));
	
	if (pageNum == null || pageNum == "") {
		pageNum = "1";
	}
	
	BoardDataBean article = dbPro.getArticle(num, boardid);
%>

<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">
					<div class="col-md-6 cart-title">
						<h4 style="margin-bottom: 0px;"><%=(++number) %>번글 내용 조회</h4>
					</div>
					<div class="col-md-12 cart-title mb-3" style="text-align: right;">
						<span>조회수: <%=article.getReadcount() %></span>
					</div>
					<form action="b_writePro.jsp" method="post" onsubmit="return checkIt()"
						  name="b_writeForm">
						<div class="row">
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="kind" 
									   value="<%= article.getKind() %>" disabled>
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="writer" 
									   value="<%= article.getWriter() %>" disabled>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="subject" 
									   value="<%= article.getSubject() %>" disabled>
							</div>
							<div class="col-12 mb-3">
								<input type="email" class="form-control" name="email"
									placeholder="E-mail" value="<%= article.getEmail() %>" disabled>
							</div>
							<div class="col-12 mb-3">
								<textarea class="form-control" name="content" rows="15" placeholder="내용" 
										  style="width: 100%; height: 100%;" disabled><%= article.getContent() %></textarea>
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
						</div>
						<div class="col-12">
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="목록보기"
									   onclick="javascript:window.location='b_list.jsp?pageNum=<%=pageNum%>'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="답변하기"
									   onclick="document.location.href='b_writeForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>&ref=<%=article.getRef()%>&re_step=<%=article.getRe_step()%>&re_level=<%=article.getRe_level()%>&subject=<%=article.getSubject()%>'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="삭제하기"
									   onclick="document.location.href='b_deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 30px; max-width: 20%;">
								<input class="btn amado-btn" type="button" value="수정하기"
									   onclick="javascript:window.location='b_updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>&kind=<%=article.getKind()%>'">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>