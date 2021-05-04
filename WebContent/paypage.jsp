<%@page import="com.project.fp.dto.ProductDto"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$('.pay_method').eq(0).click(function() {
			$('input[name=pay_method]').val("card");
			$('input[name=pay]').val('신용카드');
		});
		$('.pay_method').eq(1).click(function() {
			$('input[name=pay_method]').val("trans");
			$('input[name=pay]').val('실시간 계좌 이체');
		});
		$('.pay_method').eq(2).click(function() {
			$('input[name=pay_method]').val("vbank");
			$('input[name=pay]').val('가상계좌');
		});
		$('.pay_method').eq(3).click(function() {
			$('input[name=pay_method]').val("phone");
			$('input[name=pay]').val('휴대폰 소액 결제');
		});
		$('.pay_method').eq(4).click(function() {
			$('input[name=pay_method]').val("cultureland");
			$('input[name=pay]').val('문화상품권');
		});
		$('.pay_method').eq(5).click(function() {
			$('input[name=pay_method]').val("smartculture");
			$('input[name=pay]').val('스마트 문화상품권');
		});
		$('.pay_method').eq(6).click(function() {
			$('input[name=pay_method]').val("happymoney");
			$('input[name=pay]').val('해피머니');
		});
		$('.pay_method').eq(7).click(function() {
			$('input[name=pay_method]').val("booknlife");
			$('input[name=pay]').val('도서 문화상품권');
		});
	});
	function cancle() {
		var purch = document.getElementsByName("pur")[0];
		var prod_num = document.getElementsByName("product_num")[0];
		var member_id = document.getElementsByName("member_id")[0];
		if (purch == 1) {
			location.href = "semi.do?command=shopping_detail&prod_num="
					+ prod_num;
		} else {
			location.href = "semi.do?command=basket_list&member_id="
			_member_id;
		}
	}
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#paypage_mid_con {
	width: 600px;
	margin: 0 auto;
	min-height: 1000px;
}

#pay {
	width: 100%;
	font-weight: bolder;
	height: 40px;
	font-size: 30px;
	margin-bottom: 10px;
}
#pay_div{
	height: 120px;
}
.pay_method {
	width: 25%;
	float: left;
	text-align: center;
	border: 1px solid black;
	height: 35px;
	font-size: 16px;
	vertical-align: middle;
}

.pay_method:hover {
	background: #e2e2e2;
}

.pay_method_span {
	display: block;
	padding-top:5px;
	width: 100%;
	
}

.product_name {
	margin-top: 10px;
	width: 100%;
	font-size: 25px;
}
.product_price{
	margin-top: 10px;
	width: 100%;
	font-size: 25px;
	margin-bottom: 10px;
}
</style>
</head>
<%
int total_price = (int) request.getAttribute("total_price");
int pur = (int) request.getAttribute("pur");
int product_num = (int) request.getAttribute("product_num");
String product_name = (String) request.getAttribute("product_name");

MemberDto dto = (MemberDto) session.getAttribute("dto");
String member_id = dto.getMember_id();
%>
<body>
	<jsp:include page="header.jsp" />
	<div id="paypage_mid_con">
		<h3>상품 결제 페이지</h3>

		<div id="paypage">
			<form action="semi.do" method="POST">
				<input type="hidden" name="command" value="payment" />
				<input type="hidden" name="member_id" value="<%=member_id%>" />
				<input type="hidden" name="product_num" value="<%=product_num%>" />
				<input type="hidden" name="product" value="<%=product_name%>" />
				<input type="hidden" name="totalPrice" value="<%=total_price%>" />
				<input type="hidden" name="pur" value="<%=pur%>" />
				<input type="hidden" name="pay_method" value="" />
				<div id ="pay_div">
					<div id="pay">결제 수단 : <input style="border:none;" name="pay" type="text" value=""/></div>
					<div class="pay_method">
						<span class="pay_method_span">신용카드</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">실시간 계좌 이체</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">가상계좌</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">휴대폰 소액 결제</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">문화상품권</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">스마트 문화상품권</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">해피머니</span>
					</div>
					<div class="pay_method">
						<span class="pay_method_span">도서 문화상품권</span>
					</div>
				</div>
				<div class="product_name">
					<div>
						<%=product_name%>
					</div>
				</div>

				<div class="product_price">
					<div>
						총 결제 금액 : <%=total_price%>원
					</div>
				</div>
				<div>
					<input class='btn btn-outline-secondary' style='font-weight: bold' type="submit" value="결제하기" />
					<input class='btn btn-outline-secondary' style='font-weight: bold' type="button" value="취소" onclick="location.href='semi.do?command=shopping_detail&prod_num=<%=product_num%>'" />
				</div>

			</form>
		</div>
	</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>