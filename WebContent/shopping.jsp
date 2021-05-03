<%@page import="com.project.fp.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="com.project.fp.biz.ProductBiz"%>
<%@page import="com.project.fp.biz.ProductBizImpl"%>
<%@page import="com.project.fp.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#paging {
	text-align: center;
	font-size: 20pt;
}

#paging a {
	font-size: 20pt;
}

</style>

<jsp:include page="header.jsp" />
<body>
<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
		<form action="semi.do" method="post">
		<input type="hidden" name="command" value="shopping">
		
		<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom"> <a class="navbar-brand ml-2 font-weight-bold" href="#">MENU</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor" aria-controls="navbarColor" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarColor">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="#">멍멍이</a> </li>
            <li class="nav-item"><a class="nav-link" href="#">야옹이</a> </li>
            <li class="nav-item "><a class="nav-link" href="#">Home</a> </li>
            <li class="nav-item "><a class="nav-link" href="#">Sale</a> </li>
        </ul>
    </div>
</nav>
<div class="filter"> <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#mobile-filter" aria-expanded="false" aria-controls="mobile-filter">Filters<span class="fa fa-filter pl-1"></span></button>
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
<section id="products">
    <div class="container">
        <div class="row">
		<c:forEach items="${list }" var="dto"> 
            <div class="col-lg-3 col-sm-4 col-11 offset-sm-0 offset-1">
                <div class="card"> <img class="card-img-top" src="resources/images/product/280.jfif" alt="shopimage">
                    <div class="card-body">

                        <p class="card-text"><a href="semi.do?command=shopping_detail&prod_num=${dto.prod_num }">${dto.prod_name }</a></p>
                        <p><fmt:formatNumber value="${dto.prod_price }" pattern="#,###.##"/>

						</p> <span class="fa fa-circle" id="red"></span> <span class="fa fa-circle" id="teal"></span> <span class="fa fa-circle" id="blue"></span>
						
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
</section>

					<jsp:include page="/shopping_paging.jsp">
						<jsp:param value="${BoardCommand }" name="command" />
						<jsp:param value="${Pdto.nowBlock}" name="nowBlock" />
						<jsp:param value="${Pdto.blockBegin }" name="blockBegin" />
						<jsp:param value="${Pdto.blockEnd }" name="blockEnd" />
						<jsp:param value="${Pdto.nowPage}" name="nowPage" />
						<jsp:param value="${Pdto.blockBegin}" name="blockBegin" />
						<jsp:param value="${Pdto.blockEnd}" name="blockEnd" />
						<jsp:param value="${Pdto.totalBlock}" name="totalBlock" />
					</jsp:include>

</form>
	<jsp:include page="bottom.jsp" />

</body>
</html>