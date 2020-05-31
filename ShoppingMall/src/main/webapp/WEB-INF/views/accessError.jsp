<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<%@include file="includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Access Denied Page</h2>
				</div>
			</div>
			<!-- /section-title -->
			<div style="margin:80px 0px 0px 25px;">
			<h2>권한이 없습니다.</h2>
			<h4><button onclick="location.href='/'">홈으로</button></h4>
			</div>
			
		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="includes/footer.jsp"%>

