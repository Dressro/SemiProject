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
	

	
</script>
</head>
<body>
<%
	ProductDto dto = (ProductDto) session.getAttribute("dto");
%>
	<h1>SHOP_INSERTFORM</h1>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="shop_insertform" />
		<input type="hidden" name="command" value="shop_insertres" />
		
		
		
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
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
				
					<div class="col-sm-9">
						<div class="input-group mb-3">
							상품명 : <input type="text" class="form-control" name="prod_name" size="30" ><br/>
							제조사 : <input type="text" class="form-control" name="prod_mfr" size="30" ><br/>
							거래처 : <input type="text" class="form-control" name="prod_client" size="30" ><br/>
							판매가 : <input type="text" class="form-control" name="prod_price" size="10" ><br/>
							할인율 : <input type="text" class="form-control" name="prod_sale" size="10" ><br/>
							입고수량 : <input type="text" class="form-control" name="prod_in" size="10" ><br/>
														
						</div>
					</div>
				</div>
				
				<hr>

				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content" name="prod_explain"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 200
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
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="#">취 소</button>
							<button type="button" class="btn btn-outline-secondary" onclick="location.href='semi.do?command=shop_insertres'"style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">등 록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>