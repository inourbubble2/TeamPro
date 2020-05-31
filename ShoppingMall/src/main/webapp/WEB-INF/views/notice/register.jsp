<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />

<%@include file="../includes/header.jsp"%>


<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">공지 등록</h2>
				</div>
			</div>
			
			<div id="content-bd">
			<form role="form" action="/notice/register" method="post">
				<div class="form-group">
					<label>ID</label>
<!-- 					id는 현재 로그인되어 있는 id로 설정한다 (수정 불가) -->
					<input class="form-control" name='id' value="<sec:authentication property="principal.username"/>" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>TITLE</label>
					<input class="form-control" name='title'>
				</div>
				
				<div class="form-group">
					<label>CONTENT</label><br>
					<textarea cols="156" rows="10" name='content'></textarea>
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