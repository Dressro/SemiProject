package com.project.fp.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

class member{
	Session session;
	int num;
	public member(Session session, int num) {
		this.session = session;
		this.num = num;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
/**
 * Servlet implementation class ChatServelt
 */
@ServerEndpoint("/ChatServelt/{ch_num}")
public class ChatServelt  {
	int chat_num = 0;
	private static Set<member> clients = Collections.synchronizedSet(new HashSet<member>());
	
	@OnOpen
	public void onOpen(Session session , @PathParam("ch_num") int ch_num) {
		chat_num = ch_num;
		System.out.println(session);
		System.out.println(session.getId());
		System.out.println(ch_num);
		System.out.println("성공");
		member m = new member(session, ch_num);
		clients.add(m);
		System.out.println("크기는 : "+clients.size());
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			for(member client : clients) {
				if(!client.getSession().equals(session) && client.getNum() == chat_num) {
					client.session.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		synchronized (clients) {
			for(member client : clients) {
				if(client.getSession().equals(session) && client.getNum() == chat_num) {
					clients.remove(client);
				}
			}
		}
	}
}
