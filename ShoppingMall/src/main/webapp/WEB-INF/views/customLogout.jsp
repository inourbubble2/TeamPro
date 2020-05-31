<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
					<h2 class="title">USER LOGOUT</h2>
				</div>
			</div>
			<!-- /section-title -->

			<form role="form" action="/customLogout" method="post" style="margin:80px 0px 0px 15px;">
					<button class="btn btn-lg btn-default">로그아웃</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->

</div>
<!-- /section -->
<script>
	$(".btn-default").on("click", function(e) {
		e.preventDefault();
		$("form").submit();
	});
</script>

<c:if test="${param.logout != null}">
	<script>
		$(document).ready(function() {
			alert("로그아웃하였습니다.");
		});
	</script>
</c:if>

<%@include file="includes/footer.jsp"%>
