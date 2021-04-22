<%@page import="com.project.fp.dto.BoardDto"%>
<%@page import="com.project.fp.biz.BoardBizImpl"%>
<%@page import="com.project.fp.biz.BoardBiz"%>
<%@page import="com.project.fp.biz.MemberBizImpl"%>
<%@page import="com.project.fp.biz.MemberBiz"%>
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

<%
	MemberBiz biz = new MemberBizImpl();
	List<MemberDto> list = biz.selectList();
%>

<h1>회원정보관리</h1>
<form action="semi.do" method="post" id="memberlist">
<table border="1">
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
		<th><input type="checkbox" name="all" value=""/></th>
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



<%
	for (MemberDto dto : list ) {
%>

	<tr>
		<td><input type="checkbox" name="chk" value=""></td>
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
	</tr>

<%
	}
%> 

	<tr>
		<td colspan="11" align="right">
			<input type="submit" value="선택변경">
			<input type="button" value="글작성" onclick="" />
		</td>
	</tr>
</table>
</form>
</section>
<section class="adminpage">
<h1>전체주문조회</h1>
<table border="1">
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
		<th><input type="checkbox" name="all" value=""/></th>
		<th>주문번호</th>
		<th>회원ID</th>
		<th>주문일</th>
		<th>상품명</th>
		<th>수량</th>
		<th>결제금액</th>
		<th>주문상태</th>
		<th>배송지</th>
		<th>POINT</th>
	</tr>
</table>
</section>

<section class="adminpage">


<%
	BoardBiz bbiz = new BoardBizImpl();
	List<BoardDto> freelist = bbiz.free_selectList();
%>

<h1>게시글관리</h1>
<table border="1">
	<col width="30"/>
	<col width="60"/>
	<col width="150"/>
	<col width="200"/>
	<col width="150"/>
	<col width="100"/>
	<col width="70"/>
	
	<tr>
		<th><input type="checkbox" name="all" value=""/></th>
		<th>글번호</th>
		<th>게시판명</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	

<%
	for (BoardDto dto : freelist ) {
%>

	<tr>
		<td><input type="checkbox" name="chk" value=""></td>
		<td><%=dto.getBoard_no() %></td>
		<td><%=dto.getBoard_category() %></td>
		<td><%=dto.getBoard_title() %></td>
		<td></td>
		<td><%=dto.getBoard_regdate() %></td>
		<td><%=dto.getBoard_readcount() %></td>
	</tr>

<%
	}
%> 
	
	
</table>
</section>

<section class="adminpage">
<h1>상품관리</h1>
<table border="1">
	<col width="30"/>
	<col width="60"/>
	<col width="100"/>
	<col width="200"/>
	<col width="70"/>
	<col width="70"/>
	<col width="70"/>
	
	<tr>
		<th><input type="checkbox" name="all" value=""/></th>
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