protocol
send: msg

	Transcript 
		cr; 
		nextPutAll: self transportCap securityCoordinator endpointString;
		nextPutAll: '>>';
		nextPutAll: 'sending... ';
		nextPutAll: msg asString;
		flush.
	self transportCap send: msg.