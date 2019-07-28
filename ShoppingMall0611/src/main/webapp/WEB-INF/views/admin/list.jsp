<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />

<%@include file="../includes/header.jsp"%>
<style>
table {
	width: 60%;
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
						PRODUCT LIST(ADMIN)
						<button id="btns_2" onclick="location.href='/admin/register'">상품 등록</button>
					</h2>
				</div>
			</div>


			<h2>상품코드</h2>
			<table>
				<c:forEach var="product" items="${list }">
					<tr>

						<td><a href="/admin/view?productCode=${product.productCode}"><h3>${product.productCode }</h3></a></td>
					</tr>
				</c:forEach>
			</table>
			<br>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->
<%@include file="../includes/footer.jsp"%>