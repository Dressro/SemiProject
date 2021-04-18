<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function idCheckConfirm(){
	var chk = document.getElementsByName("myid")[0].title;
	if(chk == "n") {
		alert("id 중복체크를 먼저 해주세요.");
		document.getElementsByName("myid")[0].focus();
	}
	}
	function idCheck(){
	var doc = document.getElementsByName("myid")[0];
	if(doc.value.trim() =="" || doc.value == null){
		alert("id를 입력해 주세요");
	} else {
		open("logincontroller.jsp?command=idchk&myid="+doc.value,"","width=200 , height= 200");
	}
	}

</script>
</head>
<body>
	
	<h1>일반회원 회원가입</h1>
	<div class="join_box">
		<div class="join_table">
			<form action="semi.do?" method="POST"></form>
			<input type="hidden" name="command" value="signup" />
			<input type="hidden" name="member_notify" value="n" />
			<table border="1">
				<tr>
					<th>아이디 *</th>
					<td>
						<input type="text" name="member_id" title="n" required="required" />
						<input type="button" value="중복체크" onclick="" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 *</th>
					<td>
						<input type="password" name="member_password" onclick="">
					</td>
				</tr>
				<tr>
					<th>비밀번호확인 *</th>
					<td>
						<input type="password" name="" onclick="">
					</td>
				</tr>
				<tr>
					<th>이름 *</th>
					<td>
						<input type="text" name="member_name" onclick="">
					</td>
				</tr>
				<tr>
					<th>닉네임 *</th>
					<td>
						<input type="text" name="member_nicname" maxlength="6" onclick="">
					</td>
				</tr>
				<tr>
					<th>이메일 *</th>
					<td>
						<input type="text" name="member_email" maxlength="30" onclick="">@
                        <select name="member_email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
					</td>
				</tr>
				<tr>
					<th>휴대폰 *</th>
					<td>
						<input type="text" name="member_phone_1" maxlength="3" size="3" >-
						<input type="text" name="member_phone_2" maxlength="4" size="3" >-
						<input type="text" name="member_phone" maxlength="4" size="3" >
					</td>
				</tr>
				<tr>
					<th>주소 *</th>
					<td>
						<input type="text" maxlength="5" placeholder="우편번호" readonly="readonly">
						<button type="button">우편번호</button>
						<input type="text" readonly="readonly" maxlength="50" placeholder="기본주소">
						<input type="text" name="member_addr" maxlength="50" placeholder="상세주소">
					</td>
				</tr>
				<tr>
                    <th>반려동물여부</th>
                    <td>
                        <input type="radio" name="member_animal" value="y" checked>있음
                		<input type="radio" name="member_animal" value="n" >없음
                    </td>
                </tr>
                <tr>
					<td colspan="9" align="right">
						<input type="submit" value="회원가입"/>
						<input type="button" value="취소" onclick="location.href='index.html'" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	
</body>
</html>