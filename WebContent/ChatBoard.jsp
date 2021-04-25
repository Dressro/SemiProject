<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<body>

	<fieldset>
		<textarea id="messageWindow" rows="10" cols="60" readonly="readonly"></textarea>
		<br>
		<input id="member_nickname" type="hidden" value="<%=dto.getMember_nicname()%>"/>
		<input id="inputMessage" type="text" onkeyup="enterkey()" />
		<input type="submit" value="send" onclick="send();" />
	</fieldset>
</body>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:8787/SemiProject/ChatServelt');
	var inputMessage = document.getElementById('inputMessage');
	var member_nickname = document.getElementById('member_nickname');

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};

	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	function onMessage(event) {
		var message = event.data.split(":");
		var sender = message[0];
		var content = message[1];
		textarea.value += sender+ " : "+ content + "\n";
	}

	function onOpen(event) {
		textarea.value += "연결 성공\n";
	}

	function onError(event) {
		alert(event.data);
	}

	function send() {
		textarea.value += member_nickname.value +" : " + inputMessage.value + "\n";
		webSocket.send(member_nickname.value +":" +inputMessage.value);
		$.ajax({
			url:"semi.do",
			method:"post",
			data:{command:"chat_insert", member_nickname:member_nickname.value, ch_content:inputMessage.value},
			dataType:"text",
			success: function(data){
				alert(data);
			},
			error(){
				alert("통신 실패");
			}
		});
		inputMessage.value = "";
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
	
	window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
</script>
</html>