<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav>
		<ul>
			<li><a href="">사료/간식</a>
			<li><a href="">케어</a>
			<li><a href="">리빙</a>
			<li><a href="">외출</a>
			<li><a href="">장난감</a>
			<li><a href="">패션</a>		
		</ul>
	</nav>
	<ul>
		 <c:forEach items="${list }" var="list">
		 <li>
		  <div class="shopThumb">
		   <img src="">
		   <%-- 상품썸네일 이미지경로 --%>
		  </div> 
		  <div class="productname">
		   <a href=""></a>
		   <%-- 상품명클릭시 상세보기로 링크 --%>
		  </div>
		 </li>
		 </c:forEach>
	</ul>
	
</body>
</html>