<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />

<%@include file="../includes/header.jsp"%>
<style>
button {
	display: block;
	margin: 0 auto;
	margin-top: 15px;
}
</style>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">공지사항</h2>
				</div>
			</div>
			
			<table>
				<tr>
				<td style="width:100px;">공지번호</td>
				<td style="width:550px;">제목</td>
				<td style="width:200px;">등록날짜</td>
				</tr>
				<c:forEach var="no" items="${list }">
					<tr>
						<td>${no.noticeNo }</td>
						<td><a href="/notice/view?num=${no.noticeNo}">${no.title }</a></td>
						<td>${format.format(no.noticeDate) }</td>
					</tr>
				</c:forEach>
			</table>
			
			<button onclick="location.href='/notice/register'">공지 등록</button>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>