<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
				<div class="inquiry" style="padding-left: 20px">
					<c:forEach items="${replyList }" var="replyList"><br>
						<h5>관리자 답변 내용</h5>
						<table width="500" style="border: 1px;">
							<tr>
								<td><b>작성일</b></td>
								<td>${replyList.replyDate } </td>
							</tr>
							<tr>
								<td><b>제목</b></td>
								<td>${replyList.title }</td>
							</tr>
							<tr>
								<td><b>내용</b></td>
								<td>${replyList.content }</td>
							</tr>
						</table>
					</c:forEach>
				</div>

		</div>
	</div>
	<!-- /row -->
</div>
<!-- /container -->
<!-- /section -->


<%@include file="../../includes/footer.jsp"%>