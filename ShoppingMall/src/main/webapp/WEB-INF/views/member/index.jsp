<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<style>
#explain{
margin: 100px 0px 40px 40px;
font-size: 120%;
}
img{
margin-left:20px;
}
</style>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">HOME</h2>
				</div>
			</div>
			
			<img alt="logo_image" src="../../resources/img/laptop.jpg">
			
			<div id="explain">
				<h3>인터넷 웹 쇼핑몰 E-SHOP에 오신 것을 환영합니다.</h3><br>
				저희 쇼핑몰의 위치와 정보를 알고 싶다면 <a href="/aboutUs">여기</a>에서 확인하십시오.<br>
				
			</div>
			
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>