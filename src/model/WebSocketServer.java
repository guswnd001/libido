package model;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/weball")
public class WebSocketServer {
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session) 
			throws IOException {
	System.out.println(message);
		synchronized (clients) {
			/* �޼����� '�̸�:' �߰��Ͽ� ����
			 �ӼӸ��� �޼��� �Է� â��  [��ȣ] �Է��ϸ� ��
			adminâ���� ��ȣ�� ���̰� �Ͽ� admin�� �ӼӸ��� �� �� �ְ� �Ѵ� */
	String id = null;
	if(message.indexOf(":[")>0) {
	id=message.substring(message.indexOf(":[")+2, 
			message.indexOf("]"));
	System.out.println("id:["+id+"]");	}
	String movemessage = session.getId()+":"+message;
	for (Session client : clients) {
				//�ڱ� �ڽ����״� ������ ����
	if(!client.equals(session)) {
	if(id==null) {
		client.getBasicRemote().sendText(movemessage);}
	// �ͼӸ� ����
	else if(id.equals(client.getId())){
	client.getBasicRemote().sendText(movemessage);
				}		}	
	
	
	
	}	}	}	
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
			clients.add(session);	}
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);	}}