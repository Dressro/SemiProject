<%@ page import="com.project.fp.papago.papago"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function translation() {
		var text = $('input[name=papago_text]').val();
		var source = $('select[name=source]').val();
		var target = $('select[name=target]').val();
		if($('input[name=papago_text]').val().trim() == "" || $('input[name=papago_text]').val() == null){
			alert("번역할 문장을 입력해 주세요");
		} else {
			location.href="semi.do?command=translation&text="+text+"&source="+source+"&target="+target;
		}
	}

</script>
</head>
<%
	String result = (String) request.getAttribute("result");
%>
<body>

	<h1>파파고 test page</h1><br/>
	<select name="source">
		<option value="ko">한국어</option>
		<option value="en">영어</option>
		<option value="ja">일본어</option>
		<option value="zh-CN">중국어 간체</option>
		<option value="zh-TW">중국어 번체</option>
		<option value="vi">베트남어</option>
		<option value="id">인도네시아어</option>
		<option value="th">태국어</option>
		<option value="de">독일어</option>
		<option value="ru">러시아어</option>
		<option value="es">스페인어</option>
		<option value="it">이탈리아어</option>
		<option value="fr">프랑스어</option>	
	</select>
	<input type="text" name="papago_text" />
	<input type="button" value="번역" onclick="translation();"/>
	<select name="target">
		<option value="ko">한국어</option>
		<option value="en">영어</option>
		<option value="ja">일본어</option>
		<option value="zh-CN">중국어 간체</option>
		<option value="zh-TW">중국어 번체</option>
		<option value="vi">베트남어</option>
		<option value="id">인도네시아어</option>
		<option value="th">태국어</option>
		<option value="de">독일어</option>
		<option value="ru">러시아어</option>
		<option value="es">스페인어</option>
		<option value="it">이탈리아어</option>
		<option value="fr">프랑스어</option>
	</select>		
	<input type="text" name="papago_result" value="<%=result %>" />
	
</body>
</html>