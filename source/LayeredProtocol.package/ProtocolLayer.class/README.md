I am a single layer in a LayeredProtocol stack.  I pass information up and down the stack, possibly transforming it in the process.

Structure:
	down		(ProtocolLayer) My low protocol, one element closer to the "remote connection" end of the stack.
	up			(ProtocolLayer) My high protocol, one element closer to the user interface or other "local client".
	session		(LayeredProtocol) The entire collection of ProtocolLayers of which I am one.
