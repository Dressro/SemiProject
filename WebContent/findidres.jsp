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

.tab button:hover {
  background-color: #ddd;
}

.tab button.active {
  background-color: #ccc;
}

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
</div>

<div id="findid" class="tabcontent">
<form action="semi.do" method="post">
<input type="hidden" name="commamd" value="findidpw" />

<h1>아이디 찾기</h1>
<p>회원 정보에 등록된 이메일과 입력한 이메일이 같아야 아이디를 찾을 수 있습니다.</p>
<table>
<tr>
<th>

<%
	String id = (String)request.getAttribute("id");
	boolean check = id!=null;
	String msg= check ? "고객님의 아이디는 다음과 같습니다.<br>"+id : "미등록 ID 입니다.";
%></th>
	<td><h4><%=msg%></h4></td>
	
	<td><input type="button" value="메인으로" onclick="location.href='index.html'"></td>
	<td><input type="button" value="로그인" onclick="location.href='login.jsp'"></td>
	


</table>
</form>
</div>


<script>

function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "block";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}

document.getElementById("defaultOpen").click();


</script>
</body>
</html>