<h1>Hello, World!</h1>
<body>
	<form>
      <input id="textMessage" type="text">
      <input onClick="sendMessage();" value="Send Message" type="button">
    </form>
        <br><textarea id="messagesTextArea" rows="10" cols="50"></textarea>
        <script type="text/javascript">
            let webSocket = new WebSocket("ws://localhost:8080/DAppAPI/test");
            let messages = document.getElementById("messagesTextArea");
            webSocket.onopen = function(message) { processOnOpen(message); };
            webSocket.onmessage = function(message) { processOnMessage(message); };
            webSocket.onclose = function(message) { processOnClose(message); };
            webSocket.onerror = function(message) { processOnError(message); };

            function sendMessage() {
                if (textMessage.value != "close" && textMessage.value != "open") {
                    webSocket.send(textMessage.value);
                    messagesTextArea.value += "Sending to server: => " + textMessage.value + "\n";
                    textMessage.value = "";
                }
                else if (textMessage.value == "close") {
                    webSocket.close();
                    textMessage.value = "";
                }
            }

            function processOnOpen(message) {
                messagesTextArea.value += "Server Connected! \n";
            }

            function processOnMessage(message) {
                messagesTextArea.value += "Receiving from server: => " + message.data + "\n";
            }

            function processOnClose(message) {
                webSocket.send("Client Disconnected!");
                messagesTextArea.value += "Server Disconnected! \n";
            }

            function processOnError(message) {
                messagesTextArea.value += "Error Occurred! \n";
            }

        </script>
</body>