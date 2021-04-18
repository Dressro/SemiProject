<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
<body>

<h1>계정정보 찾기</h1>

<div class="tab">
  <button class="tablinks" onclick="openTab(event, 'findid')" id="defaultOpen">아이디찾기</button>
  <button class="tablinks" onclick="openTab(event, 'findpw')">비밀번호 찾기</button>
</div>

<div id="findid" class="tabcontent">
<form action="semi.do" method="post">
<h1>아이디 찾기</h1>
<p>회원 정보에 등록된 이메일과 입력한 이메일이 같아야 아이디를 찾을 수 있습니다.</p>
<table>
<tr>
<th>이름</th>
<td><input type="text" name="member_name" placeholder="이름" required="required"></td>
</tr>

<tr>
<th>이메일</th>
<td><input type="text" name="member_email" placeholder="이메일" required="required"></td>
</tr>
<tr>
<td colspan="2">
<button type="submit">인증번호 발송</button></td>
</tr>
</table>
</form>
</div>

<div id="findpw" class="tabcontent">
  <form action="semi.do" method="post">
<h1>비밀번호 찾기</h1>
<p>아이디를 입력 후, 본인확인을 통해 비밀번호를 다시 설정할 수 있습니다.</p>
<table>
<tr>
<th>아이디</th>
<td><input type="text" name="member_id" placeholder="아이디" required="required"></td>
</tr>

<tr>
<th>이메일</th>
<td><input type="text" name="member_email" placeholder="이메일" required="required"></td>
</tr>

<tr>
<td colspan="2">
<button type="submit">본인확인</button></td>
</tr>
</table>
</form>
</div>

<script>
function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</body>
</html>