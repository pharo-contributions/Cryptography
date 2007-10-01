process
receiveMsg: msg

	Transcript 
		cr; 
		nextPutAll: self securityCoord endpointString;
		nextPutAll: '>>';
		nextPutAll: 'receiving... ';
		nextPutAll: msg asString;
		flush.
	self connection basicReceive: msg.
