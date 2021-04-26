<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.animal {
		display: none;
	}
</style>
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
	
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<%
		String member_id = request.getParameter("member_id");
	%>
	<h3>일반회원 회원가입</h3>
	
		<div class="join_table">
			<div id="member_join">
			<form action="semi.do" method="POST">
			<input type="hidden" name="member_id" value="<%=member_id %>"/>
			<input type="hidden" name="command" value="sns_signupres" />
			<input type="hidden" name="member_notify" value="N" />
			<input type="hidden" name="member_dr_info" value="없음"/>
			<input type="hidden" name="member_grade" value="전문의" />
			<input type="hidden" name="member_animal" value="N"/>
			<table border="1">
				<tr>
					<th>이름 *</th>
					<td>
						<input type="text" name="member_name" required="required">
					</td>
				</tr>
				<tr>
					<th>닉네임 *</th>
					<td>
						<input type="text" name="member_nicname" maxlength="10" required="required">
					</td>
				</tr>
				<tr>
					<th>이메일 *</th>
					<td>
						<input type="hidden" name="member_email" value="">
						<input type="text" name="member_email_1" maxlength="30" required="required">@
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
						<input type="hidden" name="member_phone" >
						<input type="text" name="member_phone_1" maxlength="3" size="3" required="required">-
						<input type="text" name="member_phone_2" maxlength="4" size="3" required="required">-
						<input type="text" name="member_phone_3" maxlength="4" size="3" required="required">
					</td>
				</tr>
				<tr>
					<th>주소 *</th>
					<td>
						<input type="hidden" name="member_addr" value="">
						<input type="text" id="postcode" placeholder="우편번호">
						<input type="button" onclick="address();" value="우편번호 찾기"><br>
						<input type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" >
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
<jsp:include page="bottom.jsp" />	
</body>
</html>