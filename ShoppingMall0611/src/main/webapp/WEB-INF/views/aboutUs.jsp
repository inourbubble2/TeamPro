<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" />

<%@include file="includes/header.jsp"%>

<style>
#map {
width:500px;
height:400px;
}
section{
margin-left: 655px;
margin-top: -400px;
}
</style>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">ABOUT US</h2>
				</div>
			</div>
			
			<div style="margin:80px 0px 0px 25px; font-size:105%;">
				저희 쇼핑몰은 PC와 PC 주변기기를 판매하는 온라인 거래 웹 사이트입니다.<br>
				데스크탑, 노트북, 모니터 등의 기기를 그 어느 곳보다 좋은 품질과 가격으로 구매할 수 있습니다.<br>
				고객의 요구에 맞는 기기를 검색하고 구매할 수 있습니다.<br>
				만족도에 따라 평점을 남기고 리뷰를 등록할 수 있습니다.<br>
				모든 리뷰엔 담당 관리자가 직접 답변을 달아드립니다.<br>
				긴급사항은 000-0000-0000으로 연락해 주시기 바랍니다.
			</div>
			
			<section>
				<div id="map"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54974f1dbe52b46cc9118c640f479834"></script>
				<script>
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new daum.maps.LatLng(37.556458, 126.945163), //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};

				var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
				</script>
			</section>
		</div>
	</div>
</div>

<%@include file="includes/footer.jsp"%>