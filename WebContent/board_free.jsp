<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// .submit : submit 이벤트가 발생될 때, 실행
		$("#muldelform").submit(function() {
			if ($("#muldelform input:checked").length == 0) {
				alert("하나 이상 체크해주세요!");
				return false;
			}
		});
		
	});

	//이름이 all인 checkbox의 값을 가지고, 모든 chk의 checkbox 값들을 변경! (true / false)
	function allCheck(bool) {
		var chks = document.getElementsByName("board_no");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}
	function search(){
		var search_category = $(".search_category option:selected").val();
		var search_text = $(".search_text").val();
		alert("search category: " + search_category + " search_text :" + search_text);
	}
</script>
<style type="text/css">
	
	*{
		margin: 0;
		padding: 0;
	}
	body{
		width: 100%;
	}
	a{
		text-decoration: none;
	}
	a:hover,a:visited,a:link{
		color:black;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
	<h3>자유게시판</h3>
	
			<select class="search_category">
				<option selected value="T_C">제목+내용</option>
				<option value="T">제목만</option>
				<option value="W">작성자</option>
			</select>
			<input type="text" class="search_text" size="10">
			<button type="button" name="search_btn" onclick="search();">검색</button>
	
			<form action="semi.do" method="post" id="muldelform">
			<input type="hidden" name="command" value="board_delete">
			<table border="1">
				<colgroup>
				<col width="5%" />
				<col width="5%"/>
				<col width="5%"/>
				<col width="70%"/>
				<col width="5%"/>
				<col width="10%">
				</colgroup>
				
				<tr>
					<th><input type="checkbox" name="all" onclick="allCheck(this.checked);"/></th>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th> 
				</tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<th colspan="6">----------작성된 글이 존재하지 않습니다----------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
								<tr>
									<td>
										<input type="checkbox" name="board_no" value="${dto.board_no }">
									</td>
									<td>${dto.board_free_no }</td>
									<td>${dto.member_id }</td>
									<td class="text-ellipsis">
										<c:forEach begin="1" end="${dto.board_titletab }">
										&nbsp;
									</c:forEach>
									<a href="semi.do?command=board_detail&board_no=${dto.board_no }">${dto.board_title }</a>
								</td>
								<td>${dto.board_readcount }</td>
								<td><fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="6" style="text-align: right;">
						<input type="button" value="글작성" onclick="location.href='semi.do?command=board_insertform'" />
						<input type="submit" value="삭제" onclick="chkcheck();"/>
					</td>
				</tr>
			</table>
						<jsp:include page="/board_paging.jsp">
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