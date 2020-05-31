<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">USER JOIN</h2>
				</div>
			</div>
			<!-- /section-title -->

			<form role="form" action="/join" method="post"
				style="margin: 80px 0px 0px 25px;">
				<div class="form-group">
					<label>아이디</label> <input class="form-control" name="id">
				</div>

				<div class="form-group">
					<label>패스워드</label> <input class="form-control" type="password"
						name="password">
				</div>

				<div class="form-group">
					<label>이름</label> <input class="form-control" name="name">
				</div>

				<div class="form-group">
					<input type="button" onclick="sample5_execDaumPostcode()"
						value="도로명 주소 검색"><br> <input class="form-control"
						name="address" type="text" id="sample5_address" placeholder="주소">
					<div id="map"
						style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
					<!-- 					sdk.js?appkey=  카카오 api 주소 발급받으면 그코드 이용 -->
					<script
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d03d7bba5d78d35e84bbc67d01a7c7c0&libraries=services"></script>
					<script>
    					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
				</div>

				<div class="form-group">
					<label>연락처</label> <input class="form-control" name="contact">
				</div>

				<div class="form-group">
					<label>이메일</label> <input class="form-control" name="email">
				</div>

				<button type="submit" class="btn btn-default">회원가입</button>
				<button type="reset" class="btn btn-default">RESET</button>
				<button type="button" class="btn btn-default"
					onclick="location.href=/product/list">취소</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="includes/footer.jsp"%>