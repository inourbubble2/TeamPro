<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- <link type="text/css" rel="stylesheet" href="../../../resources/css/add_table.css" /> -->

<%@include file="../includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">PRODUCT</h2>
				</div>
			</div>
			<!-- /section-title -->
					
			<!-- Product Single -->
			<c:forEach items="${list }" var="product">
				<div class="product product-single" style="display:inline; float:left; width:50%; height:210px; padding-left:25px;">
					<div class="product-thumb">
						<div class="product-label">
							<span><c:out value="${product.productCode }" /></span>
							<!-- 제품 코드 넣기 -->
						</div>
						<button class="main-btn quick-view" onclick="location.href='view?productCode=${product.productCode }'">
							<i class="fa fa-search-plus"></i> Quick view
						</button>
						<img src="" alt="">
					</div>
					<div class="product-body">
						<h3 class="product-price">
							<fmt:formatNumber pattern="###,###,###" value="${product.price }"/>원
						</h3>
						<h2 class="product-name">
							<a href="#"> <c:out value="${product.productName }" />
							</a>
						</h2>
						<h4>
							<c:out value="${product.description }" />
						</h4>
						<div class="product-btns">
							<sec:authorize access="isAuthenticated()">
								<button class="primary-btn add-to-cart" onclick="location.href='view?productCode=${product.productCode }'">
								<i class="fa fa-shopping-cart"></i> Add to Cart
							</button>
							</sec:authorize>
							
							<sec:authorize access="isAnonymous()">
								<button class="primary-btn add-to-cart" onclick="location.href='/customLogin'">
								<i class="fa fa-shopping-cart"></i> Add to Cart
							</button>
							</sec:authorize>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- /Product Single -->
			<div class="pull-right">
				<ul class="pagination">

					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage - 1 }">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<!-- 현재 페이지에 강조 표시를 해준다.(현재 페이지: active, 그외: 빈칸) -->
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num }">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>

			<form id="pageForm" action="/product/list" method="get">
					<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum }"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
					<input type="hidden" name="type"
					value="<c:out value='${pageMaker.cri.type }'/>"> 
					<input type="hidden" name="keyword"
					value="<c:out value='${pageMaker.cri.keyword }'/>">
			</form>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<script type="text/javascript">
$(document).ready(
		function() {
			var actionForm = $("#pageForm");
			//paginate_button이라는 클래스에 존재하는 a 태그를 클랙했을 때
			$(".paginate_button a").on("click", function(e) {
				//현재 이벤트의 기본 이벤트를 중단한다.
				e.preventDefault();
				console.log('click');
				//actionForm의 하위 요소를 찾아서 href라는 속성의 값을 대입한다.
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			}
	);

</script>

<%@include file="../includes/footer.jsp"%>