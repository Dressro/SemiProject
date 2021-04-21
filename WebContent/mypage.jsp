<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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


<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
		$('.mymenus li').click(function(){
		$('.mymenus li').find('a').removeClass('active');
	    $(this).find('a').addClass('active');
	    $('.mypage').hide();		   
		var i = $(this).index();
		$('.mypage').eq(i).show();
	});
		$('.mymenus li').eq(0).trigger('click');
});

</script>
<style>


nav {
  float: left;
  padding: 20px;
  }
  
</style>


</head>
<body>
	

<section>
  <nav>
    <ul class="mymenus">
      <li><a class="mymenu" href="#">마이페이지</a></li>
      <li><a class="mymenu" href="#">주문내역</a></li>
      <li><a class="mymenu" href="#">취소/반품/교환/환불내역</a></li>
      <li><a class="mymenu" href="#">회원정보수정</a></li>
     <li><a class="mymenu" href="#">회원탈퇴</a></li>
    </ul>
  </nav>
  
</section>

<div class = "mypage-body">
<section class="mypage">
<table border="1">

	<tr>

	<th>등급</th>
	<th>적립금</th>
	</tr>
	
	<tr>
	<td>등급</td>
	<td>적립금</td>
	</tr>
	
<tr>
	<th colspan="2">주문내역</th>
	
	<tr>
	<td colspan="2">배송현황</td>
	</tr>


	<tr>
	<th colspan="2">주문내역</th>
	
	<tr>
	<td colspan="2">주문내역</td>
	</tr>


</table>
</section>
<section class="mypage">

<table border="1">
<tr>
	<th colspan="2">주문내역</th>
	
	<tr>
	<td colspan="2">배송현황</td>
	</tr>


	<tr>
	<th colspan="2">주문내역</th>
	
	<tr>
	<td colspan="2">주문내역</td>
	</tr>


</table>
</section>

<section class="mypage">
<table border="1">
<tr>
	<th colspan="2">취소/반품/교환/환불내역</th>
	<tr>
	<td colspan="2">주문내역</td>
	</tr>
</table>
</section>

<section class="mypage">

			<table border="1">
			<tr>
			<th>회원정보 수정</th></tr>
				
				<tr>
					<th>아이디 *</th>
					<td>
						<input type="text" name="member_id" title="n" />
						<input type="button" value="중복체크" onclick="idCheck();" />
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
						<input type="text" id="postcode" placeholder="우편번호">
						<input type="button" onclick="address();" value="우편번호 찾기"><br>
						<input type="text" name="member_addr_1" id="addr_1" placeholder="기본주소">
						<input type="text" name="member_addr_2" id="addr_2" placeholder="상세주소">
					</td>
				</tr>
				<tr>
                    <th>반려동물여부</th>
                    <td>
                        <input type="radio" name="member_animal" value="N" onclick="chk(this.value);" checked>없음
                		<input type="radio" name="member_animal" value="Y" onclick="chk(this.value);">있음
                    </td>
                </tr>
             
               <tr class="animal">
               <th><h1>반려동물 정보</h1></th>
               </tr>
				<tr class="animal">
					<th>이름 *</th>
					<td>
						<input type="text" name="animal_name" />
					</td>
				</tr>
				<tr class="animal">
					<th>성별 *</th>
					<td>
						<input type="radio" id="animal_gen_chk" name="animal_gen" value="M"><img src="resources/images/male.svg" style="width: 20px; height: 20px;">
                		<input type="radio" name="animal_gen" value="F" ><img src="resources/images/female.svg" style="width: 20px; height: 20px;">
					</td>
				</tr>
				<tr class="animal">
					<th>품종</th>
					<td>
						<input type="text" name="animal_type" maxlength="20"/>
					</td>
				</tr>
				<tr class="animal">
					<th>나이</th>
					<td>
						<select name="animal_age">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                        </select>
					</td>
				</tr>
				<tr class="animal">
					<th>체중</th>
					<td>
						<select name="animal_weight">
							<option value="1">1kg</option>
                            <option value="2">2kg</option>
                            <option value="3">3kg</option>
                            <option value="4">4kg</option>
                            <option value="5">5kg</option>
                            <option value="6">6kg</option>
                            <option value="7">7kg</option>
                            <option value="8">8kg</option>
                            <option value="9">9kg</option>
                            <option value="10">10kg</option>
                            <option value="11">11kg</option>
                            <option value="12">12kg</option>
                            <option value="13">13kg</option>
                            <option value="14">14kg</option>
                            <option value="15">15kg</option>
                            <option value="16">16kg</option>
                            <option value="17">17kg</option>
                            <option value="18">18kg</option>
                            <option value="19">19kg</option>
                            <option value="20">20kg</option>
                            <option value="21">21kg</option>
                            <option value="22">22kg</option>
                            <option value="23">23kg</option>
                            <option value="24">24kg</option>
                            <option value="25">25kg</option>
                            <option value="26">26kg</option>
                            <option value="27">27kg</option>
                            <option value="28">28kg</option>
                            <option value="29">29kg</option>
                            <option value="30">30kg</option>
						</select>
					</td>
				</tr>
				<tr class="animal">
					<th>특이사항(질병,기타사항)</th>
					<td>
						<textarea rows="10" cols="30" name="animal_unq"></textarea>
					</td>
				</tr>
                <tr>
					<td colspan="9" align="right">
						<input type="submit" value="회원정보수정" onclick="#"/>
						<input type="button" value="취소" onclick="location.href='index.html'" />
					</td>
				</tr>
			</table>
</section>

<section class="mypage">

<table border="1">
<tr>
	<th>회원탈퇴</th>
	<tr>
	<td>회원정보</td>
	</tr>

</table>
</section>
</div>

</body>
</html>