<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />

<%@include file="../includes/header.jsp"%>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">공지사항</h2>
				</div>
			</div>
			
			<div id="content_bd">
<!-- 			noticeNo와 id는 변경 불가능으로 처리한다 (같은 id여야 변경할 수 있는 기능 미구현, 공지 올리는 것은 admin뿐이므로 불필요?) -->
			<form role="form" action="/notice/update" method="post">
				<div class="form-group">
					<label>NOTICENO</label>
					<input class="form-control" name='noticeNo' value="${no.noticeNo }" readonly="readonly">
				</div>
			
				<div class="form-group">
					<label>ID</label>
					<input class="form-control" name='id' value="<sec:authentication property="principal.username"/>" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>TITLE</label>
					<input class="form-control" name='title' value="${no.title }">
				</div>
				
				<div class="form-group">
					<label>CONTENT</label><br>
					<textarea cols="156" rows="10" name='content'>${no.content }</textarea>
				</div>
				
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">RESET</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
			</div>
		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp"%>