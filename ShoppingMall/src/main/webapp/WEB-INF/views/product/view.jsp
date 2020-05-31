<%@page import="come.team.domain.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!--  Product Details -->
			<div class="product product-details clearfix">
				<div class="col-md-6">
					<div id="product-main-view">
						<div class="product-view">
							<img src="../../../resources/img/main.jpg" alt="">
						</div>
					</div>
					<div id="product-view"></div>
				</div>

				<form action="/cart/addCart" method="post">
					<div class="col-md-6">
						<div class="product-body">
							<div class="product-label">
								<span>${board.productCode }</span>
							</div>
							<h2 class="product-name">${board.productName }</h2>
							<h3 class="product-price">
								<fmt:formatNumber pattern="###,###,###" value="${board.price }" />
								원
							</h3>
							<div>
								<div class="product-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<a href="#">3 Review(s) / Add Review</a>
							</div>
							<p>
								<strong>제조사: </strong>${board.manufacturer }</p>
							<p>
								<strong>사용용도: </strong>${board.usability }</p>
							<div class="product-options">
								<ul class="size-option">
									<li><span class="text-uppercase">운영체제:</span></li>
									<li class="active"><a href="#">${board.os }</a></li>
								</ul>
							</div>

							<div class="product-btns">
								<p>
									<strong>재고</strong>${board.stock }</p>
								개수 : <input type="number" name="amount" id="amount" size="1"><br>
								<br> <input type="hidden" name="productCode"
									value="${board.productCode }"> <input type="hidden"
									name="price" value="${board.price }">

								<sec:authorize access="isAuthenticated()">
									<input type="hidden" name="id"
										value="<sec:authentication property='principal.username'/>">
								</sec:authorize>

								<input type="hidden" name="productName"
									value="${board.productName }"> <input type="hidden"
									name="description" value="${board.description } ">

								<sec:authorize access="isAuthenticated()">
									<input type="submit" class="primary-btn add-to-cart"
										name="addCart" id="addCart" value="장바구니 담기">
								</sec:authorize>

								<sec:authorize access="isAnonymous()">
									<input type="button" class="primary-btn add-to-cart"
										name="addCart" id="addCart"
										onclick="location.href='/customLogin'" value="장바구니 담기">
								</sec:authorize>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<div class="pull-right">
									<button class="main-btn icon-btn">
										<i class="fa fa-heart"></i>
									</button>
									<button class="main-btn icon-btn">
										<i class="fa fa-exchange"></i>
									</button>
									<button class="main-btn icon-btn">
										<i class="fa fa-share-alt"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>

				<div class="col-md-12">
					<div class="product-tab">
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">사양</a></li>
							<li><a data-toggle="tab" href="#tab1">Details</a></li>
							<li><a data-toggle="tab" href="#tab2">Reviews</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab1" class="tab-pane fade in active">
								<p>${board.description }</p>
							</div>
							<div id="tab2" class="tab-pane fade in">

								<div class="row">
									<div class="col-md-6">
										<div class="product-reviews">
											<div class="reviewList">
												<!-- single review : review content -->

											</div>
											<!-- end single review -->

											<div class="panel-footer">
												<!-- pagination of review -->

											</div>

										</div>
									</div>
									<div class="col-md-6">
										<h4 class="text-uppercase">Write Your Review</h4>
										<p>고객만 리뷰를 작성할 수 있습니다.</p>
										<form name="review-form" class="review-form"
											action="/reviews/register" method="post">
											<div class="form-group">
												<input class="input" type="text" id="productCode"
													name="productCode" name="productCode"
													value="${board.productCode }" readonly="readonly" />
											</div>
											<div class="form-group">
												<textarea class="input" placeholder="Write your review"
													name="content"></textarea>
											</div>
											<div class="form-group">
												<div class="input-rating">
													<strong class="text-uppercase">Your Rating: </strong>
													<div class="stars">
														<input type="radio" id="star5" name="reviewPoint"
															value="5" /><label for="star5"></label> <input
															type="radio" id="star4" name="reviewPoint" value="4" /><label
															for="star4"></label> <input type="radio" id="star3"
															name="reviewPoint" value="3" /><label for="star3"></label>
														<input type="radio" id="star2" name="reviewPoint"
															value="2" /><label for="star2"></label> <input
															type="radio" id="star1" name="reviewPoint" value="1" /><label
															for="star1"></label>
													</div>
												</div>
											</div>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />

										</form>
										<sec:authorize access="isAuthenticated()">
											<button id="submitReview" class="primary-btn">Submit</button>
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<button onclick="location.href='/customLogin'"
												class="btn btn-warning">Submit</button>
										</sec:authorize>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /Product Details -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->

<!-- Modal Style -->
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 40%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	color: white;
}
</style>

<!-- The Modal -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<span class="close">&times;</span>
			<h2>Modify Review</h2>
		</div>
		<div class="modal-body" id="modal-body"></div>
		<div class="modal-footer">
			<button id="cancleBtn" class="btn btn-danger">Cancle</button>
			<button id="modifyBtn" class="btn btn-warning">Modify</button>
		</div>
	</div>

</div>

<script type="text/javascript" src="../../../resources/js/review.js"></script>


<!-- id값 가져오기 -->
<sec:authorize access="isAuthenticated()">
	<input type="hidden"
		value="<sec:authentication property="principal.username" />"
		id="username">
</sec:authorize>

<!-- 리뷰 리스트 조회 스크립트 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//review
						var productCode = $("#productCode").val();
						var replyUL = $(".reviewList");

						var id = $("#username").val(); //추가됨

						showList(1);

						function showList(page) {
							reviewService
									.getList(
											{
												productCode : productCode,
												page : page
											},
											function(reviewCnt, list) {
												
												console.log(list);

												if (page == -1) {
													pageNum = Math
															.ceil(reviewCnt / 10.0);
													showList(pageNum);
													return;
												}

												var str = "";
												if (list == null
														|| list.length == 0) {
													replyUL.html("");
													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {

													str += "<div class='single-review'>";
													str += "<div class='review-heading'>";
													str += "<div><b> No. "
															+ list[i].reviewNo
															+ "</b></div>";
													str += "<div><i class='fa fa-user-o'></i>"
															+ list[i].id
															+ "</a></div>";
													str += "<div><i class='fa fa-clock-o'></i>"
															+ reviewService
																	.displayTime(list[i].reviewDate)
															+ "</a></div>";
													str += "</div>";

													str += "<div class='review-rating pull-right'>";
													for (var j = 0; j < list[i].reviewPoint; j++) {
														str += "<i class='fa fa-star'></i>";
													}
													for (var k = list[i].reviewPoint; k < 5; k++) {
														str += "<i class='fa fa-star-o empty'></i>";
													}
													str += "</div>";

													str += '<div class="review-body">';
													str += '<p>'
															+ list[i].content
															+ '</p>';
													str += "</div>";
													if (id == list[i].id
															&& id != null
															&& id != "") { //추가됨
														str += "<button class='btn btn-warning btn-xs pull-right' onclick='modifyReview("
																+ list[i].reviewNo
																+ ")'>modify</button>";
														str += "<button class='btn btn-danger btn-xs pull-right' onclick='deleteReview("
																+ list[i].reviewNo
																+ ")'>delete</button>";
													}
													str += "<br>";
													str += "</div>";
												}
												replyUL.html(str);
												showReviewPage(reviewCnt);

											}); //end function
						}//end showList()

						var pageNum = 1;
						var reviewPageFooter = $(".panel-footer");

						function showReviewPage(reviewCnt) {
							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;

							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= reviewCnt) {
								endNum = Math.ceil(reviewCnt / 10.0);
							}
							if (endNum * 10 < reviewCnt) {
								next = true;
							}

							var str = "<ul class='pagination pull-right'>";

							if (prev) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (startNum - 1)
										+ "'>Previous</a></li>'";
							}

							for (var i = startNum; i <= endNum; i++) {
								var active = pageNum == i ? "active" : "";
								str += "<li class=page-item " + active + "><a class='page-link' href='" + i + "'> "
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'> <a class='page-link' href='"
										+ (endNum + 1) + "'>Next</a></li>";
							}
							str += "</ul>";
							reviewPageFooter.html(str);
						} //end showReviewPage

						reviewPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							var targetPageNum = $(this).attr("href");
							console.log("targetPageNum : " + targetPageNum);
							pageNum = targetPageNum;
							showList(pageNum);
						});

						//actionForm
						var actionForm = $("#actionForm");
						//pageinate_button이라는 클래스에 존재하는 a 태그를 클랙했을 때
						$(".paginate_button a").on(
								"click",
								function(e) {
									//현재 이벤트의 기본 이벤트를 중단한다.
									e.preventDefault();
									console.log('click');
									//actionForm의 하위 요소를 찾아서 href라는 속성의 값을 대입한다.
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						//상세히 보기
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											//선택한 요소 끝에 내용을 추가한다.
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();
										});

					});
</script>

<!-- 리뷰 등록 스크립트 -->
<script type="text/javascript">
	$("#submitReview").on(
			"click",
			function(e) {
				e.preventDefault();

				var reviewVO = $("form[name=review-form]").serialize();

				$.ajax({
					url : "/reviews/register",
					type : "post",
					data : reviewVO,
					success : function() {
						alert("리뷰를 작성하셨습니다.");
						window.location.href = "view?productCode="
								+ $("#productCode").val();
					},
					error : function() {
						alert("구매한 상품에만 리뷰를 작성하실 수 있습니다.");
					}
				});
			});
</script>

<!-- 모달 기본 스크립트 -->
<script>
	//Get the modal
	var modal = document.getElementById("myModal");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	//Get the cancle btn
	var cancleBtn = document.getElementById("cancleBtn");

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	cancleBtn.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>

<!-- 리뷰 수정 스크립트 -->
<script>
	function modifyReview(reviewNo) {

		//Get the modal-header
		modal.style.display = "block";

		//Get the modal-body
		var modalBody = $("#modal-body");

		var str = "";

		reviewService
				.getReview(
						reviewNo,
						function(data) { //review.js의 getReview 실헹해서 리뷰 데이타 가져오기
							str += "<div class='single-review'>";
							str += "<div class='review-heading'>";
							str += "<div><b> No. " + data.reviewNo
									+ "</b></div>";
							str += "<div><i class='fa fa-clock-o'></i>"
									+ reviewService
											.displayTime(data.reviewDate)
									+ "</a></div>";
							str += "</div>";

							str += "<div class='review-rating pull-right'>";
							for (var j = 0; j < data.reviewPoint; j++) {
								str += "<i class='fa fa-star'></i>";
							}
							for (var k = data.reviewPoint; k < 5; k++) {
								str += "<i class='fa fa-star-o empty'></i>";
							}
							str += "</div>";

							str += '<div class="review-body">';
							str += '<textarea id="content" class="form-control" style="min-width: 100%">'
									+ data.content + '</textarea>';
							str += "</div>";
							str += "<br>";
							str += "</div>";

							modalBody.html(str);
						});

		$("#modifyBtn").on(
				"click",
				function(e) {
					e.preventDefault();
					var content = $("#content").val();
					var reviewDate = new Date();

					var reviewVO = {
						reviewNo : reviewNo,
						content : content,
						reviewDate : reviewDate
					};
					console.log(reviewVO);

					$.ajax({
						url : "/reviews/modify/" + reviewVO.reviewNo,
						type : "put",
						data : JSON.stringify(reviewVO),
						contentType : "application/json; charset=utf-8",
						headers : {
							"X-CSRF-TOKEN" : $("input[name='_csrf']").val()
						},
						//          beforeSend : function(xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						//                xhr.setRequestHeader("Accept", "application/json");
						// xhr.setRequestHeader("content-Type", "application/json");
						//  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						//},
						success : function() { //삭제 완료 시 알림창을 띄우고, 모달창을 없애고, 새로고침을 한다.
							alert("리뷰 수정 성공");
							modal.style.display = "none";
							window.location.href = "view?productCode="
									+ $("#productCode").val();
						},
						error : function(xhr, status, er) {
							alert(er);
						}
					});

				}); //end modifyBtn onClick

	}
</script>

<!-- 리뷰 삭제 스크립트 -->
<script>
	function deleteReview(reviewNo) {
		var deleteResult = confirm("해당 댓글을 삭제하시겠습니까?"); //confirm창으로 삭제 여부 선택
		if (deleteResult == true) {
			$.ajax({
				url : "/reviews/" + reviewNo,
				type : "delete",
				data : reviewNo,
				headers : {
					"X-CSRF-TOKEN" : $("input[name='_csrf']").val()
				},
				success : function() { //삭제 완료 시 알림창을 띄우고, 모달창을 없애고, 새로고침을 한다.
					alert("삭제 완료");
					modal.style.display = "none";
					window.location.href = "view?productCode="
							+ $("#productCode").val();
				},
				error : function(er) {
					alert("리뷰 수정 실패" + er);
				}
			});
		} else {

		}
	}
</script>

<%@include file="../includes/footer.jsp"%>