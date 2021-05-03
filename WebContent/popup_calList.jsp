<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
</head>
<body>

	<jsp:useBean id="util" class="com.project.fp.controller.Util"></jsp:useBean>

	<h1>일정 목록</h1>
	
	<form action="cal.do" method="post">
		<input type="hidden" name="command" value="muldel" />
		
		<table border="1">
			<col width="50" />
			<col width="50" />
			<col width="500" />
			<col width="200" />
			<col width="100" />
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>일정</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="4">---------일정이 없습니다-----------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="m_c_dto">
						<tr>
							<th><input type="checkbox" name="chk" value="${m_c_dto.cal_no }"></th>
							<td>${m_c_dto.cal_no }</td>
							<td><a href="semi.do?command=calDeatil?cal_no=${m_c_dto.cal_no }" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${m_c_dto.cal_title }</a></td>
							<td>
								<jsp:setProperty property="todates" name="util" value="${m_c_dto.cal_mdate } "/>
								<jsp:getProperty property="todates" name="util"/>
							</td>
							<td><fmt:formatDate value="${m_c_dto.cal_regdate }" pattern="yyyy.MM.dd"/></td> 
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
	</form>

</body>
</html>