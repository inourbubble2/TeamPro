<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>2조 컴퓨터 판매 쇼핑몰 E-SHOP</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="../../../resources/css/bootstrap.min.css" />
	
	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="../../../resources/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="../../../resources/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="../../../resources/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="../../../resources/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="../../../resources/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<style>
#headtbl {
	width: 364px;
	height: 40px;
	margin-left: 400px;
	margin-top: -40px;
}

#httr1 {
	border: 1px solid rgb(169, 169, 169);
	width: 100px;
	padding: 0px 18px;
	font-family: 'Hind', sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #4A4E5A;
}

#httr2 {
	border: 1px solid rgb(169, 169, 169);
	width: 229px;
	padding: 0px 10px 0px 10px;
}

#price {
	display: inline;
	width: 150px;
	vertical-align: middle;
}
</style>
</head>

	<!-- jQuery Plugins -->
	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/bootstrap.min.js"></script>
	<script src="../../../resources/js/slick.min.js"></script>
	<script src="../../../resources/js/nouislider.min.js"></script>
	<script src="../../../resources/js/jquery.zoom.min.js"></script>
	<script src="../../../resources/js/main.js"></script>
	
	
    <script src="../../../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Tables -->
    <script src="../../../resources/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../../../resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="../../../resources/js/sb-admin.js"></script>
    
<body>
	<!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome to E-shop!</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
						<li><a href="/notice/list">Notice</a></li>
						<li><a href="/product/list">Store</a></li>
						<li><a href="/inquiry/list">Inquiry</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /top Header -->

		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">

					<!-- Search -->
					<div class="header-search">
						<form action="/product/list" method="get">
							<input class="input search-input" type="text" name="keyword" placeholder="Enter your keyword">
							<select class="input search-categories" name="type">
								<option value="N">Name</option>
								<option value="C">Code</option>
								<option value="M">Manufacturer</option>
								<option value="D">Description</option>
							</select>
							
							<!-- <table id="headtbl">
								<tr>
									<td id="httr1">Price</td>
									<td id="httr2">0 <input type="range" id="price"
										name="price" value="100"> 
										<output name="x" for="price" style="display:inline;"/>
									</td>
							</table> -->
							
							<button class="form"><i class="fa fa-search"></i></button>
							<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum }"> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
						</form>
					</div>
					<!-- /Search -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">My Account <i class="fa fa-caret-down"></i></strong>
							</div>
							<sec:authorize access="isAnonymous()">
									<b>guest님</b><br>
									<a href="/customLogin" class="text-uppercase">Login</a> / <a href="/join" class="text-uppercase">Join</a>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
									<b><sec:authentication property="principal.username"/>님</b><br> <!-- username means id -->
									<a href="/customLogout" class="text-uppercase">Logout</a>
							</sec:authorize>
							<ul class="custom-menu">								
								<!-- 로그인되어있으면 -->
								<sec:authorize access="isAuthenticated()">
									<li><a href="/member/getMember"><i class="fa fa-user-o"></i> My Account</a></li>
									<li><a href="/cart/cartList"><i class="fa fa-heart-o"></i> My Cart</a></li>
									<li><a href="/cart/paymentList"><i class="fa fa-heart-o"></i> Order List</a></li>
									<li><a href="/customLogout"><i class="fa fa-unlock-alt"></i> Logout</a></li>
								</sec:authorize>
								
								<!-- 로그인이 안되어있으면 -->
								<sec:authorize access="isAnonymous()">
									<li><a href="/customLogin"><i class="fa fa-user-o"></i> My Account</a></li>
									<li><a href="/customLogin"><i class="fa fa-heart-o"></i> My Cart</a></li>
									<li><a href="/customLogin"><i class="fa fa-heart-o"></i> Order List</a></li>
									<li><a href="/customLogin"><i class="fa fa-unlock-alt"></i> Login</a></li>
								</sec:authorize>
								<li><a href="/join"><i class="fa fa-user-plus"></i> Create An Account</a></li>
							</ul>
						</li>
						<!-- /Account -->

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<strong class="text-uppercase">My Cart:</strong>
								<br>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
										<!-- product widget -->
										<!-- end widget -->
									</div>
									<div class="shopping-cart-btns">
										<button class="main-btn">View Cart</button>
										<button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
									</div>
								</div>
							</div>
						</li>
						<!-- /Cart -->
					</ul>
				</div>
			</div>
			<!-- header -->
			<script type="text/javascript" src="../../../resources/js/cart.js"></script>
			<!-- <script type="text/javascript">
				$(document).ready(function() {
					
					var myCart = $(".shopping-cart-list");
					
					showCartList();
					function showCartList(){
						cartService.getList({}, function(list){
							console.log(list);
							
							if(list == null || list.length == 0){
								myCart.html("");
								return;
							}
							
							var str = "";
							for(var i = 0, len = list.length || 0; i < len; i++){
								str += '<div class="product product-widget">';
								str += '<div class="product-thumb">';
								str += '<img src="" alt="">';
								str += '</div>';
								str += '<div class="product-body">';
								str += '<h3 class="product-price">' + list[i].price + '<span class="qty">' + list[i].amount + '</span></h3>';
								str += '<h2 class="product-name"><a href="/product/view?productCode=' + list[i].productCode + '">' + list[i].productCode + '</a></h2>';
								str += '</div>'; //end productBody
								str += '</div>'; //end product widget
							}
							myCart.html(str);
						}); //end function
					} //end showCartList
					
				}); // end document.ready
			</script> -->
			
	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- menu nav -->
				<div class="menu-nav">
					<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="/">Home</a></li>
						<li><a href="/product/list">Shop</a></li>
						<li><a href="/product/list?type=productType&keyword=데스크탑">PC</a></li>
						<li><a href="/product/list?type=productType&keyword=노트북">Laptop</a></li>
						<li><a href="/product/list?type=productType&keyword=모니터">Monitor</a></li>
						<li><a href="/admin/index">관리자용</a></li>
					</ul>
				</div>
				<!-- menu nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->			
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->
	
	
	