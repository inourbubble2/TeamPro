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
					<h2 class="title">PRODUCT REGISTER</h2>
				</div>
			</div>
			<!-- /section-title -->

			<form role="form" action="/admin/register" method="post">
					<div class="form-group">
						<label>상품 코드</label>
						<input class="form-control" name='productCode'>
					</div>
					
					<div class="form-group">
						<label>상품 종류</label>
						<input class="form-control" name='productType'>
					</div>
					
					<div class="form-group">
						<label>제품 이름</label>
						<input class="form-control" name='productName'>
					</div>
					
					<div class="form-group">
						<label>제조사</label>
						<input class="form-control" name='manufacturer'>
					</div>
					
					<div class="form-group">
						<label>가격</label>
						<input class="form-control" name='price'>
					</div>
					
					<div class="form-group">
						<label>상품 설명</label>
						<textarea class="form-control" rows="3" name='description'></textarea>
					</div>
					
					<div class="form-group">
						<label>운영체제</label>
						<input class="form-control" name='os'>
					</div>
					
					<div class="form-group">
						<label>재고</label>
						<input class="form-control" name='stock'>
					</div>
					
					<div class="form-group">
						<label>사용용도</label>
						<input class="form-control" name='usability'>
					</div>

					<button type="submit" class="btn btn-default">등록</button>
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