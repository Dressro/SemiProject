<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
</head>
<body>
<%
	String s_c = request.getParameter("s_c");
	String s_t = request.getParameter("s_t");
	String category = request.getParameter("category");
	
%>
  <%if(s_c ==null){ %>
<div id = "paging">

  	  <!-- value에 서블릿 주소 넣기 -->
  	 
	  <c:url var = "action" value="/semi.do" />

	  <!-- 이전 페이지 블록으로 이동 -->
	  <c:if test="${param.nowBlock > 1}">
		    <a href="${action}?command=${param.command}&nowPage=${param.blockBegin-1}">◀</a>
	  </c:if>
	
	  <!-- 현재 페이지 블록에 해당하는 페이지 출력 -->
	  <c:forEach begin="${param.blockBegin}" end="${param.blockEnd}" var="index" >
		    <c:choose>
			    <c:when test="${param.nowPage eq index}">
				     ${index}
			    </c:when>
			    <c:otherwise>
            		 <a href="${action}?command=${param.command}&nowPage=${index}">${index}</a>
			    </c:otherwise>
		    </c:choose>
	  </c:forEach>

	  <!-- 다음 페이지 블록으로 이동 -->
	  <c:if test="${param.nowBlock < param.totalBlock}">
		    <a href="${action}?command=${param.command}&nowPage=${param.blockEnd+1}">▶</a>
	  </c:if>

</div>
<%}else {%>
<div id = "paging">

  	  <!-- value에 서블릿 주소 넣기 -->
  	 
	  <c:url var = "action" value="/semi.do" />

	  <!-- 이전 페이지 블록으로 이동 -->
	  <c:if test="${param.nowBlock > 1}">
		    <a href="${action}?command=${param.command}&nowPage=${param.blockBegin-1}&s_c=<%=s_c%>&s_t=<%=s_t%>&category=<%=category%>">◀</a>
	  </c:if>
	
	  <!-- 현재 페이지 블록에 해당하는 페이지 출력 -->
	  <c:forEach begin="${param.blockBegin}" end="${param.blockEnd}" var="index">
		    <c:choose>
			    <c:when test="${param.nowPage == index}">
				     ${index}
			    </c:when>
			    <c:otherwise>
            		 <a href="${action}?command=${param.command}&nowPage=${index}&s_c=<%=s_c%>&s_t=<%=s_t%>&category=<%=category%>">${index}</a>
			    </c:otherwise>
		    </c:choose>
	  </c:forEach>

	  <!-- 다음 페이지 블록으로 이동 -->
	  <c:if test="${param.nowBlock < param.totalBlock}">
		    <a href="${action}?command=${param.command}&nowPage=${param.blockEnd+1}&s_c=<%=s_c%>&s_t=<%=s_t%>&category=<%=category%>">▶</a>
	  </c:if>

</div>
<%} %>
</body>

</html>