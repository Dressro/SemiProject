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
.category {
	float: left;
	padding: 15px 30px 15px 30px;
}
#mobile-filter{
	width: 100%;
}
.semiproject_shopping_detail {
	padding-left: 15px;
	padding-right: 15px;
	margin-left: 82px;
	margin-top: 300px;
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
	String member_id;
	if (dto == null) {
		member_id = "";
	} else {
		member_id = dto.getMember_id();
	}
	%>

	<jsp:include page="header.jsp" />
	<form action="semi.do" method="post">
		<input type="hidden" name="command" value="shopping_detail">
		<input type="hidden" name="member_id" value="<%=member_id%>"> 
		<input type="hidden" name="prod_num" value="${p_dto.prod_num }">
		<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom"> <a class="navbar-brand ml-2 font-weight-bold" href="#">MENU</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor" aria-controls="navbarColor" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarColor">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="semi.do?command=shopping">Home</a> </li>
        </ul>
    </div>
</nav>
		
<div id="mobile-filter">
    <div>
        <ul style="list-style: none;">
           					 <li class="category"><a href="semi.do?command=category&prod_category=feed">??????/??????</a>
							 <li class="category"><a href="semi.do?command=category&prod_category=care">??????</a></li>
							 <li class="category"><a href="semi.do?command=category&prod_category=living">??????</a></li>
							 <li class="category"><a href="semi.do?command=category&prod_category=outing">??????</a></li>
							 <li class="category"><a href="semi.do?command=category&prod_category=toy">?????????</a></li>
							 <li class="category"><a href="semi.do?command=category&prod_category=fashion">??????</a></li>
        </ul>
      
    </div>
</div>

		<div class="semiproject_shopping_detail">
			<div class="detail">
				<div>
					<div>
						<span class="prod_img">
							<img src="fileupload/${p_dto.file_new_name }">
						</span>
					</div>
					<div class="prod_info">
						<div>
							<span class="prod_name">
								<span> ???&nbsp;???&nbsp;???&nbsp; : </span>
								${p_dto.prod_name}
							</span>
						</div>
						<div>
							<span> ???&nbsp;???&nbsp;???&nbsp; : </span>
							<span>
								<fmt:formatNumber value="${p_dto.prod_price}" pattern="#,###" />
								<input type="hidden" name="prod_price" value="${p_dto.prod_price}">
							</span>
						</div>
						<div>
							<span> ???&nbsp;???&nbsp;???&nbsp; : </span>
							<span> ${p_dto.prod_sale} </span>
						</div>
						<div>
							<span> ???????????? : </span>
							<span>
								<input type="number" name="order_quantity" min="1" max="50" value="1" />
							</span>
						</div>
						<div>
							<span> ???????????? : </span>
							<span>
								${p_dto.prod_stock}
								<input type="hidden" name="prod_stock" value="${p_dto.prod_stock}">
							</span>
						</div>
						<div>
							<span> ???&nbsp;???&nbsp;???&nbsp; : </span>
							<span> ${p_dto.prod_mfr} </span>
						</div>

						<input type="submit" class="btn" value="[???????????? ??????]" formaction="semi.do?command=basket_add">
						<input type="submit" class="btn" value="[?????? ????????????]" formaction="semi.do?command=paypage&purch=one">
					</div>
				</div>

			</div>
		</div>
		<hr>
		<div class="detail_explain">

			<span> ???????????? </span>
			<span>
				<p>${p_dto.prod_explain}</p>
			</span>

		</div>

	</form>
	<jsp:include page="bottom.jsp" />
</body>
</html>