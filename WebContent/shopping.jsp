<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>상품</h1>
		<form action="semi.do" method="post">
		<input type="hidden" name="command" value="shopping">
	<table border="1">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		
		<tr>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>판매가</th>
			<th>할인</th>
			<th>재고</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="5">----------작성된 글이 존재하지 않습니다----------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.prod_img }</td>
						<td>
							<a href="semi.do?command=shopping_detail&prod_num=${dto.prod_num }">${dto.prod_name }</a>
						</td>
						<td>${dto.prod_price }</td>
						<td>${dto.prod_sale }</td>
						
						<td>${dto.prod_stock }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글작성" onclick="location.href='semi.do?command=shop_insertform'" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>