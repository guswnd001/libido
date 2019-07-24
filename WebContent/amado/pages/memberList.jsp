<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="cart-table-area-3 section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="cart-title mt-50">
					<h2>회원정보 조회</h2>
				</div>

				<div class="cart-table clearfix">
					<table class="table" style="position: absolute; white-space: nowrap; overflow: hidden;">
						<thead style="background-color: F5F7FA;">
							<tr style="font-size: 12px;">
								<th style="border: none;">&nbsp;번호</th>
								<th style="border: none;">&nbsp;ID</th>
								<th style="border: none;">&nbsp;이름</th>
								<th style="border: none;">&nbsp;E-mail</th>
								<th style="border: none;">&nbsp;전화번호</th>	
								<th style="border: none;">&nbsp;주소</th>
								<th style="border: none;">&nbsp;우편번호</th>
								<th style="border: none;">&nbsp;가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${memberList }" varStatus="status">
							<tr>
								<td style="border: none;">&nbsp;${status.count }</td>
								<td style="border: none;">&nbsp;${member.id }</td>
								<td style="border: none;">&nbsp;${member.name }</td>
								<td style="border: none;">&nbsp;${member.email }</td>
								<td style="border: none;">&nbsp;${member.tel1 } - ${member.tel2} - ${member.tel3 }</td>
								<td style="border: none;">&nbsp;${member.address1} ${member.address2}</td>
								<td style="border: none;">&nbsp;${member.zipcode}</td>
								<td style="border: none;">&nbsp;${sdf.format(member.reg_date) }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- ##### Main Content Wrapper End ##### -->
