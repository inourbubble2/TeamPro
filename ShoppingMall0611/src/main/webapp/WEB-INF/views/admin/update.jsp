<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
					<h2 class="title">PRODUCT UPDATE</h2>
				</div>
			</div>
			<!-- /section-title -->

			<form role="form" action="/admin/updateCheck" method="get">
					<div class="form-group">
						<label>상품코드</label>
						<input class="form-control" name='productCode' value='${board.productCode }' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>상품이름</label>
						<input class="form-control" name='productName' value='${board.productName }'>
					</div>
					
					<div class="form-group">
						<label>제조사</label>
						<input class="form-control" name='manufacturer' value='${board.manufacturer }'>
					</div>
					
					<div class="form-group">
						<label>가격</label>
						<input class="form-control" name='price' value='${board.price }'>
					</div>
					
					<div class="form-group">
						<label>설명</label>
						<input class="form-control" name='description' value='${board.description }'>
					</div>
					
					<div class="form-group">
						<label>운영체제</label>
						<input class="form-control" name='os' value='${board.os }'>
					</div>
					<div class="form-group">
						<label>상품종류</label>
						<input class="form-control" name='productType' value='${board.productType }'>
					</div>
					<div class="form-group">
						<label>재고</label>
						<input class="form-control" name='stock' value='${board.stock }'>
					</div>
					<div class="form-group">
						<label>용도</label>
						<input class="form-control" name='usability' value='${board.usability }'>
					</div>

					<button type="submit" class="btn btn-default">수정</button>
					<button type="reset" class="btn btn-default">RESET</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>