<%@page import="com.project.fp.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="com.project.fp.biz.ProductBiz"%>
<%@page import="com.project.fp.biz.ProductBizImpl"%>
<%@page import="com.project.fp.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
</head>
<style>
.semiproject_shopping_detail {
	padding-left: 15px;
	padding-right: 15px;
	margin-left: 82px;
	margin-top: -140px;
}

.prod_info {
	margin-left: 300px;
	margin-top: -200px;
}

.detail_explain {
	margin-top: 50px;
	margin-left: 200px;
}
</style>
<body>
	<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	ProductDto p_dto = (ProductDto) request.getAttribute("p_dto");
	%>

	<jsp:include page="header.jsp" />
	<form action="semi.do" method="post">
		<input type="hidden" name="command" value="shopping_detail">
		<input type="hidden" name="member_id" value="<%=dto.getMember_id()%>">
		<input type="hidden" name="prod_num" value="${p_dto.prod_num }">
		<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom">
			<a class="navbar-brand ml-2 font-weight-bold" href="#">MENU</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor" aria-controls="navbarColor" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor">
				<ul class="navbar-nav">
					<li class="nav-item "><a class="nav-link" href="semi.do?command=shopping">Home</a></li>
				</ul>
			</div>
		</nav>
		<div class="filter">
			<button class="btn btn-default" type="button" data-toggle="collapse" data-target="#mobile-filter" aria-expanded="false" aria-controls="mobile-filter">
				Filters
				<span class="fa fa-filter pl-1"></span>
			</button>
		</div>
		<div id="mobile-filter">
			<div>
				<h6 class="p-1 border-bottom">SHOP</h6>
				<ul>
					<li><a href="semi.do?command=category&prod_category=feed">사료/간식</a>
					<li><a href="semi.do?command=category&prod_category=care">케어</a></li>
					<li><a href="semi.do?command=category&prod_category=living">리빙</a></li>
					<li><a href="semi.do?command=category&prod_category=outing">외출</a></li>
					<li><a href="semi.do?command=category&prod_category=toy">장난감</a></li>
					<li><a href="semi.do?command=category&prod_category=fashion">패션</a></li>

				</ul>
			</div>
		</div>
		<div class="semiproject_shopping_detail">
			<div class="detail">
				<div>
					<div>
						<span class="prod_img">
							<img src="resources/images/product/${p_dto.prod_num }.jfif">
						</span>
					</div>
					<div class="prod_info">
						<div>
							<span class="prod_name">
								<span> 상&nbsp;품&nbsp;명&nbsp; : </span>
								${p_dto.prod_name}
							</span>
						</div>
						<div>
							<span> 판&nbsp;매&nbsp;가&nbsp; : </span>
							<span>
								<fmt:formatNumber value="${p_dto.prod_price}" pattern="#,###" />
								<input type="hidden" name="prod_price" value="${p_dto.prod_price}">
							</span>
						</div>
						<div>
							<span> 할&nbsp;인&nbsp;율&nbsp; : </span>
							<span> ${p_dto.prod_sale} </span>
						</div>
						<div>
							<span> 구매수량 : </span>
							<span>
								<input type="number" name="order_quantity" min="1" max="50" value="1" />
							</span>
						</div>
						<div>
							<span> 남은수량 : </span>
							<span>
								${p_dto.prod_stock}
								<input type="hidden" name="prod_stock" value="${p_dto.prod_stock}">
							</span>
						</div>
						<div>
							<span> 제&nbsp;조&nbsp;사&nbsp; : </span>
							<span> ${p_dto.prod_mfr} </span>
						</div>

						<input type="submit" class="btn" value="[장바구니 담기]" formaction="semi.do?command=basket_add">
						<input type="submit" class="btn" value="[바로 구매하기]" formaction="semi.do?command=paypage&purch=one">
					</div>
				</div>

			</div>
		</div>
		<hr>
		<div class="detail_explain">

			<span> 상세설명 </span>
			<span>
				<p>${p_dto.prod_explain}</p>
			</span>

		</div>

	</form>
	<jsp:include page="bottom.jsp" />
</body>
</html>