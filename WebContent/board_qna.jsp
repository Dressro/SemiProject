<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h3>상품문의</h3>
	
	<table border="1">
		<col width="50px">
		<col width="100px">
		<col width="500px">
		<col width="100px">
		
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="4">----------작성된 글이 존재하지 않습니다----------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.board_qna_no }</td>
						<td>${dto.member_nicname }</td>
						<td>
							<c:forEach begin="1" end="${dto.board_titletab }">
								&nbsp;
							</c:forEach>
							<a href="semi.do?command=board_dec_detail&board_no=${dto.board_no }">${dto.board_title }</a>
						</td>
						<td>${dto.board_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="글작성" onclick="location.href='semi.do?command=board_insertform'" />
			</td>
		</tr>
	</table>
	
	<jsp:include page="/board_paging.jsp">
		<jsp:param value="${BoardCommand }" name="command"/>
		<jsp:param value="${Pdto.nowBlock}" name="nowBlock" />
		<jsp:param value="${Pdto.blockBegin }" name="blockBegin"/>
		<jsp:param value="${Pdto.blockEnd }" name="blockEnd"/>
	  	<jsp:param value="${Pdto.nowPage}" name="nowPage" />
	 	<jsp:param value="${Pdto.blockBegin}" name="blockBegin" />
	  	<jsp:param value="${Pdto.blockEnd}" name="blockEnd" />
	  	<jsp:param value="${Pdto.totalBlock}" name="totalBlock" />
	</jsp:include>
	<jsp:include page="bottom.jsp" />
</body>
</html>