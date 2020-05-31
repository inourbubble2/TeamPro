<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />
    
<%@include file="../includes/header.jsp"%>
<style>
table {
	width: 60%;
}

td {
	padding: 20px 10px 10px 10px;
}
</style>
<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">
						관리자 화면
					</h2>
				</div>
			</div>
			
			<h2 id="content_bd"><sec:authentication property="principal.user.name"/>님입니다.</h2><br>
			<table>
				<tr>
					<td><h2>상품정보</h2></td>
					<td><a id="admin_href" href="/admin/list">상품 정보 확인</a></td>
				</tr>
				<tr>
					<td><h2>회원정보</h2></td>
					<td><a id="admin_href" href="/admin/memberlist">회원 정보 확인</a></td>
				</tr>
				<tr>
					<td><h2>결제정보</h2></td>
					<td><a id="admin_href" href="/cart/adminPaymentList">결제 정보 확인</a></td>
				</tr>
				<tr>
					<td><h2>문의사항</h2></td>
					<td><a id="admin_href" href="/inquiry/list">문의사항 테이블로</a></td>
				</tr>
		
			</table>
						
		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->
<%@include file="../includes/footer.jsp"%>