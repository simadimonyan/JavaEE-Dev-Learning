import jakarta.websocket.*;

@jakarta.websocket.server.ServerEndpoint(value ="/test")
public class ServerEndpoint {

    @OnOpen
    public void onOpen(Session session) {
        System.out.println("Client Connected!");
    }

    @OnMessage
    public String onMessage(Session session, String message) {
        System.out.println("Received message: " + message);
        String reply = "Echo - " + message;
        System.out.println("Server: " + reply);
        return reply;
    }

    @OnClose
    public void onClose() {
        System.out.println("Client Disconnected!");
    }

    @OnError
    public void onError(Throwable t) {
        t.printStackTrace();
    }


}
