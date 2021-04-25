<%@page import="com.project.fp.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function(){
		var op = document.getElementId("inputGroupSelect03");
	}
	function goback() {
		window.history.back();
	}
	
</script>
</head>
<body>
<%
	ProductDto dto = (ProductDto) session.getAttribute("dto");
%>
	<h1>SHOP_INSERTFORM</h1>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<%--z<input type="hidden" name="prod_num" value="<%=dto.getProd_num()%>" /> --%>
		<input type="hidden" name="command" value="shop_insertform" />
		
		
		<%--insertform 수정중 --%>
		
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="prod_name" size="100" placeholder="상품명을 입력해주세요.">
						</div>
					</div>
				</div>
				<div class="col-sm-3">
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect03" name="prod_category">
								<option selected>카테고리를 선택해 주세요.</option>
								<option value="1">사료/간식</option>
								<option value="2">케어</option>
								<option value="3">리빙</option>
								<option value="4">외출</option>
								<option value="5">장난감</option>
								<option value="6">패션</option>
							</select>
						</div>
					</div>

				<hr>

				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content" name="prod_explain"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 500
								});
							</script>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="custom-file">
							&nbsp;
							<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="goback();">취 소</button>
							<button type="submit" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">등 록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

</html>