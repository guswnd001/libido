<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	MemberDao manager = new MemberDao();
	
	List<Member> li = manager.getMemberList();
%>
    
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
							<%
								for (int i = 0; i < li.size(); i++) {
									Member member = li.get(i);									
							%>
							<tr>
								<td style="border: none;">&nbsp;<%= member.getId() %></td>
								<td style="border: none;">&nbsp;<%= member.getName() %></td>
								<td style="border: none;">&nbsp;<%= member.getEmail() %></td>
								<td style="border: none;">&nbsp;<%= member.getTel1() + "-" + member.getTel2() + "-" + member.getTel3() %></td>
								<td style="border: none;">&nbsp;<%= member.getAddress1() + " " + member.getAddress2() %></td>
								<td style="border: none;">&nbsp;<%= member.getZipcode() %></td>
								<td style="border: none;">&nbsp;<%= sdf.format(member.getReg_date()) %></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- ##### Main Content Wrapper End ##### -->
