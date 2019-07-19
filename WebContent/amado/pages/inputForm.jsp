<%@page import="java.util.List"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">

					<div class="cart-title">
						<h2>회원가입</h2>
					</div>
					<form action="inputPro.jsp" method="post" onsubmit="return checkIt()"
						  name="inputForm">
						<div class="row">
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="name" value=""
									placeholder="이름" required>
							</div>
							<div class="col-md-6 mb-3">
								<input type="text" class="form-control" name="birth" value=""
									placeholder="생년월일" required>
							</div>
							<div class="col-md-9 mb-3">
								<input type="text" class="form-control" name="id" id="userId"
									placeholder="아이디" value="" required>
							</div>
							
							<div>
								<input class="btn amado-btn" type="button" value="중복확인"
									   id="idCheckBtn"> 
							</div>
							
							<%
								MemberDao handler = new MemberDao();
								List li = null;
								li = handler.getId(); 
								StringBuffer values = new StringBuffer();

								for(int i=0; i<li.size(); i++) {
									if(values.length()>0) {
										values.append(',');
									}
									values.append('"').append(li.get(i)).append('"');
								}
							%>
							
							<div id="idCheckModal" class="modal">
								<div class="modal-content" style="width: 25%;">
									<!-- <span class="close" style="text-align: right;">&times;</span> -->
									<p id="msg"></p>
									<input class="btn amado-btn close1" type="button" value="확인"
										   style="width: 50%; margin: auto;" id="close">
								</div>
							</div>
							
							<script>
							
								// Get the modal
					        	var modal = document.getElementById('idCheckModal');
					 
					        	// Get the button that opens the modal
					        	var checkBtn = document.getElementById("idCheckBtn");
					        	
					        	var closeBtn = document.getElementById("close");
					 
					        	// When the user clicks on the button, open the modal 
					        	checkBtn.onclick = function() {
					        		
					        		modal.style.display = "block";
					        		
					        		var list = [<%=values.toString()%>];
					        		console.log(typeof(list));
					        		var id = document.getElementById('userId').value;
					        		var check = true;
					        		var mmsg = document.getElementById("msg");
					        		
					        		
					        		if (id == null || id == "") {
					        			$('#msg').text('아이디를 입력하지 않았습니다.');
					        			return;
					        		} else if ((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z") ) {
					        			$('#msg').text('한글 및 특수문자는 아이디로 사용하실 수 없습니다.');
					        			return;
					        		} else {
					        			for (var i = 0; i < list.length; i++) {
					        				/* console.log(list[i]); */
					        				if (id == list[i]){	check = false;	break; }
					        			}
									}
					        		
					        		if (check) {
					        			$('#msg').text('사용 가능한 아이디 입니다.');
									} else {
					        			$('#msg').text('이미 사용중인 아이디 입니다.');
									}
					        	}
					 			
					        	// When the user clicks on the button, close the modal 
					        	closeBtn.onclick = function() {
					            	modal.style.display = "none";
					        	}
					 
					        	// When the user clicks anywhere outside of the modal, close it
					        	window.onclick = function(event) {
					            	if (event.target == modal) {
					                	modal.style.display = "none";
					            	}
					        	}
					        	
							</script>
							
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
									placeholder="E-mail" value="">
							</div>
							<div class="col-md-4 mb-3">
								<select class="w-100" name="tel1">
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
									placeholder=" " value="">
							</div>
							<div class="col-md-4 mb-3">
								<input type="text" class="form-control" name="tel3"
									placeholder=" " value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="address1"
									placeholder="도, 시 , 구" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" name="address2"
									placeholder="상세 주소" value="">
							</div>
							<div class="col-12 mb-3">
								<input type="number" class="form-control" name="zipcode"
									placeholder="우편번호" value="">
							</div>
							<div class="col-12 mb-3">
								<hr>
							</div>
							
							<div class="col-md-6 mb-3">
							<div class="custom-control custom-checkbox d-block mb-2">
									<input type="checkbox" class="custom-control-input"	id="customCheck1" required>
									<label class="custom-control-label" for="customCheck1">이용약관 (필수)</label>
								</div>
								<div class="custom-control custom-checkbox d-block">
									<input type="checkbox" class="custom-control-input" id="customCheck2">
									<label class="custom-control-label" for="customCheck2">E-mail 수신 동의</label>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="custom-control custom-checkbox d-block mb-2">
									<input type="checkbox" class="custom-control-input"	id="customCheck3" required>
									<label class="custom-control-label" for="customCheck3">개인 정보 수집 및 이용 (필수)</label>
								</div>
								<div class="custom-control custom-checkbox d-block">
									<input type="checkbox" class="custom-control-input" id="customCheck4">
									<label class="custom-control-label" for="customCheck4">SMS 수신 동의</label>
								</div>
							</div>
						</div>
						<div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="button" value="가입취소"
									   onclick="javascript:window.location='loginForm2.jsp'">
							</div>
							<div class="col-md-3 cart-btn" 
								 style="float: right; margin-right: 40px;">
								<input class="btn amado-btn" type="submit" value="가입하기">
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
