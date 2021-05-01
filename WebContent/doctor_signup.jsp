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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}

						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}

						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("addr_1").value = roadAddr;
						document.getElementById("addr_1").value = data.jibunAddress;

						if (data.autoRoadAddress) {
							document.getElementById("addr_1").value = roadAddr;
						} else if (data.autoJibunAddress) {
							document.getElementById("addr_1").value = data.jibunAddress;
						} else {
						}
					}
				}).open();
	}
	function check() {
		var member_email = $('input[name=member_email_1]').val() + "@"
				+ $('select[name=member_email_2]').val();
		$('input[name=member_email]').attr('value', member_email);
		var member_phone = $('input[name=member_phone_1]').val() + "-"
				+ $('input[name=member_phone_2]').val() + "-"
				+ $('input[name=member_phone_3]').val();
		$('input[name=member_phone]').attr('value', member_phone);
		var member_addr = $('input[name=member_addr_1]').val() + " "
				+ $('input[name=member_addr_2]').val()
		$('input[name=member_addr]').attr('value', member_addr);
	}
	function idCheckConfirm() {
		var chk = document.getElementsByName("member_id")[0].title;
		if (chk == "n") {
			alert("id 중복체크를 먼저 해주세요.");
			document.getElementsByName("member_id")[0].focus();
		}
	}
	function idCheck() {
		var member_id = document.getElementsByName("member_id")[0];
		if (member_id.value.trim() == "" || member_id.value == null) {
			alert("id를 입력해 주세요");
		} else {
			open("semi.do?command=idchk&member_id=" + member_id.value, "",
					"width=300 , height= 300");
		}
	}
	$(function() {

		$('input[name=member_password]').keyup(function() {
			$('#chkNotice').html('');
		});

		$('input[name=member_password_chk]').keyup(
				function() {
					if ($('input[name=member_password]').val() != $(
							'input[name=member_password_chk').val()) {
						$('#chkNotice').html('비밀번호 일치하지 않음');
						$('#chkNotice').attr('color', '#f82a2aa3');
					} else {
						$('#chkNotice').html('비밀번호 일치함');
						$('#chkNotice').attr('color', '#199894b3');
					}

				});

	});
	
	function sendmailkey() {
		var member_email = $('input[name=member_email_1]').val() + "@"
				+ $('select[name=member_email_2]').val();
		var email_key = randomkey();
		$('input[name=email_key]').val(email_key);
		if ($('input[name=member_email_1]').val().trim() == ""
				|| $('input[name=member_email_1]').val() == null) {
			alert("이메일을 입력해 주세요");
		} else {
			open("semi.do?command=mailsend&member_email=" + member_email + "&email_key=" + email_key, "",
			"width=300 , height= 200");		
		}
	}
	
	function mailcheck() {
		if ($('input[name=email_user]').val() == $('input[name=email_key]').val()) {
			$('#mailchk').html('이메일 인증 완료');
			$('#mailchk').attr('color', '#199894b3');
			$('input[name=email_certification]').val('true');
		} else {
			$('#mailchk').html('인증번호가 틀립니다.');
			$('#mailchk').attr('color', '#f82a2aa3');
			$('input[name=email_certification]').val('false');
		}
	}

	function sendsms() {
		var member_phone = $('input[name=member_phone_1]').val()
				+ $('input[name=member_phone_2]').val()
				+ $('input[name=member_phone_3]').val();
		var phone_key = randomkey();
		$('input[name=phone_key]').val(phone_key);
		if ($('input[name=member_phone_1]').val().trim() == ""
				|| $('input[name=member_phone_1]').val() == null) {
			alert("전화번로를 입력해 주세요");
		} else {
			open("semi.do?command=smssend&member_phone=" + member_phone + "&phone_key=" + phone_key, "",
					"width=300 , height= 200");
		}
	}
	
	function phonecheck() {
		if ($('input[name=phone_user]').val() == $('input[name=phone_key]').val()) {
			$('#phonechk').html('휴대폰 번호 인증 완료');
			$('#phonechk').attr('color', '#199894b3');
			$('input[name=phone_certification]').val('true');
		} else {
			$('#phonechk').html('인증번호가 틀립니다.');
			$('#phonechk').attr('color', '#f82a2aa3');
			$('input[name=phone_certification]').val('false');
		}
	}
	
	function randomkey() {
		var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
		var string_length = 10;
		var randomstring = '';
		for (var i=0; i<string_length; i++) {
			var rnum = Math.floor(Math.random() * chars.length);
			randomstring += chars.substring(rnum,rnum+1);
		}
		return randomstring;
	}
	
</script>

<style type="text/css">
#animal {
	display: none;
}

.general_signup_idpw {
	height: 500px;
}

#general_signup_mid {
	width: 500px;
	margin: 0 auto;
	min-height: 1000px;
}

.general_signup_idpw {
	height: 500px;
}

.general_signup_span {
	display: block;
	border: solid 1px #dadada;
	width: 450px;
	height: 50px;
}

.general_signup_span_home_addr {
	display: block;
	border: solid 1px #dadada;
	width: 450px;
	height: 60px;
}

.general_signup_animal {
	display: block;
	padding-top: 10px;
	border: none;
	width: 400px;
	height: 50px;
}

.general_signup_text {
	display: inline-block;
	height: 40px;
	width: 75%;
	border: none;
	padding-left: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 5px;
}

#general_signup_email {
	display: inline-block;
	height: 40px;
	width: 40%;
	border: solid 1px #dadada;
	padding-left: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 5px;
}

.general_signup_phone {
	display: inline-block;
	height: 40px;
	width: 20%;
	border: solid 1px #dadada;
	padding-left: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 5px;
}

.general_signup_addr {
	border: solid 1px #dadada;
	padding-left: 10px;
}

.general_signup_title {
	display: block;
	margin-bottom: 3px;
	margin-top: 10px;
}

.general_signup_home_addr {
	height: 70px;
}

.general_signup_age, .general_signup_weight,
	.general_signup_animal_gender, .general_signup_animal_yn {
	display: inline-block;
	padding-right: 10px;
	margin-bottom: 3px;
	margin-top: 10px;
	height: 20px;
}

#general_signup_btn {
	padding-top: 10px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="general_signup_mid">
		<h3>회원가입(전문의)</h3>
		<div class="join_table">
			<div id="member_join">
				<form action="semi.do" method="POST">
					<input type="hidden" name="command" value="signupres" />
					<input type="hidden" name="member_notify" value="N" />
					<input type="hidden" name="member_grade" value="전문의" />
					<input type="hidden" name="member_animal" value="N" />
					<div id="general_signup_idpw">
						<div class="general_signup_row">
							<h4 class="general_signup_title">아이디 *</h4>
							<div class="general_signup_id">
								<span class="general_signup_span"> <input class="general_signup_text" type="text" title="n" name="member_id" required="required" /> <input type="button" name="member_id_chk" value="중복체크" onclick="idCheck();" />
								</span>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">비밀번호 *</h4>
							<div class="general_signup_pw">
								<span class="general_signup_span"> <input class="general_signup_text" type="password" name="member_password" onclick="idCheckConfirm();">
								</span>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">비밀번호 확인 *</h4>
							<div class="general_signup_pw">
								<span class="general_signup_span"> <input class="general_signup_text" type="password" name="member_password_chk" onclick="idCheckConfirm();">
								</span>
							</div>
							<font id="chkNotice" size="2"></font>
						</div>
					</div>
					<div id="general_signup_info">
						<div class="general_signup_row">
							<h4 class="general_signup_title">이름 *</h4>
							<div class="general_signup_name">
								<span class="general_signup_span"> <input class="general_signup_text" type="text" name="member_name" onclick="idCheckConfirm();">
								</span>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">닉네임 *</h4>
							<div class="general_signup_nickname">
								<span class="general_signup_span"> <input class="general_signup_text" type="text" name="member_nicname" maxlength="10" onclick="idCheckConfirm();">
								</span>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">이메일 *</h4>
							<div class="general_signup_email">
								<input type="hidden" name="member_email" value="">
								<span class="general_signup_span"> <input type="text" id="general_signup_email" name="member_email_1" maxlength="30" onclick="idCheckConfirm();"> @ <select name="member_email_2">
										<option>naver.com</option>
										<option>daum.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
									</select> 
								<input type="button" name="email_send" value="인증번호 받기" onclick="sendmailkey();" />
								</span>
							</div>
							<div>
								인증번호
								<input type="text" name="email_user" />
								<input type="hidden" name="email_key" value="">
								<input type="hidden" name="email_certification" value="false">
								<input type="button" value="인증하기" onclick="mailcheck();" />
								<font id="mailchk" size="2"></font>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">휴대폰 *</h4>
							<div class="general_signup_moblie_phone">
								<span class="general_signup_span"> <input type="hidden" name="member_phone" value=""> <input class="general_signup_phone" type="text" name="member_phone_1" maxlength="3" size="3"> - <input class="general_signup_phone" type="text" name="member_phone_2" maxlength="4" size="3"> - <input class="general_signup_phone" type="text" name="member_phone_3" maxlength="4" size="3"> <input type="button" value="문자 전송" onclick="sendsms();" />
								</span>
							</div>
							<div>
								인증번호
								<input type="text" name="phone_user" />
								<input type="hidden" name="phone_key" value="">
								<input type="hidden" name="phone_certification" value="false">
								<input type="button" value="인증하기" onclick="phonecheck();" />
								<font id="phonechk" size="2"></font>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">주소 *</h4>
							<div class="general_signup_home_addr">
								<span class="general_signup_span_home_addr">
									<input type="hidden" name="member_addr" value="">
									<input class="general_signup_addr" type="text" id="postcode" placeholder="우편번호" readonly="readonly">
									<input type="button" onclick="address();" value="우편번호 찾기">
									<br>
									<input class="general_signup_addr" type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" readonly="readonly">
									<input class="general_signup_addr" type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" required="required">
								</span>
							</div>
						</div>
						<div class="general_signup_row">
							<h4 class="general_signup_title">소속기관(병원 등) *</h4>
							<div class="general_signup_aff">
								<span class="general_signup_span"> <input class="general_signup_text" type="text" name="member_nicname" maxlength="10" onclick="idCheckConfirm();">
								</span>
							</div>
						</div>
						<div id="general_signup_btn">
							<input type="submit" value="회원가입" onclick="check();" />
							<input type="button" value="취소" onclick="location.href='index.jsp'" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>