<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
td{
margin: 5px;
}
</style>
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
					<h2 class="title">MODIFY UPDATE</h2>
				</div>
			</div>
			
			<!-- /section-title -->
			<form action="/inquiry/modifyUpdate" method="post">
			<input type="hidden" name="inquiryNo" value="${inquiry.inquiryNo}" /> 
			<div class="container" style="padding: 15px">
				<div class="inquiry" style="padding-left: 15px">
					<h5>${inquiry.inquiryNo }번째문의글</h5>
					<table width="500" style="border: 1px">
						<tr>
							<td><b>아이디</b></td>
							<td><sec:authentication property="principal.username"/></td>
						</tr>
						<tr>
							<td><b>이름</b></td>
							<td>${inquiry.name }</td>
						</tr>
						<tr>
							<td><b>작성일</b></td>
							<td>${inquiry.inquiryDate }</td>
						</tr>
						<tr>
							<td><b>제목</b></td>
							<td><input type="text" id="title" name="title" value="${inquiry.title }"></td>
						</tr>
						<tr>
							<td><b>내용</b></td>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
					</table>
				</div>
				<br>
				<input id="btnSubmit" type="submit" class="btn btn-primary" value="수정">
				<button onclick="location.href='/inquiry/list'" class="btn btn-primary">취소</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</div>
			</form>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->
<!-- <script>
	//게시물 수정 
	$(function() {
		
		$('#btnSubmit').click(function(){
			
			if(confirm('수정하시겠습니까?')) {
				$('#modifyForm').attr('action','/inquiry/modifyForm');
				alert('수정되었습니다.');
				console.log($('#modifyForm')[0]);
				$('#modifyForm')[0].submit();
				
				/* location.href = "/inquiry/modify2"; */
				
			}
		});
		
	});
		
</script> -->
<%@include file="../includes/footer.jsp"%>