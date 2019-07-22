<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="cart-table-area-3 section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-12" style="position: relative;">
				<div class="cart-title mt-50">
				
				<c:if test="${boardid == 1}">
					<h2>공지사항</h2>
				</c:if>
				<c:if test="${boardid == 2}">
					<h2>Q & A</h2>
				</c:if>
				</div>
				<div class="cart-table clearfix" style="width: 1000px; position: absolute;">
					<div align="right" class="mb-3">
						<p><a href="<%=request.getContextPath()%>/libido/write.do">글쓰기</a></p>
					</div>
					<table class="table">
						<thead style="background-color: F5F7FA;">
							<tr style="font-size: 12px;">
								<th style="border: none;">&nbsp;번호</th>
								<th style="border: none;">&nbsp;제목</th>
								<th style="border: none;">&nbsp;작성자</th>
								<th style="border: none;">&nbsp;작성일</th>
								<th style="border: none; white-space: nowrap;">&nbsp;조회수</th>
								<th style="border: none;">&nbsp;IP</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${aCount > 0}">
							<c:forEach var="article" items="${articleList}">
							<tr>
								<c:set var="number" value="${number-1}"></c:set>
								<td style="border: none;">&nbsp;
								<c:out value="${number }">${number }</c:out>
								</td>  
								<td style="border: none;">
								
									<c:if test="${article.re_level > 0}">
										&nbsp;<img src="<%=request.getContextPath()%>/images/level.gif" width="${article.re_level * 5}" height="16">
										<img src="<%=request.getContextPath()%>/images/re.gif">
									</c:if>
										<a href="<%=request.getContextPath() %>/libido/content.do?num=${article.num}&pageNum=${pageNum}&number=${number}">
											${article.subject}</a>
									<c:if test="${article.readcount > 15}">
										<img src="<%=request.getContextPath()%>/images/hot.gif" border="0" height="16">
									</c:if>
									
								</td>
								<td style="border: none;">&nbsp;${article.writer}</td> 
								<td style="border: none;">&nbsp;${sdf.format(article.reg_date)}</td>
								<td style="border: none;">&nbsp;${article.readcount}</td>
								<td style="border: none;">&nbsp;${article.ip}</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${aCount == 0}">
		<tr>
			<td colspan="6" style="text-align: center;">게시글이 없습니다.</td>
		</tr>
</c:if>

	</tbody>
	</table>
	
<br>
<div class="row">
	<div class="col-12">
				<nav aria-label="navigation">
<ul class="pagination justify-content-end mt-10">
<c:if test="${startPage > bottomLine}">
	<li name="page" class="page-item">
		<a class="page-link" href="<%=request.getContextPath() %>/libido/list.do?pageNum=${startPage - bottomLine}">prev.</a>
	</li>
</c:if>

<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i < 10}">
	<li name="page" class="page-item">
		<a class="page-link" href="<%=request.getContextPath() %>/libido/list.do?pageNum=${i}">${ "0" + i}.</a>
	</li>
	</c:if>
	<c:if test="${i >= 10}">
	<li name="page" class="page-item">
		<a class="page-link" href="<%=request.getContextPath() %>/libido/list.do?pageNum=${i}">${i}.</a>
	</li>
	</c:if>
</c:forEach>

<c:if test="${endPage < pageCount}">	
	<li name="page" class="page-item">
		<a class="page-link" href="<%=request.getContextPath() %>/libido/list.do?pageNum=${startPage + bottomLine}">next.</a>
	</li>
</c:if>
</ul>
					
<script>
	var liTag = document.getElementsByName("page");
	
	if (${currentPage == null} || ${currentPage == ""}) {
	   	liTag[0].className += " active";
	} else if (${currentPage > bottomLine}) {
	   	liTag[${currentPage - bottomLine}].className += " active"; 
	} else {
	   	liTag[${currentPage - 1}].className += " active"; 
	}
</script>
					
				</nav>
</div>
</div>
</div>
</div>

		</div>
	</div>
</div>
</div>
</div>
