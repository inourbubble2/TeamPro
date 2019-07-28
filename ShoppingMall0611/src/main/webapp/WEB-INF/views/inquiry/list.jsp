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
					<h2 class="title">INQUIRY</h2>
				</div>
			</div>
			<!-- end secton-title -->

			<div class="inquiry" style="padding: 15px">
				<table width="700px" height="300px">
					<tr>
						<td><strong>글 번호</strong></td>
						<td><strong>아이디</strong></td>
						<td><strong>이름</strong></td>
						<td><strong>제목</strong></td>
						<td><strong>날짜</strong></td>
					</tr>
					<c:forEach items="${inquiry }" var="inquiry">
						<tr>
							<td>${inquiry.inquiryNo }</td>
							<td>${inquiry.id }</td>
							<td>${inquiry.name }</td>
							<td	onclick="location.href='/inquiry/view?inquiryNo=${inquiry.inquiryNo}'">${inquiry.title }</td>
							<td><fmt:formatDate value="${inquiry.inquiryDate }"	pattern="yyyy-MM-dd" /></td>
						</tr>
						<c:forEach items="${reply }" var="reply">
							<c:if test="${reply.inquiryNo == inquiry.inquiryNo }">
								<tr>
									<td>&nbsp;&nbsp;〉</td>
									<td>&nbsp;&nbsp;${reply.id }</td>
									<td>&nbsp;&nbsp;관리자</td>
									<td	onclick="location.href='/admin/inquiry/view?replyNo=${reply.replyNo}'">
									&nbsp;&nbsp;${reply.title }</td>
									<td>&nbsp;&nbsp;<fmt:formatDate value="${reply.replyDate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
			</div>

			<div class="pull-right">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage - 1 }">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<!-- 현재 페이지에 강조 표시를 해준다.(현재 페이지: active, 그외: 빈칸) -->
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num }">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
			
			<form id="pageForm" action="/inquiry/list" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
			</form>
			
			<sec:authorize access="isAuthenticated()"> 
				<button class="btn btn-outline-info" onclick="location.href='/inquiry/registerForm'">글쓰기</button>
											
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
				<button class="btn btn-outline-info" onclick="location.href='/customLogin'">글쓰기</button>					
			</sec:authorize>
			
			<!-- <a href="/inquiry/register" role="button" class="btn btn-outline-info">글쓰기</a> -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</div>
<!-- end section -->


<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#pageForm");
		//paginate_button이라는 클래스에 존재하는 a 태그를 클랙했을 때
		$(".paginate_button a").on("click", function(e) {
			//현재 이벤트의 기본 이벤트를 중단한다.
			e.preventDefault();
			console.log('click');
			//actionForm의 하위 요소를 찾아서 href라는 속성의 값을 대입한다.
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

	});
</script>

<%@include file="../includes/footer.jsp"%>