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
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<h3>SHOP_INSERTFORM</h3>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="shop_insertres" />
		
		
		
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
							<div class="input-group mb-3">
								<select class="custom-select" id="inputGroupSelect03" name="prod_category">
									<option selected>카테고리를 선택해 주세요.</option>
									<option value="feed">사료/간식</option>
									<option value="care">케어</option>
									<option value="living">리빙</option>
									<option value="outing">외출</option>
									<option value="toy">장난감</option>
									<option value="fashion">패션</option>
								</select>
							</div>
						</div>
				
					<div class="col-sm-9">
						<div class="input-group mb-3">
							상품명* <input type="text" class="form-control" name="prod_name" size="30" required="required" >
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group mb-3">
							판매가* <input type="text" class="form-control" name="prod_price" size="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group mb-3">
							입고수량* <input type="text" class="form-control" name="prod_stock" size="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group mb-3">
							할인율(%)<input type="text" class="form-control" name="prod_sale" size="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="0">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group mb-3">
							제조사 <input type="text" class="form-control" name="prod_mfr" size="30" value="X">
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group mb-3">
							거래처 <input type="text" class="form-control" name="prod_client" size="30" value="X">
						</div>
					</div>
					<div class="col-sm-9" >
						<div class="input-group mb-12" >
							상품설명* <textarea rows="10" cols="40" class="form-control" name="prod_explain" required="required"></textarea>
						</div>
					</div>
				</div>
				
				<hr>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="custom-file">
							&nbsp;
							<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="location.href='semi.do?command=prodlist'">취 소</button>
							<button type="submit" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">등 록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
<jsp:include page="bottom.jsp" />
</body>
</html>