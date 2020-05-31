<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}
</style>


<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Shopping Cart</li>
			</ol>
		</div>
		<div class="table-responsive cart_info">
			<!-- 체크박스 모두 활성화 -->
			<div class="allCheck">
				<input type="checkbox" name="allCheck" id="allCheck" /><label
					for="allCheck">모두 선택</label>
				<script>
					$("#allCheck").click(function() {
						var chk = $("#allCheck").prop("checked");
						if (chk) {
							$(".chBox").prop("checked", true);
						} else {
							$(".chBox").prop("checked", false);
						}
					});
				</script>
			</div>

			<!-- delete 버튼 -->
			<div class="delBtn">
				<button type="button" class="selectDelete_btn">선택 삭제</button>
				<script>
					$(document).ready(function(e) {
						$(".selectDelete_btn").click(function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");

							if (confirm_val) {
								var checkArr = new Array();

								$("input[class='chBox']:checked").each(function() {
									checkArr.push($(this).attr("data-cartNum"));
								
								});

								$.ajax({
									url : "/cart/deleteCart",
									type : "post",
									data : {
										chbox : checkArr
									},
									beforeSend : function(xhr) { //csrf token값 보내기
										xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
									},
									success : function() {
										alert("삭제 성공");
										location.href = "/cart/cartList";
									},
									error : function() {
										alert("삭제 실패");
									}
								});
							}
						});
					});
				</script>
			</div>

			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="">상품</td>
						<td>코드</td>
						<td class="price">개당 가격</td>
						<td class="quantity">구입 수량</td>
						<td class="totalPrice">최종 가격</td>
					</tr>
				</thead>
				<tbody>

					<c:set var="sum" value="0" />

					<c:forEach items="${cart }" var="cart">
						<tr>
							<td>
								<div class="checkBox">
									<input type="checkbox" name="chBox" class="chBox"
										data-cartNum="${cart.cartNo}" />
								</div>	
							</td>
							<td>
								<p>${cart.productCode }</p>
							</td>
							<td>
								<p>
									<fmt:formatNumber pattern="###,###,###" value="${cart.price }" />
									원
								</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">

									<input class="cart_quantity_input" type="text" name="quantity"
										value="${cart.amount }" autocomplete="off" size="1"
										readonly="readonly">

								</div>
							</td>
							<td class="cart_totalPrice">
								<p>
									<fmt:formatNumber pattern="###,###,###"
										value="${cart.price * cart.amount}" />
									원
								</p>
							</td>
						</tr>

						<c:set var="sum" value="${sum + (cart.price * cart.amount)}" />
						
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 장바구니 정보 총 합계와 주문 정보 입력 -->
		<div class="listResult">
			<div class="sum">
				<b>총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</b>
			</div>
			<div class="orderInput">
				<button type="button" class="orderInput_btn">주문 정보 입력</button>

				<!-- 주문 정보 입력 버튼 누르면 orderInfo 페이지가 나타나고 주문 정보 입력 버튼이 없어짐 -->
				<script>
					$(".orderInput_btn").click(function() {
						$(".orderInfo").slideDown();
						$(".orderInput_btn").slideUp();
					});
				</script>
			</div>
		</div>
		<br>

		<div class="orderInfo">			
			<form role="form" action="/cart/orderInput" method="post"
				autocomplete="off">
				<c:forEach items="${cart }" var="cart">
					<input type="hidden" name="totalPrice" value="${sum}">
					<input type="hidden" name="productCode" value="${cart.productCode }">
					<input type="hidden" name="cartNo" value="${cart.cartNo }">
					<input type="hidden" name="amount" value="${cart.amount}">						
				</c:forEach>
				
				<input type="hidden" name="id" value="<sec:authentication property='principal.username'/>">
				<div class="form-group">
					<label>수령인</label> <input class="form-control" name="name"
						id="name" required="required">
				</div>
				<div class="form-group">
					<label>수령인 연락처</label> <input class="form-control" name="contact"
						id="contact" required="required">
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
					<input type="submit" class="order_btn" value="주문">
					<button type="button" class="cancel_btn">취소</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<!-- 취소 버튼 누르면 orderInfo 페이지가 없어지고 주문 정보 입력 버튼이 생김 -->
					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderInput_btn").slideDown();
						});
					</script>
				</div>
			</form>
		</div>

	</div>
</section>
<!--/#cart_items-->

<%@include file="../includes/footer.jsp"%>