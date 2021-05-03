<%@page import="com.project.fp.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<%
	ProductDto p_dto = (ProductDto) request.getAttribute("p_dto");
%>
<body>
<jsp:include page="header.jsp" />
	<h3>SHOPPING_DETAIL</h3>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="basket_insertres" />
		<c:if test="${dto ne null }">
			<input type="hidden" name="member_id" value="${dto.member_id }" />
		</c:if>
		<input type="hidden" name="prod_num" value="<%=p_dto.getProd_num() %>" />
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							상품명 <input type="text" class="form-control" name="prod_name" value="<%=p_dto.getProd_name() %>" readonly="readonly" >
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group mb-3">
							상품 가격 <input type="text" class="form-control" name="prod_price" value="<%=p_dto.getProd_price()%>" readonly="readonly">
						</div>
					</div>
					<div class="col-sm-9" >
						<div class="input-group mb-12" >
							상품설명 <textarea rows="10" cols="40" class="form-control" name="prod_explain" readonly="readonly"><%=p_dto.getProd_explain() %></textarea>
						</div>
					</div>
					<div class="col-sm-9" >
						<div class="input-group mb-12" >
							구매수량 <input type="number" name="order_quantity">
						</div>
					</div>
				</div>
				
				<hr>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="custom-file">
							&nbsp;
							<button type="submit" class="btn btn-outline-secondary" style="float: right; width: 30%; font-weight: bold; margin-right: 10px;">장바구니에 추가</button>
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="location.href='semi.do?command=shopping'">취 소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
<jsp:include page="bottom.jsp" />
</body>
</html>