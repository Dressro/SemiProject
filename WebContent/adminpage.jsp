
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="resources/css/head.css" rel=stylesheet type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
		$('.adminmenus li').click(function(){
		$('.adminmenus li').find('a').removeClass('active');
	    $(this).find('a').addClass('active');
	    $('.adminpage').hide();		   
		var i = $(this).index();
		$('.adminpage').eq(i).show();
	});
		<!--$('.adminmenus li').eq(0).trigger('click');-->
});

$(function(){
	 
    var $checkHead = $("#adminBoard tr th input[type='checkbox']"); 
    var $checkBody = $("#adminBoard tr td input[type='checkbox']"); 
 
    /* 전체선택 */
    $checkHead.click(function(){
        var $bodyPutCk = $checkHead.is(":checked");
 
        if ( $bodyPutCk == true ) {
            $checkBody.attr("checked", true);
            $checkBody.prop("checked", true);
        }else {
            $checkBody.attr("checked", false);
            $checkBody.prop("checked", false);
        }
    });
 
    /* 하위 전체 선택시 전체버튼 선택 */
    $checkBody.click(function(){
        var tdInput_Length = $checkBody.length; 
        var tdInput_Check_Length = $("#adminBoard tr td input[type='checkbox']:checked").length;
 
        console.log(tdInput_Length);
        console.log(tdInput_Check_Length);
 
        if (tdInput_Length == tdInput_Check_Length) {
            $checkHead.attr("checked", true);
            $checkHead.prop("checked", true);
        }else {
            $checkHead.attr("checked", false);
            $checkHead.prop("checked", false);
        }
    });
 
});

function detailPopup() {
    window.name = "adminpage.jsp";
    window.open("semi.do?command=memberdetail&member_id=${dto.member_id }", "insert",
            "width = 550, height = 800, resizable = no, scrollbars = no, status = no");
}

function memberinsertPopup() {
    window.name = "adminpage.jsp";
    window.open("signup.jsp", "insert",
            "width = 730, height = 800, resizable = no, scrollbars = no, status = no");
}

</script>
<style>

#detailpop {
	text-decoration:  underline;
}

</style>

</head>
<body>
	

<section>
  <nav>
    <ul class="adminmenus">
      <li><a class="adminmenu" href="semi.do?command=memberlist">회원정보관리</a></li>
      <li><a class="adminmenu" href="semi.do?command=orderlist">전체주문조회</a></li>
      <li><a class="adminmenu" href="semi.do?command=boardlist">게시글관리</a></li>
     <li><a class="adminmenu" href="semi.do?command=prodlist">상품관리</a></li>
     
    </ul>
  </nav>
  
</section>

<div class = "adminpage-body">
<section class="adminpage">

<h1>회원정보관리</h1>
<form action="semi.do" method="post">
<input type="hidden" name="command" value="memberlist">

<table border="1" id="adminBoard">
	<col width="30"/>
	<col width="100"/>
	<col width="100"/>
	<col width="100"/>
	<col width="150"/>
	<col width="150"/>
	<col width="250"/>
	<col width="50"/>
	<col width="50"/>
	<col width="50"/>
	<col width="50"/>
	
	<tr>
		<th><input type="checkbox" value=""/></th>
		<th>ID</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>EMAIL</th>
		<th>PHONE</th>
		<th>ADDR</th>
		<th>GRADE</th>
		<th>ANIMAL</th>
		<th>POINT</th>
		<th>DR_INFO</th>
	</tr>



		<c:forEach items="${list }" var="dto"> 
				<tr>
			<td><input type="checkbox" value=""></td>
			<td><a id="detailpop" href="javascript:detailPopup();">${dto.member_id }</a></td>
			<td>${dto.member_name }</td>
			<td>${dto.member_nicname }</td>
			<td>${dto.member_email }</td>
			<td>${dto.member_phone }</td>
			<td>${dto.member_addr }</td>
			<td>${dto.member_grade }</td>
			<td>${dto.member_animal }</td>
			<td>${dto.member_point }</td>
			<td>${dto.member_dr_info }</td>
		</tr>
	</c:forEach>

	<tr>
		<td colspan="11" align="right">
			<input type="submit" value="등급변경">
			<input type="button" value="회원등록" onclick="javascript:memberinsertPopup();">
		</td>
	</tr>
</table>
</form>
</section>
<section class="adminpage">



<h1>전체주문조회</h1>
<input type="hidden" name="command" value="orderlist">
<table border="1" id="adminBoard">
	<col width="30"/>
	<col width="60"/>
	<col width="100"/>
	<col width="100"/>
	<col width="200"/>
	<col width="50"/>
	<col width="70"/>
	<col width="100"/>
	<col width="200"/>
	<col width="50"/>
	
	<tr>
		<th><input type="checkbox" value=""/></th>
		<th>주문번호</th>
		<th>회원ID</th>
		<th>주문일</th>
		<th>상품명</th>
		<th>수량</th>
		<th>결제금액</th>
		<th>주문상태</th>
		<th>배송지</th>
	</tr>
	
<c:forEach items="${orderlist }" var="dto"> 
	<tr>
		<td><input type="checkbox" value=""></td>
		<td>${dto.order_num }</td>
		<td>${dto.order_id }</td>
		<td>${dto.order_date }</td>
		<td>${dto.prod_name }</td>
		<td>${dto.order_quantity }</td>
		<td>${dto.order_price }</td>
		<td>${dto.order_step }</td>
		<td></td>
	</tr>
	</c:forEach>
	<tr>
	<td colspan="9" align="right">
	<input type="submit"value="주문상태변경" onclick="#" />
	</td></tr>
	
</table>
</section>

<section class="adminpage">



<h1>게시글관리</h1>
<input type="hidden" name="command" value="boardlist">
<table border="1" id="adminBoard">
	<col width="30"/>
	<col width="60"/>
	<col width="150"/>
	<col width="200"/>
	<col width="200"/>
	<col width="150"/>
	<col width="100"/>
	
	
	<tr>
		<th><input type="checkbox" value=""/></th>
		<th>글번호</th>
		<th>게시판명</th>
		<th>제목</th>
		<th>내용</th>
		<th>글쓴이</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach items="${boardlist }" var="dto"> 
	<tr>
		<td><input type="checkbox" value=""></td>
		<td>${dto.board_no }</td>
		<td>${dto.board_catecory }</td>
		<td>${dto.board_title }</td>
		<td>${dto.board_content }</td>
		<td>${dto.member_id }</td>
		<td>${dto.board_regdate }</td>
	</tr> 
	</c:forEach>
	<tr>
	<td colspan="7" align="right">
	<input type="submit"value="글삭제" onclick="#" />
	</td></tr>
	
</table>
</section>

<section class="adminpage">


<h1>상품관리</h1>
<input type="hidden" name="command" value="prodlist">
<table border="1" id="adminBoard">
	<col width="30"/>
	<col width="60"/>
	<col width="100"/>
	<col width="200"/>
	<col width="70"/>
	<col width="70"/>
	<col width="70"/>	
	<col width="70"/>
	<col width="70"/>
	<col width="70"/>
	
	<tr>
		<th><input type="checkbox" value=""/></th>
	   <th>번호</th>
	   <th>카테고리</th>
	   <th>상품명</th>
	   <th>제조사</th>
	   <th>설명</th>
	   <th>정가</th>
	   <th>할인율</th>
	   <th>재고</th>
	   <th>거래처</th>
	   <th>등록날짜</th>
	</tr>
	
<c:forEach items="${prodlist }" var="dto"> 
	<tr>
		<td><input type="checkbox" value=""></td>
		<td>${dto.prod_num }</td>
		<td>${dto.prod_category }</td>
		<td>${dto.prod_name }</td>
		<td>${dto.prod_mfr }</td>
		<td>${dto.prod_explain }</td>
		<td>${dto.prod_stock }</td>
		<td>${dto.prod_price }</td>
		<td>${dto.prod_sale }</td>
		<td>${dto.prod_indate }</td>
		<td>${dto.prod_outdate }</td>
	</tr>
</c:forEach>

	<tr>
	<td colspan="12" align="right">
	<input type="submit"value="상품등록" onclick="location.href='semi.do?command=shop_insertform'" />
	<input type="submit"value="상품삭제" onclick="#" />
	</td></tr>
	
</table>
</section>
</div>

</body>
</html>