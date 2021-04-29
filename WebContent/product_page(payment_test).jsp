<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function addr() {
		new daum.Postcode({
	   		oncomplete: function(data) {
	        	var roadAddr = data.roadAddress; 
	        	var extraRoadAddr = ''; 
	
	        	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            	extraRoadAddr += data.bname;
	        	}
	        
	        	if(data.buildingName !== '' && data.apartment === 'Y'){
	           		extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        	}
	
	        	if(extraRoadAddr !== ''){
	            	extraRoadAddr = ' (' + extraRoadAddr + ')';
	        	}
	
	        	document.getElementById('postcode').value = data.zonecode;
	        	document.getElementById("addr_1").value = roadAddr;
	        	document.getElementById("addr_1").value = data.jibunAddress;
	        
	        	if(data.autoRoadAddress) {
	        		document.getElementById("addr_1").value = roadAddr;
	        	} else if(data.autoJibunAddress) {
	        		document.getElementById("addr_1").value = data.jibunAddress;
	       		} else {
	        	}
	    	}
		}).open();
	}
	
	function check(){
		var email = $('input[name=email_1]').val() +"@"+ $('select[name=email_2]').val();
		$('input[name=email]').attr('value',email);
		var phone = $('input[name=phone_1]').val() +"-"+ $('input[name=phone_2]').val() +"-"+$('input[name=phone_3]').val(); 
		$('input[name=phone]').attr('value',phone);
		var address = $('input[name=address_1]').val() + " " + $('input[name=address_2]').val();
		$('input[name=address]').attr('value',address);
	}

</script>
</head>
<body>

	<h1>상품 결제 페이지(임시)</h1>

	<form action="semi.do" method="POST">
		<input type="hidden" name="command" value="payment" />
		<table border="1">
			<tr>
				<th>결제방식</th>
				<td>
					<select name="pay_method">
						<option value="card">신용카드</option>
						<option value="trans">실시간 계좌 이체</option>
						<option value="vbank">가상계좌</option>
						<option value="phone">휴대폰 소액 결제</option>
						<option value="cultureland">문화상품권</option>
						<option value="smartculture">스마트 문화상품권</option>
						<option value="happymoney">해피머니</option>
						<option value="booknlife">도서 문화상품권</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" name="product" />
				</td>
			</tr>
			<tr>
				<th>구매자 이름</th>
				<td>
					<input type="text" name="name" />
				</td>
			</tr>
			<tr>
				<th>구매지 email</th>
				<td>
					<input type="hidden" name="email" value="">
					<input type="text" name="email_1" maxlength="30">@
                    <select name="email_2">
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>gmail.com</option>
                        <option>nate.com</option>                        
                    </select>
				</td>
			</tr>
			<tr>
				<th>구매자 전화번호</th>
				<td>
					<input type="hidden" name="phone" value="">
					<input type="text" name="phone_1" maxlength="3" size="3" >-
					<input type="text" name="phone_2" maxlength="4" size="3" >-
					<input type="text" name="phone_3" maxlength="4" size="3" >
				</td>
			</tr>
			<tr>
				<th>구매자 주소</th>
				<td>
					<input type="hidden" name="address" value="">
					<input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
					<input type="button" onclick="addr();" value="우편번호 찾기"><br/>
					<input type="text" name="address_1" id="addr_1" placeholder="기본주소" readonly="readonly">
					<input type="text" name="address_2" id="addr_2" placeholder="상세주소" required="required">
				</td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td>
					<input type="text" name="totalPrice" />원
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" value="결제하기" onclick="check();"/>
					<input type="button" value="취소" onclick="location.href='index.jsp'" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>