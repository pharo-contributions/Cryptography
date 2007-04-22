SSLSocket is the endpoint for a stateful SSL Connection.  Upon initial connection, a negotiation for the appropriate cipher suite, the keys, and authentication of one or both parties is performed.  During this negotiation, the SSLSocket is considered to be in a state of Connecting and only at the completion of the negotiation is it considered to be Connected.  If the negotiation fails for some reason, the SSLSOcket will be in the state of Closed.  Only a Connected socket can send and receive data, although one can buffer send data while the SSLSocket is Connecting, and this data is buffered and then sent when the state switches to Connected.

A small button bar can be opened with the command:

SSLSocket openButtonBar.

This will open a button bar with buttons for a filtered browser of SSL classes and a Workspace which provides connectivity examples.  Try the SSLServer and SSLSocket connect examples.

An SSLSocket is to be used as the underlying transport for another application level service.  In this regard, there are an HttpsUrl and HttpsSocket which can be used to get http data over an SSLSocket.

The SSLServer manages certificates and their privateKeys so that the server side certificate operations can work.  This currently supports privateKeys generated from OpenSSL

The negotiation does not currently recognize sessions.  Nor does it support certificate requests made by the server of the client, for client authorization.  Two things to work on.  A nrmal negotiation goes like:

  CLIENT                                SERVER
ClientHello------------------------------>
       <--------------------------------ServerHello
       <---------------------------------Certificate
       <----------------------------ServerKeyExchange
       <------------------------------ServerHelloDone
ClientKeyExchange--------------------->
[ChangeCipherSpec]-------------------->
Finished--------------------------------->
       <------------------------------[ChangeCipherSpec]
       <----------------------------------Finished

In this implementation, there is a SSLHandshakeStateMachine which manages the states and the handshake messages sent for this negotiation.  A stack of expected states is built and as each incoming message is processed by the current state, that state is discarded and the next state is installed.  An out of order message will cause the connection to close.  Each time the next state is installed, any and all pending messages are sent.  This way, a paricular state can queue up any pending messages to be sent.  For instance, the server state WaitingForClientHello, the initial server state, can queue up all the messages it wants to send when it receives the ClientHello: ServerHello, Certificate, ServerKeyExchange (optional), ServerHelloDone.  Likewise, it can queue up all the states it expects to go through: WaitingForClientKeyExchange, WaitingForClientFinished, ClientFinished.

When processing the contents of these messages to establish an encrypted connection, use is made of the SSLSecurityCoordinator, which has subclasses for the different versions of the protocol.  This is due to the fact that different calculations are made between the different protocol versions.  It is here that one will find the Certificate processing, the masterSecret calculation, the keyBlock and key calculations, and the Finished msg calculations.

