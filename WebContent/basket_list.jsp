<%@page import="com.project.fp.dto.ProductDto"%>
<%@page import="com.project.fp.biz.ProductBizImpl"%>
<%@page import="com.project.fp.biz.ProductBiz"%>
<%@page import="com.project.fp.dto.Order_TableDto"%>
<%@page import="com.project.fp.biz.Order_TableBizImpl"%>
<%@page import="com.project.fp.biz.Order_TableBiz"%>
<%@page import="com.project.fp.dto.BoardDto"%>
<%@page import="com.project.fp.biz.BoardBizImpl"%>
<%@page import="com.project.fp.biz.BoardBiz"%>
<%@page import="com.project.fp.biz.MemberBizImpl"%>
<%@page import="com.project.fp.biz.MemberBiz"%>
<%@page import="java.util.List"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<style type="text/css">
.li_right {
	float: right;
}

.li_rigit_a {
	padding: 15px 20px 15px 0px;
}

.adminmenus li a {
	display: block;
	color: black;
	text-align: center;
	padding: 15px 20px;
	text-decoration: none;
}

.adminmenus li {
	float: left;
}

.section_nav {
	width: 100%;
	height: 70px;
}

.adminmenus {
	list-style-type: none;
	margin: 0;
	overflow: hidden;
	list-style: none;
}

.detail:hover {
	cursor: pointer;
	background-color: #E6E6E6;
}

.s-btn {
	border: none;
	display: inline-block;
	padding: 5px 5px 5px 8px;
	background: #f45d96;
	font-size: 14px;
	color: #ffffff;
	font-weight: 600;
	letter-spacing: 4px;
	text-transform: uppercase;
}

#paging {
	text-align: center;
	font-size: 20pt;
}

#paging a {
	font-size: 20pt;
}

a {
	color: #f45d96;
}

option:disabled {
	background-color: #EAEAEA;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		$(".detail")
				.click(
						function() {
							var member_id = $(this).children().val();
							window.name = "adminpage.jsp";
							window
									.open(
											"semi.do?command=memberdetail&member_id="
													+ member_id, "insert",
											"width = 550, height = 800, resizable = no, scrollbars = no, status = no");
						})
		var $checkHead = $("#adminBoard tr th input[type='checkbox']");
		var $checkBody = $("#adminBoard tr td input[type='checkbox']");

		/* 전체선택 */
		$checkHead.click(function() {
			var $bodyPutCk = $checkHead.is(":checked");

			if ($bodyPutCk == true) {
				$checkBody.attr("checked", true);
				$checkBody.prop("checked", true);
			} else {
				$checkBody.attr("checked", false);
				$checkBody.prop("checked", false);
			}
		});

		/* 하위 전체 선택시 전체버튼 선택 */
		$checkBody
				.click(function() {
					var tdInput_Length = $checkBody.length;
					var tdInput_Check_Length = $("#adminBoard tr td input[type='checkbox']:checked").length;

					console.log(tdInput_Length);
					console.log(tdInput_Check_Length);

					if (tdInput_Length == tdInput_Check_Length) {
						$checkHead.attr("checked", true);
						$checkHead.prop("checked", true);
					} else {
						$checkHead.attr("checked", false);
						$checkHead.prop("checked", false);
					}
				});

	});
</script>
<style>
#detailpop {
	text-decoration: underline;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="section_nav">
		<nav>
			<ul class="adminmenus">
				<li><a class="adminmenu" href="javascript:adminpage_2();">전체주문조회</a></li>
				<li><a class="adminmenu" href="javascript:adminpage_4();">상품관리</a></li>
			</ul>
		</nav>

	</div>

	<div class="content">
		<div class="adminpage-body">

			<div class="adminpage_2">

				<h2 class="mb-5">전체주문조회</h2>
				<form action="semi.do" method="post" class="mypage">
					<h1>전체주문조회</h1>
					<table border="1" class="table custom-table" style="table-layout: fixed">
						<col width="30" />
						<col width="100" />
						<col width="130" />
						<col width="80" />
						<col width="80" />
						<col width="130" />
						<col width="150" />
						<col width="200" />

						<tr>
							<th></th>
							<th>주문번호</th>
							<th>상품명</th>
							<th>수량</th>
							<th>결제금액</th>
							<th>주문상태</th>
							<th>주문일</th>
							<th>배송지</th>
						</tr>
						<tbody>
							<c:choose>
								<c:when test="${empty s_list }">
									<tr>
										<th colspan="8">----------주문내역이 존재하지 않습니다----------</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:set var="tempname" value="" />
									<c:forEach items="${s_list }" var="dto">
										<c:choose>
											<c:when test="${dto.order_group eq tempname}">
												<tr>
													<td></td>
													<td style="text-overflow: ellipsis; overflow: hidden;"></td>
													<td style="text-overflow: ellipsis; overflow: hidden;">${dto.prod_name }</td>
													<td>${dto.order_quantity }</td>
													<td>${dto.order_price }원</td>
													<td>
														<select>
															<c:if test="${dto.order_step eq '결제완료'}">
																<option value="결제완료" selected>결제완료</option>
															</c:if>
															<c:if test="${dto.order_step eq '배송준비중'}">
																<option value="배송준비중" selected>배송준비중</option>
															</c:if>
															<c:if test="${dto.order_step eq '배송중'}">
																<option value="배송중" selected>배송중</option>
															</c:if>
															<c:if test="${dto.order_step eq '배송완료'}">
																<option value="배송완료" selected>배송완료</option>
															</c:if>
															<c:if test="${dto.order_step eq '취소요청'}">
																<option value="취소요청" selected>취소요청</option>
															</c:if>
														</select>
													</td>
													<td>
														<fmt:formatDate value="${dto.order_date }" pattern="yyyy-MM-dd a hh:mm" />
													</td>
													<td style="text-overflow: ellipsis; overflow: hidden;"></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td>
														<c:if test="${dto.order_step eq '결제완료' }">
															<input type="checkbox" name="order_group" value="${dto.order_group }">
														</c:if>
													</td>
													<td>${dto.order_num }</td>
													<td style="text-overflow: ellipsis; overflow: hidden;">${dto.prod_name }</td>
													<td>${dto.order_quantity }</td>
													<td>${dto.order_price }원</td>
													<td>
														<select name="order_step">
															<c:if test="${dto.order_step eq '결제완료'}">
																<option value="결제완료" selected>결제완료</option>
															</c:if>
															<c:if test="${dto.order_step eq '배송준비중'}">
																<option value="배송준비중" selected>배송준비중</option>
															</c:if>
															<c:if test="${dto.order_step eq '배송중'}">
																<option value="배송중" selected>배송중</option>
															</c:if>
															<c:if test="${dto.order_step eq '배송완료'}">
																<option value="배송완료" selected>배송완료</option>
															</c:if>
															<c:if test="${dto.order_step eq '취소요청'}">
																<option value="취소요청" selected>취소요청</option>
															</c:if>
														</select>
													</td>
													<td>
														<fmt:formatDate value="${dto.order_date }" pattern="yyyy-MM-dd a hh:mm" />
													</td>
													<td style="text-overflow: ellipsis; overflow: hidden;"></td>
												</tr>
											</c:otherwise>
										</c:choose>
										<c:set var="tempname" value="${dto.order_group}" />

									</c:forEach>
									<tr>
										<td colspan="8" align="right">
											<input type="submit" value="주문취소요청" class="s-btn" formaction="semi.do?command=order_my_update" formmethod="post" />
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</form>
			</div>


			<div class="adminpage_4" style="display: none;">
				<h2 class="mb-5">장바구니 목록</h2>

				<form action="semi.do" method="post">
					<input type="hidden" name="command" value="paylist">
					<input type="hidden" name="member_id" value="${dto.member_id }">
					<table border="1" class="table custom-table" style="table-layout: fixed">
						<col width="50" />
						<col width="300" />
						<col width="100" />
						<col width="100" />
						<col width="130" />
						<col width="250" />

						<tr>
							<th></th>
							<th>상품명</th>
							<th>수량</th>
							<th>금액</th>
							<th>주문상태</th>
							<th>배송지</th>
						</tr>
						<tbody>
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<th colspan="6">----------주문내역이 존재하지 않습니다----------</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list }" var="dto">
										<tr>
											<td>
												<input type="checkbox" name="order_num" value="${dto.order_num }">
											</td>
											<td style="text-overflow: ellipsis; overflow: hidden;">${dto.prod_name }</td>
											<td>${dto.order_quantity }</td>
											<td>${dto.order_price }원</td>
											<td>
												<select name="order_step">
													<c:if test="${dto.order_step eq '미결제'}">
														<option value="미결제" selected>미결제</option>
													</c:if>
												</select>
											</td>
											<td style="text-overflow: ellipsis; overflow: hidden;"></td>
										</tr>
										<c:set var="tempname" value="${dto.order_group}" />

									</c:forEach>
									<tr>
										<td colspan="6" align="right">
											<input type="submit" value="결제하기" class="s-btn" />
											<input type="submit" value="목록삭제" class="s-btn" formaction="semi.do?command=order_my_delete" formmethod="post" />
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp" />

	<script type="text/javascript">
		function adminpage_2() {
			$('.adminpage_1').css("display", "none");
			$('.adminpage_3').css("display", "none");
			$('.adminpage_4').css("display", "none");
			$('.adminpage_2').css("display", "block");
		}
		function adminpage_4() {
			$('.adminpage_1').css("display", "none");
			$('.adminpage_2').css("display", "none");
			$('.adminpage_3').css("display", "none");
			$('.adminpage_4').css("display", "block");
		}
	</script>
</body>

</html>