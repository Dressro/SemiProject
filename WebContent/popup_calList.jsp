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
<style type="text/css">
	#title{
		background: #F9F7F6; border-left: 0.5em solid #8E0370; padding: 0.5em;
	}
	
	.tab{
		border-collapse: collapse;
  		border-top: 3px solid #8E0370;
	}
	
	.tab th{
		color: #0a0a0a;
  		background: #ffebfb;
	}
	
	.tab th, .tab td{
	  padding: 10px;

	}
	
	.tab th:first-child, .tab td:first-child{
		border-left: 0;
	}
	
	.tab th:last-child, .tab td:last-child{
		border-right: 0;
	}
	
	a { text-decoration:none } 
</style>
</head>
<body>



	<h3 id="title">일정 목록</h3>

		<table class="tab" border="1">
			<col width="60" />
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