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
					<h2 class="title">VIEW INQUIRY</h2>
				</div>
			</div>
			<!-- /section-title -->
			<form action="/inquiry/delete" method="post" onsubmit="return false;">
			<div class="container" style="padding: 20px">
				<div class="inquiry" style="padding-left: 15px">
					<h5>${inquiry.inquiryNo }번째문의글</h5>
					<table width="500px" style="border: 1px">
						<tr>
							<td><b>아이디</b></td>
							<td>${inquiry.id }</td>
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
							<td>${inquiry.title }</td>
						</tr>
						<tr>
							<td><b>내용</b></td>
							<td><textarea cols="30" name="content" id="content">${inquiry.content } </textarea></td>
						</tr>
					</table>
				</div><br>
				<button onclick="location.href='/inquiry/list'" class="btn btn-primary">Back to	list</button>
				<button id="modifyBtn" class="btn btn-primary">수정하기</button>
				<button id="deleteBtn" class="btn btn-danger">삭제하기</button>
				<button class="btn btn-primary">
					<a href="/admin/inquiry/registerForm?inquiryNo=${inquiry.inquiryNo }">Answer</a>
				</button>
			</div>
			</form>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->

<script>
	//게시물 삭제 confirm
	$(function(){
		$('#deleteBtn').click(function(){
			
		if(confirm("정말로 삭제하시겠습니까?")){
			
			location.href = "/inquiry/delete?inquiryNo=${inquiry.inquiryNo}";
		}
	});
		//게시물 수정페이지로 이동
		$('#modifyBtn').click(function(){
			
			location.href = "/inquiry/modifyForm?inquiryNo=${inquiry.inquiryNo}";	
		});
});
		
</script>

<%@include file="../includes/footer.jsp"%>