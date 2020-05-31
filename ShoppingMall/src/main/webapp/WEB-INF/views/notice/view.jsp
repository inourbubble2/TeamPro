<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

			<table style="padding: 7px 25px 7px 25px;">
				<tr>
					<td>${no.noticeNo }</td>
					<td>${no.id }</td>
				</tr>
				<tr>
					<td colspan='2'>${no.title }</td>
				</tr>
				<tr>
					<td colspan='2'><textarea cols="80" rows="16">${no.content }</textarea></td>
				</tr>
				<tr>
					<td colspan='2'>${format.format(no.noticeDate) }</td>
				</tr>
			</table>
			<div id="btns_1">
				<button
					onclick="location.href='/notice/updateForm?noticeNo=${no.noticeNo}'">
					<b>update</b>
				</button>
				<button
					onclick="location.href='/notice/delete?noticeNo=${no.noticeNo}'">
					<b>delete</b>
				</button>
				<button
					onclick="location.href='/notice/list'">
					<b>목록으로</b>
				</button>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>