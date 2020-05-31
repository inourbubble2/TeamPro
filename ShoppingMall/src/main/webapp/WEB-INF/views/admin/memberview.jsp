<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />

<%@include file="../includes/header.jsp"%>
<style>
table {
	width: 80%;
	height: 500px;
	font-size: 150%;
	font-weight: bold;
}

tr {
	padding: 20px;
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
					<h2 class="title">MEMBER VIEW(ADMIN)</h2>
				</div>
			</div>
			
			<table>
				<tr>
					<td>ID</td>
					<td>${mem.id }</td>
				</tr>
				<tr>
					<td>NAME</td>
					<td>${mem.name }</td>
				</tr>
				<tr>
					<td>ADDRESS</td>
					<td>${mem.address }</td>
				</tr>
				<tr>
					<td>CONTACT</td>
					<td>${mem.contact }</td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td>${mem.email }</td>
				</tr>
				<tr>
					<td>REGIDATE</td>
					<td>${format.format(mem.regiDate) }</td>
				</tr>
				<tr>
					<td>UPDATEDATE</td>
					<td>${format.format(mem.updateDate) }</td>
				</tr>
			</table>
			
			
		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>