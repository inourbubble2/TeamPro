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
					<h2 class="title">Order List</h2>
				</div>
			</div>
			<!-- /section-title -->
			<div class="paymentList">
				<ul class="paymentList" style="margin:80px 0px 0px 25px; font-size:110%;">
					<c:forEach items="${paymentList}" var="paymentList">
						<li>
							<div style="border:1px solid black;">
								<p>
									<span>주문번호</span><a href="/cart/paymentView?payCode=${paymentList.payCode}" style="color:blue; text-decoration: underline;">${paymentList.payCode}</a>
								</p>
								<p>
									<span>수령인</span> ${paymentList.name}</p>
								<p>
									<span>주소</span> ${paymentList.address} 
								</p>
								<p>
									<span>연락처</span> ${paymentList.contact} 
								</p>
								<p>
									<span>가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${paymentList.totalPrice}" />
									원
								</p>
								<p>
									<span>주문날짜</span> ${paymentList.payDate} 
								</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>
