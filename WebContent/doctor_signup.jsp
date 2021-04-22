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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function address() {
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
		var member_email = $('input[name=member_email_1]').val() +"@"+ $('select[name=member_email_2]').val();
		$('input[name=member_email]').attr('value',member_email);
		var member_phone = $('input[name=member_phone_1]').val() +"-"+ $('input[name=member_phone_2]').val() +"-"+$('input[name=member_phone_3]').val(); 
		$('input[name=member_phone]').attr('value',member_phone);
		var member_addr = $('input[name=member_addr_1]').val() + " " + $('input[name=member_addr_2]').val()
		$('input[name=member_addr]').attr('value',member_addr);
	}
	function idCheckConfirm(){
	var chk = document.getElementsByName("member_id")[0].title;
	if(chk == "n") {
		alert("id 중복체크를 먼저 해주세요.");
		document.getElementsByName("member_id")[0].focus();
	}
	}
	function idCheck(){
		var member_id = document.getElementsByName("member_id")[0];
		if(member_id.value.trim() =="" || member_id.value == null){
			alert("id를 입력해 주세요");
		} else {
			open("semi.do?command=idchk&member_id="+member_id.value,"","width=300 , height= 300");
	}
	}
	$(function(){
		
	    $('input[name=member_password]').keyup(function(){
	      $('#chkNotice').html('');
	    });

	    $('input[name=member_password_chk]').keyup(function(){
	        if($('input[name=member_password]').val() != $('input[name=member_password_chk').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음');
	          $('#chkNotice').attr('color', '#f82a2aa3');
	        } else{
	          $('#chkNotice').html('비밀번호 일치함');
	          $('#chkNotice').attr('color', '#199894b3');
	        }

	    });
	    
	});
</script>
</head>
<body>
	
	<h1>전문의 회원가입</h1>
	<div class="join_box">
		<div class="join_table">
			<form action="semi.do" method="POST">
			<input type="hidden" name="command" value="signupres" />
			<input type="hidden" name="member_notify" value="N" />
			<input type="hidden" name="member_grade" value="전문의" />
			<input type="hidden" name="member_animal" value="N"/>
			<table border="1">
				<tr>
					<th>아이디 *</th>
					<td>
						<input type="text" title="n" name="member_id" required="required"/>
						<input type="button" name="member_id_chk" value="중복체크" onclick="idCheck();" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 *</th>
					<td>
						<input type="password" name="member_password" onclick="idCheckConfirm();">
					</td>
				</tr>
				<tr>
					<th>비밀번호확인 *</th>
					<td>
						<input type="password" name="member_password_chk" onclick="idCheckConfirm();">
						<font id="chkNotice" size="2"></font>
					</td>
				</tr>
				<tr>
					<th>이름 *</th>
					<td>
						<input type="text" name="member_name" onclick="idCheckConfirm();">
					</td>
				</tr>
				<tr>
					<th>닉네임 *</th>
					<td>
						<input type="text" name="member_nicname" maxlength="5" onclick="idCheckConfirm();">
					</td>
				</tr>
				<tr>
					<th>이메일 *</th>
					<td>
						<input type="hidden" name="member_email" value="">
						<input type="text" name="member_email_1" maxlength="30" onclick="idCheckConfirm();">@
                        <select name="member_email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                        <input type="button" name="email_send" value="인증번호 전송" onclick="sendmailkey();" />
					</td>
				</tr>
				<tr>
					<th>휴대폰 *</th>
					<td>
						<input type="hidden" name="member_phone" value="">
						<input type="text" name="member_phone_1" maxlength="3" size="3" >-
						<input type="text" name="member_phone_2" maxlength="4" size="3" >-
						<input type="text" name="member_phone_3" maxlength="4" size="3" >
					</td>
				</tr>
				<tr>
					<th>주소 *</th>
					<td>
						<input type="hidden" name="member_addr" value="">
						<input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
						<input type="button" onclick="address();" value="우편번호 찾기"><br>
						<input type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" readonly="readonly">
						<input type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" required="required">
					</td>
				</tr>
				<tr>
                    <th>전문의소속</th>
                    <td>
                        <input type="text" name="member_dr_info" maxlength="50" >
                    </td>
                </tr>
                <tr>
					<td colspan="9" align="right">
						<input type="submit" value="회원가입" onclick="check();"/>
						<input type="button" value="취소" onclick="location.href='index.html'" />
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	
</body>
</html>