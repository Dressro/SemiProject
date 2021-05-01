<%@page import="java.util.List"%>
<%@page import="com.project.fp.biz.ProductBiz"%>
<%@page import="com.project.fp.biz.ProductBizImpl"%>
<%@page import="com.project.fp.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
</head>
<body>

<jsp:include page="header.jsp" />
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
            <li><a href="#">사료/간식</a>
							 <li><a href="#">케어</a></li>
							 <li><a href="#">리빙</a></li>
							 <li><a href="#">외출</a></li>
							 <li><a href="#">장난감</a></li>
							 <li><a href="#">패션</a></li>
        </ul>
    </div>
</div>
<section id="products">
    <div class="container">
        <div class="row">
		<c:forEach items="${list }" var="dto"> 
            <div class="col-lg-3 col-sm-4 col-11 offset-sm-0 offset-1">
                <div class="card"> <img class="card-img-top" src="#" alt="shopimage">
                    <div class="card-body">
                        <p class="card-text"><a href="semi.do?command=shopping_detail1&prod_num=${dto.prod_num }">${dto.prod_name }</a></p>
                        <p>${dto.prod_price }</p> <span class="fa fa-circle" id="red"></span> <span class="fa fa-circle" id="teal"></span> <span class="fa fa-circle" id="blue"></span>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
        <div class="row mt-3">
            <div class="col-lg-3 col-sm-4 col-11 offset-sm-0 offset-1">
                <div class="card"> <img class="card-img-top" src="https://images.pexels.com/photos/3230274/pexels-photo-3230274.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=300" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">Red Leather Bar Stool</p>
                        <p>$30</p> <span class="fa fa-circle" id="red"></span> <span class="fa fa-circle" id="teal"></span> <span class="fa fa-circle" id="blue"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</form>
	<jsp:include page="bottom.jsp" />

</body>
</html>