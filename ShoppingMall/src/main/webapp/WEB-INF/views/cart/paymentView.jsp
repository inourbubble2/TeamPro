<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
					<h2 class="title">Order Detail View</h2>
				</div>
			</div>
			<!-- /section-title -->
			<div class="paymentList" style="margin:80px 0px 10px 25px; border:1px solid black; font-size:110%;">
				<ul class="paymentList">
					<c:forEach items="${paymentView}" var="paymentView" varStatus="status">
						<c:if test="${status.first}">
   							<p><span>수령인</span> ${paymentView.name}</p>
    						<p><span>주소</span> ${paymentView.address}</p>
    						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${paymentView.totalPrice}" /> 원</p>
   						</c:if>
					</c:forEach>
				</ul>
			</div>

			<ul class="paymentView">
				<c:forEach items="${paymentView}" var="paymentView">
					<li style="margin-left:25px; border:1px solid black; font-size:110%;">
						<div class="gdsInfo">
							<p>	
								<span>상품명</span> ${paymentView.productName}<br /> 
								<span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${paymentView.price}" />
								원<br /> 
								<span>구입 수량</span> ${paymentView.amount} 개<br /> 
								<span>최종 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${paymentView.price * paymentView.amount}" />
								원
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>
