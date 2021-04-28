<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
* {
	font-family: 나눔고딕;
}

#messageWindow {
	background: black;
	color: greenyellow;
}

#inputMessage {
	width: 500px;
	height: 20px
}

#btn-submit {
	background: white;
	background: #F7E600;
	width: 60px;
	height: 30px;
	color: #607080;
	border: none;
}

#main_con {
	width: 600px;
	height: 680px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
}

#chat_con {
	vertical-align: bottom;
	border: 1px solid black;
	margin: 10px;
	min-height: 600px;
	max-height: 600px;
	overflow: scroll;
	overflow-x: hidden;
	background: #9bbbd4;
}

#bottom-con {
	margin: 10px;
}

.chat {
	font-size: 20px;
	color: black;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	text-align: left;
	height: auto;
	word-break: break-all;
	background: #ffffff;
	width: auto;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;
}

.notice {
	color: #607080;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #9bbbd4;
	display: block;
}

.my-chat {
	text-align: right;
	background: #F7E600;
	border-radius: 10px 10px 10px 10px;
}

.chat-box {
	text-align: left;
}

.my-chat-box {
	text-align: right;
}
</style>
</head>

<body>

	<div id="main_con">
		<div id="chat_con"></div>
		<div id="bottom_con">
			<input id="inputMessage" type="text" onkeyup="enterkey()" />
			<input id="btn-submit" type="submit" value="send" onclick="send();" />
		</div>
	</div>
</body>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:8787/SemiProject/ChatServelt');
	var inputMessage = document.getElementById('inputMessage');

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
		var c_msg = event.data;
		var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
		$('#chat-container').append($chat);
	}

	function onOpen(event) {
		alert("연결성공");

	}

	function onError(event) {
		alert(event.data);
	}

	function send() {
		var msg = inputMessage.value;
		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>"
				+ msg + "</div></div>");
		$('#chat_con').append($chat);
		webSocket.send(inputMessage.value);
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