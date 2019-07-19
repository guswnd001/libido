<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if (!document.myform.id.value) {
			alert("아이디을 입력하지 않으셨습니다.");
			document.myform.id.focus();
			return false;
		}
		if (!document.myform.passwd.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>
<div class="cart-table-area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
		<%
			if (session.getAttribute("memId") == null) {
		%>
				<div class="cart-title mt-50">
					<h5>회원 로그인</h5>
				</div>

				<div>
					<form action="loginPro.jsp" method="post"
						onsubmit="return checkIt()" name="loginForm"
						style="background-color: #f5f7fa;">
						<table class="table table-responsive">
							<TR>
								<TD align=center>아이디</TD>
								<TD align=center><INPUT type="text" name="id" size="15"
									maxlength="12"></TD>
							</TR>
							<TR>
								<TD align=center>비밀번호</TD>
								<TD align=center><INPUT type=password name="password"
									size="15" maxlength="12"></TD>
							</TR>
							<TR>
								<TD colspan="2" style="text-align: center;">
									<INPUT type=submit value="로그인"> 
									<INPUT type=reset value="다시입력">
									<input type="button" value="회원가입"
									onclick="javascript:window.location='inputForm.jsp'">
								</TD>
							</TR>
						</table>
					</form>
				</div>
				<%
			} else {
		%>
		<br>
		<p><%=session.getAttribute("memId")%>님이 방문하셨습니다.</p>
		<input type="button" value="로그아웃"
			onclick="location.href='<%=request.getContextPath()%>/amado/pages/logout.jsp'">
		<input type="button" value="회원정보수정"
			onclick="location.href='<%=request.getContextPath()%>/amado/pages/updateForm.jsp'">
		<input type="button" value="회원탈퇴"
			onclick="location.href='<%=request.getContextPath()%>/amado/pages/deleteForm.jsp'">
		<%
			}
		%>
			</div>
			<div class="col-12 col-lg-4">
				<div class="cart-summary">
					<h5>Cart Total</h5>
					<ul class="summary-table">
						<li><span>subtotal:</span> <span>$140.00</span></li>
						<li><span>delivery:</span> <span>Free</span></li>
						<li><span>total:</span> <span>$140.00</span></li>
					</ul>
					<div class="cart-btn mt-100">
						<a href="cart.html" class="btn amado-btn"
							style="margin-left: 30px; margin-right: 40px;">가입하기</a> <a
							href="cart.html" class="btn amado-btn">취소</a>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
</div>


