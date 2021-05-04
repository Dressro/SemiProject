<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Family|Pet</title>
</head>
<body>



	<h1>일정 목록</h1>

		<table border="1">
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
						<td colspan="4">---------일정이 없습니다-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="m_c_dto">
						<tr>
							<td>${m_c_dto.cal_no }</td>
							<td><a href="semi.do?command=calDetail&cal_no=${m_c_dto.cal_no }" >${m_c_dto.cal_title }</a></td>
							<td>
								${m_c_dto.cal_mdate }
							</td>
							<td><fmt:formatDate value="${m_c_dto.cal_regdate }" pattern="yyyy.MM.dd"/></td> 
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

</body>
</html>