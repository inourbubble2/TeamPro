<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!--  row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">REGISTER INQUIRY</h2>
					
					<form action="/inquiry/register" method="post">
						<div class="inquiry">
							<label>제목</label>
							<select id="title" name="title">
									<option value="사용자의 문의입니다.">사용자의 문의</option>
									<option value="제품문의입니다.">제품문의</option>
									<option value="배송문의입니다.">배송문의</option>
									<option value="환불문의입니다.">환불문의</option>
									<option value="기타 문의 사항입니다.">기타 문의 사항</option>
							</select> 
						</div>
						<div class="inquiry">
							<label>작성자</label>
							 <input type="text" id="name" name="name" 
							 value="<sec:authentication property='principal.user.name'/>" 
							 readonly="readonly">
						</div>
						<div class="inquiry">
							<label>내용</label><br>
							<textarea id="content" name="content" rows="5" placeholder="내용을 작성해주세요"></textarea>
						</div>
						<input type="hidden" name="id" value="<sec:authentication property='principal.username'/>"> 
						<input type="submit" class="btn btn-info" value="등록하기">
						<button onclick="location.href='/inquiry/list'"	class="btn btn-info">목록으로</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</div>
			</div>
			<!-- end secton-title -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</div>
<!-- end section -->


<!-- <script type="text/javascript">
	//댓글 달기		
	$("#submit").on("click", function(e) {
		e.preventDefault();
		
		var title = $("#title").val();
		var name = $("#name").val();
		var content = $("#content").val();
		
		var inquiryVO = {
			title : title,
			name : name,
			content : content
		};

		$.ajax({
			url : "/inquiry/register",
			type : "post",
			data : inquiryVO,
			success : function() {
				alert("게시물 작성 성공");
				window.location.href = '/inquiry/list';
			},
			error : function() {
				alert("게시물 작성 실패");
			}
		});
	});
</script> -->

<%@include file="../includes/footer.jsp"%>