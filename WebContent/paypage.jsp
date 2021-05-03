<%@page import="com.project.fp.dto.ProductDto"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function cancle() {
		var purch = document.getElementsByName("pur")[0];
		var prod_num = document.getElementsByName("product_num")[0];
		var member_id = document.getElementsByName("member_id")[0];
		if (purch == 1) {
			location.href="semi.do?command=shopping_detail&prod_num="+prod_num;
		} else {
			location.href="semi.do?command=basket_list&member_id="_member_id;
		}
	}

</script>
</head>
<%
	int total_price = (int)request.getAttribute("total_price");
	int pur = (int)request.getAttribute("pur");
	int product_num = (int)request.getAttribute("product_num");
	String product_name = (String)request.getAttribute("product_name");
	
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	String member_id = dto.getMember_id();
%>
<body>
<jsp:include page="header.jsp" />
	<h3>상품 결제 페이지</h3>

	<form action="semi.do" method="POST">
		<input type="hidden" name="command" value="payment" />
		<input type="hidden" name="member_id" value="<%=member_id%>" />
		<input type="hidden" name="product_num" value="<%=product_num %>" />
		<input type="hidden" name="product" value="<%=product_name %>" />
		<input type="hidden" name="totalPrice" value="<%=total_price %>" />
		<input type="hidden" name="pur" value="<%=pur %>" />
		<table border="1">
			<tr>
				<th>결제방식</th>
				<td>
					<select name="pay_method">
						<option value="card">신용카드</option>
						<option value="trans">실시간 계좌 이체</option>
						<option value="vbank">가상계좌</option>
						<option value="phone">휴대폰 소액 결제</option>
						<option value="cultureland">문화상품권</option>
						<option value="smartculture">스마트 문화상품권</option>
						<option value="happymoney">해피머니</option>
						<option value="booknlife">도서 문화상품권</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
					<%=product_name %>
				</td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td>
					<%=total_price %>원
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" value="결제하기" />
					<input type="button" value="취소" onclick="location.href='semi.do?command=shopping_detail&prod_num=<%=product_num %>'" />
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="bottom.jsp" />
</body>
</html>