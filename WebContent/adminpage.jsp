<%@page import="java.util.List"%>
<%@page import="com.project.fp.dto.MemberDto"%>
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
		$('.adminmenus li').eq(0).trigger('click');
});

</script>
<style>


nav {
  float: left;
  padding: 20px;
  }
  
</style>

</head>
<body>
	

<section>
  <nav>
    <ul class="adminmenus">
      <li><a class="adminmenu" href="#">회원정보관리</a></li>
      <li><a class="adminmenu" href="#">전체주문조회</a></li>
      <li><a class="adminmenu" href="#">게시글관리</a></li>
     <li><a class="adminmenu" href="#">상품관리</a></li>
    </ul>
  </nav>
  
</section>

<div class = "adminpage-body">
<section class="adminpage">

<%--
	List<MemberDto> list = (List<MemberDto>) request.getAttribute("list");
--%>

<h1>회원정보관리</h1>
<table border="1">
	<col width="100"/>
	<col width="100"/>
	<col width="200"/>
	<col width="150"/>
	<col width="300"/>
	<col width="50"/>
	<col width="50"/>
	<col width="50"/>
	<col width="100"/>
	<col width="100"/>
	
	<tr>
		<th>ID</th>
		<th>NICNAME</th>
		<th>EMAIL</th>
		<th>PHONE</th>
		<th>ADDR</th>
		<th>GRADE</th>
		<th>ANIMAL</th>
		<th>POINT</th>
		<th>DR_INFO</th>
		<th>등급변경</th>
	</tr>


<%--
<%
	for (MemberDto dto : list ) {
%>

	<tr>
		<td><%=dto.getMember_id() %></td>
		<td><%=dto.getMember_name() %></td>
		<td><%=dto.getMember_nicname() %></td>
		<td><%=dto.getMember_email() %></td>
		<td><%=dto.getMember_phone() %></td>
		<td><%=dto.getMember_addr() %></td>
		<td><%=dto.getMember_grade() %></td>
		<td><%=dto.getMember_animal() %></td>
		<td><%=dto.getMember_point() %></td>
		<td><%=dto.getMember_dr_info() %></td>
		<td><input type="button" value="변경"	 onclick="updateRole(<%=dto.getMember_id() %>);"/></td>
	</tr>

<%
	}
%> --%>

</table>
</section>
<section class="adminpage">
<h1>전체주문조회</h1>
<table border="1">
	<col width="60"/>
	<col width="100"/>
	<col width="100"/>
	<col width="200"/>
	<col width="50"/>
	<col width="70"/>
	<col width="100"/>
	<col width="200"/>
	<col width="50"/>
	<col width="60"/>
	
	<tr>
		<th>주문번호</th>
		<th>회원ID</th>
		<th>주문일</th>
		<th>상품명</th>
		<th>수량</th>
		<th>결제금액</th>
		<th>주문상태</th>
		<th>배송지</th>
		<th>POINT</th>
		<th>상태변경</th>
	</tr>
</table>
</section>

<section class="adminpage">
<h1>게시글관리</h1>
<table border="1">
	<col width="60"/>
	<col width="150"/>
	<col width="200"/>
	<col width="150"/>
	<col width="100"/>
	<col width="70"/>
	
	<tr>
		<th>글번호</th>
		<th>게시판명</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
</table>
</section>

<section class="adminpage">
<h1>상품관리</h1>
<table border="1">
	<col width="60"/>
	<col width="100"/>
	<col width="200"/>
	<col width="70"/>
	<col width="70"/>
	<col width="70"/>
	
	<tr>
		<th>상품번호</th>
		<th>분류</th>
		<th>상품명</th>
		<th>정가</th>
		<th>재고수량</th>
		<th>판매량</th>
	</tr>
</table>
</section>
</div>

</body>
</html>