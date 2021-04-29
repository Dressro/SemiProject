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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	.li_right {
	float: right;
	}

	.li_rigit_a {
	padding: 15px 20px 15px 0px;
	}
	.adminmenus li a{
	display: block;
	color: black;
	text-align: center;
	padding: 15px 20px;
	text-decoration: none;
	}
	.adminmenus li{
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
	.s-btn{
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
	#paging{
		text-align: center;
		font-size: 20pt;
	}
	#paging a{
		font-size: 20pt;
	}
	a{
		color:#f45d96;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(function(){
	
	$(".detail").click(function(){
		var member_id = $(this).children().val();
		window.name = "adminpage.jsp";
		window.open("semi.do?command=memberdetail&member_id="+member_id, "insert",
	            "width = 550, height = 800, resizable = no, scrollbars = no, status = no");
	})
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

</script>
<style>

#detailpop {
	text-decoration:  underline;
}

</style>

</head>
<body>
<jsp:include page="header.jsp" />	

<div class="section_nav">
  <nav>
    <ul class="adminmenus">
      <li><a class="adminmenu" href="javascript:adminpage_1();">회원정보관리</a></li>
      <li><a class="adminmenu" href="javascript:adminpage_2();">전체주문조회</a></li>
      <li><a class="adminmenu" href="javascript:adminpage_3();">게시글관리</a></li>
     <li><a class="adminmenu" href="javascript:adminpage_4();">상품관리</a></li>
     
    </ul>
  </nav>
  
</div>

<div class="content">
<div class = "adminpage-body">
<div class="adminpage_1">

<h2 class="mb-5">회원정보관리</h2>
<form action="semi.do" method="post" id="memberlist">
<input type="hidden" name="command" value="member_grade">
<table border="1" id="adminBoard" class="table custom-table" style="table-layout:fixed">
	<col width="80"/>
	<col width="80"/>
	<col width="100"/>
	<col width="100"/>
	<col width="100"/>
	<col width="150"/>
	<col width="70"/>
	<col width="80"/>
	<col width="60"/>
	<col width="80"/>
	
	<tr>
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
				<td class="detail" style="text-overflow:ellipsis; overflow:hidden;">${dto.member_id }
					<input type="hidden" name="member_id" value="${dto.member_id }"></td>
				<td style="text-overflow:ellipsis; overflow:hidden;">${dto.member_name }</td>
				<td style="text-overflow:ellipsis; overflow:hidden;">${dto.member_nicname }</td>
				<td style="text-overflow:ellipsis; overflow:hidden;">${dto.member_email }</td>
				<td style="text-overflow:ellipsis; overflow:hidden;">${dto.member_phone }</td>
				<td style="text-overflow:ellipsis; overflow:hidden;">${dto.member_addr }</td>
				<td>
					<select name="member_grade">
					<c:if test="${dto.member_grade eq '개인'}">
						<option value="개인" selected>개인</option>
						<option value="전문의">전문의</option>
					</c:if>
					<c:if test="${dto.member_grade eq '전문의'}">
						<option value="개인" >개인</option>
						<option value="전문의" selected>전문의</option>
					</c:if>
					</select>
				</td>
				<td>${dto.member_animal }</td>
				<td>${dto.member_point }</td>
				<td style="text-overflow:ellipsis; overflow:hidden;">${dto.member_dr_info }</td>
			</tr>
		</c:forEach>

	<tr>
		<td colspan="10" align="right">
			<input type="submit" class="s-btn" value="등급변경">
			<input type="button" class="s-btn" value="회원등록" onclick="memberinsertPopup();">
		</td>
	</tr>
	
</table>
</form>
</div>
<div class="adminpage_2" style="display: none;">

<h2 class="mb-5">전체주문조회</h2>
<table border="1" id="adminBoard" class="table custom-table" style="table-layout:fixed">
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
	<input type="submit" value="주문상태변경" class="s-btn" onclick="#" />
	</td></tr>
	
</table>
</div>

<div class="adminpage_3" style="display: none;">

<h2 class="mb-5">게시판관리</h2>
<form action="semi.do" method="post">
<input type="hidden" name="command" value="board_delete">
<table border="1" id="adminBoard" class="table custom-table" style="table-layout:fixed">
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
		<th>카테고리</th>
		<th>제목</th>
		<th>내용</th>
		<th>글쓴이</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach items="${boardlist }" var="dto"> 
	<tr>
		<td><input type="checkbox" name="board_no" value="${dto.board_no }"></td>
		<td>${dto.board_no }</td>
		<c:if test="${dto.board_category eq 'F'}">
			<td>자유게시판</td>
		</c:if>
		<c:if test="${dto.board_category eq 'N'}">
			<td>공지사항</td>
		</c:if>
		<c:if test="${dto.board_category eq 'Q'}">
			<td>상품문의</td>
		</c:if>
		<c:if test="${dto.board_category eq 'D'}">
			<td>실종신고</td>
		</c:if>
		<td>${dto.board_title }</td>
		<td>${dto.board_content }</td>
		<td>${dto.member_id }</td>
		<td><fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd"/></td>
	</tr> 
	</c:forEach>
	<tr>
		<td colspan="7" align="right">
			<input type="submit" class="s-btn" value="글삭제"/>
		</td>
	</tr>
	
</table>
</form>
</div>

<div class="adminpage_4" style="display: none;">
<h2 class="mb-5">상품관리</h2>

<form action="semi.do" method="post">
<input type="hidden" name="command" value="prod_delete">
<table border="1" id="adminBoard" class="table custom-table" style="table-layout:fixed">
	<col width="40"/>
	<col width="60"/>
	<col width="80"/>
	<col width="100"/>
	<col width="100"/>
	<col width="100"/>
	<col width="100"/>	
	<col width="70"/>
	<col width="100"/>
	<col width="80"/>
	<col width="100"/>
	<tr>
		<th><input type="checkbox" value=""/></th>
	   <th>번호</th>
	   <th>카테고리</th>
	   <th>상품명</th>
	   <th>할인율</th>
	   <th>정가</th>
	   <th>설명</th>
	   <th>재고</th>
	   <th>입고날짜</th>
	   <th>제조사</th>
	   <th>거래처</th>
	</tr>
	
<c:forEach items="${prodlist }" var="dto"> 
	<tr>
		<td><input type="checkbox" name="prod_num" value="${dto.prod_num }"></td>
		<td>${dto.prod_num }</td>
		<td>${dto.prod_category }</td>
		<td style="text-overflow:ellipsis; overflow:hidden;">${dto.prod_name }</td>
		<td>${dto.prod_sale }%</td>
		<td>${dto.prod_price }</td>
		<td style="text-overflow:ellipsis; overflow:hidden;">${dto.prod_explain }</td>
		<td>${dto.prod_stock }</td>
		<td><fmt:formatDate value="${dto.prod_indate }" pattern="yyyy-MM-dd"/></td>
		<td>${dto.prod_mfr }</td>
		<td>${dto.prod_client }</td>
	</tr>
</c:forEach>

	<tr>
	<td colspan="11" align="right">
	<input type="button"value="상품등록" class="s-btn" onclick="location.href='semi.do?command=shop_insertform'" />
	<input type="submit"value="상품삭제" class="s-btn"/>
	</td></tr>
	
</table>
</form>
</div>
</div>		
</div>
<jsp:include page="bottom.jsp" />	

<script type="text/javascript">
	
function adminpage_1(){
	$('.adminpage_2').css("display","none");
	$('.adminpage_3').css("display","none");
	$('.adminpage_4').css("display","none");
	$('.adminpage_1').css("display","block");
}
function adminpage_2(){
	$('.adminpage_1').css("display","none");
	$('.adminpage_3').css("display","none");
	$('.adminpage_4').css("display","none");
	$('.adminpage_2').css("display","block");
}
function adminpage_3(){
	$('.adminpage_1').css("display","none");
	$('.adminpage_2').css("display","none");
	$('.adminpage_4').css("display","none");
	$('.adminpage_3').css("display","block");
}
function adminpage_4(){
	$('.adminpage_1').css("display","none");
	$('.adminpage_2').css("display","none");
	$('.adminpage_3').css("display","none");
	$('.adminpage_4').css("display","block");
}

function memberinsertPopup() {
    window.name = "adminpage.jsp";
    window.open("signup.jsp", "insert",
            "width = 730, height = 800, resizable = no, scrollbars = no, status = no");
}	
</script>
</body>
</html>