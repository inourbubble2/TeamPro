<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">MY ACCOUNT</h2>
				</div>
			</div>
			<!-- /section-title -->
				<form role="form" action="/member/modify" method="post" style="margin:80px 0px 0px 25px;">
					<div class="form-group">
						<label>아이디</label>
						<input class="form-control" name='id' 
						value="${member.id}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>새로운 비밀번호</label>
						<input class="form-control" name='password' 
						type="password" value="${member.password }">
					</div>	
					<div class="form-group">
						<label>이름</label>
						<input class="form-control" name='name' 
						value="${member.name}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>주소</label>
						<input class="form-control" type="text" name='address' 
						value="${member.address }" >
					</div>
					<div class="form-group">
						<label>연락처</label>
						<input class="form-control" type="text" name='contact' 
						value="${member.contact }">
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input class="form-control" type="text" name='email' 
						value="${member.email}">
					</div>
					
					<div class="form-group">
						<label>Point</label>
						<input class="form-control" type="text" name='point' 
						value="${member.point}">
					</div>
				
					<button type="submit" class="btn btn-default">수정</button>
					<button type="reset" class="btn btn-default">RESET</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
					<button onclick="location.href='/member/deleteForm?id=${member.id}'" class="btn btn-default" style="margin-left:40px;">회원 탈퇴</button>
					

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>