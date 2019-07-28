<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../../includes/header.jsp"%>
<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">VIEW ADMIN REPLY</h2>
				</div>
			</div>
			<!-- /section-title -->
			<div style="padding: 15px">
				<form action="/admin/inquiry/register" method="post">
					<input type="number" value="${inquiryNo }" name="inquiryNo"
						id="inquiryNo" readonly="readonly"> 번째 질문의 답
					<table width="500">
						<tr>
							<td>답변 제목</td>
							<td><input type="text" id="title" name="title" placeholder="제목을 작성해주세요."></td>
						</tr>
						<tr>
							<td>답변 내용</td>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
					</table>
					<input type="hidden" name="id" value="<sec:authentication property='principal.username'/>">
					<input type="submit" class="btn btn-info" value="작성">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->
<!-- <script>
	//댓글 달기		
	$(document).ready(function () {
		$("#submit").on("click", function(e) {
			e.preventDefault();

			var title = $("#ReplySelect option:selected").text();
			var content = $("#content").val();
			var inquiryNo = $("#inquiryNo").val();

			var replyVO = {
				title : title,
				content : content,
				inquiryNo : inquiryNo
			};

			$.ajax({
				url : "/admin/inquiry/register",
				type : "post",
				data : replyVO,
				success : function() {
					alert("답변 달기 성공");
					window.location.href = '/product/list';
				},
				error : function() {
					alert("답변 달기 실패");
				}
			});
		});	
	});
</script> -->
<%@include file="../../includes/footer.jsp"%>