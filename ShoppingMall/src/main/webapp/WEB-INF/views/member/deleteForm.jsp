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
					<h2 class="title">회원 탈퇴</h2>
				</div>
			</div>
			<!-- /section-title -->
				<form role="form" action="/member/deletePro" method="post" style="margin:80px 0px 0px 15px;">
					<input type="hidden" name="id" value="<sec:authentication property='principal.username'/>">
					<input type="submit" value="탈퇴">
					<input type="button" value="취소" onclick="location.href='/member/getMember'">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
					

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>