process
sendMsg: msg

	Transcript 
		cr; 
		nextPutAll: self securityCoord endpointString;
		nextPutAll: '>>';
		nextPutAll: 'sending... ';
		nextPutAll: msg asString;
		flush.
	self connection send: msg.
